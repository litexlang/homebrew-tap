require "json"

class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "1.2.2-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/1.2.2-beta/litex_1.2.2-beta_darwin_arm64.tar.gz"
    sha256 "9e68f3b913d28278a92d85213375d6d1902ad91aac79bd44e8641e2e0cacabd3"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/1.2.2-beta/litex_1.2.2-beta_linux_arm64.tar.gz"
      sha256 "1d208d54c3ff692d0b972574649598071d20e281b85b371569ed5762803cc2be"
    else
      url "https://github.com/litexlang/golitex/releases/download/1.2.2-beta/litex_1.2.2-beta_linux_amd64.tar.gz"
      sha256 "f01ced82d93e2b8f0e305d386cc49ed534439689258e8c9530841a8506deb7bd"
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
