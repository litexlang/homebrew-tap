require "json"

class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "1.0.10-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/1.0.10-beta/litex_1.0.10-beta_darwin_arm64.tar.gz"
    sha256 "f7303627e4acb5ae1fdddccbee72296d557a22e192601a1230c40af32d30c183"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/1.0.10-beta/litex_1.0.10-beta_linux_arm64.tar.gz"
      sha256 "34bcec0696f5a3ebed2c18bc47a4a583dfea75b01c73c57be3e455177117174e"
    else
      url "https://github.com/litexlang/golitex/releases/download/1.0.10-beta/litex_1.0.10-beta_linux_amd64.tar.gz"
      sha256 "bfd3727305e8e6fa18d10f85811a82ab390271b0be05bd83ca8fcb5dbc0bc37f"
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
