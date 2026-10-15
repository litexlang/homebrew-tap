require "json"

class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "1.1.1-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/1.1.1-beta/litex_1.1.1-beta_darwin_arm64.tar.gz"
    sha256 "4f9fe881fe05216b3b030fd87b8da15ae563af08c99ac79672c1a2db375ab730"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/1.1.1-beta/litex_1.1.1-beta_linux_arm64.tar.gz"
      sha256 "2a75d7aab34a7e461d3293e385318e6d06af46ca98f4a0ec8345a17a76a49fc3"
    else
      url "https://github.com/litexlang/golitex/releases/download/1.1.1-beta/litex_1.1.1-beta_linux_amd64.tar.gz"
      sha256 "1073a609a579f8d41078398f73e6d83be4190007db5a0ab64406ab1af82fe456"
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
