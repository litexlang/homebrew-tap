require "json"

class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "1.1.0-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/1.1.0-beta/litex_1.1.0-beta_darwin_arm64.tar.gz"
    sha256 "0f5a1cba0199163a86c341f8fd42d614deebb0399ff030b74f712df8d9bc77a8"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/1.1.0-beta/litex_1.1.0-beta_linux_arm64.tar.gz"
      sha256 "69d23fd4ffc7661960d14c0c65284909de50776b35d4eac65e8fbe00c960e57f"
    else
      url "https://github.com/litexlang/golitex/releases/download/1.1.0-beta/litex_1.1.0-beta_linux_amd64.tar.gz"
      sha256 "497f1e0280f4dae1b9c926fa88113bc7ebef5fdd9db3c30a0bbfb47505376e31"
    end
  end

  def install
    bin.install "litex"
    (bin/"std").install Dir["std/*"]
  end

  test do
    version_output = shell_output("#{bin}/litex -version")
    assert_equal "Litex #{version}\n", version_output
    (testpath/"litex.config").write "[import std]\nbasics\n[export]\ntest = \"./test.lit\"\n"
    (testpath/"test.lit").write "quot(-7, 3) = -3\n$dvd(12, 3)\n"
    ENV.delete("LITEX_STD_PATH")
    output = JSON.parse(shell_output("#{bin}/litex -lang en -strict -f #{testpath}/test.lit"))
    assert_equal "run", output.fetch("kind")
    assert_equal "normal", output.fetch("detail")
    assert_equal "success", output.fetch("run_result")
    assert_equal false, output.fetch("session_terminated")
    assert_nil output.fetch("termination")
    results = output.fetch("statement_results")
    refute_empty results
    assert results.all? { |row| row.fetch("statement_result") == "accepted" }
  end
end
