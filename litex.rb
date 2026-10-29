require "json"

class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "1.1.10-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/1.1.10-beta/litex_1.1.10-beta_darwin_arm64.tar.gz"
    sha256 "a97c7363dff0dde21894e10d6143c24ddf2d7487735bffafd23afbcf272601ad"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/1.1.10-beta/litex_1.1.10-beta_linux_arm64.tar.gz"
      sha256 "f4995883b9afdc6dca1f6c9bbdf61b5184c27e43f321e9ab65677a8dc46c9256"
    else
      url "https://github.com/litexlang/golitex/releases/download/1.1.10-beta/litex_1.1.10-beta_linux_amd64.tar.gz"
      sha256 "26344b03a59a9c6de364ec97691aef6b5bc16cd10cd5f1759b44829b0f88447d"
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
