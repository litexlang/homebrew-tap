require "json"

class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "1.0.6-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/1.0.6-beta/litex_1.0.6-beta_darwin_arm64.tar.gz"
    sha256 "aebf712669500e8448a5e86dd2c42d8717c56625e42f843176547989bfb5e5fc"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/1.0.6-beta/litex_1.0.6-beta_linux_arm64.tar.gz"
      sha256 "430f5f9adf59115371ead36d41daff18da9af3540c6b988e2bea6eef0a93fbce"
    else
      url "https://github.com/litexlang/golitex/releases/download/1.0.6-beta/litex_1.0.6-beta_linux_amd64.tar.gz"
      sha256 "4f0cb33b7dc81926c07688ee6d2f681cb49df0067bcb00c95896d1905498cf01"
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
    ENV["LITEX_STD_PATH"] = (bin/"std").to_s
    output = JSON.parse(shell_output("#{bin}/litex -lang en -f #{testpath}/test.lit"))
    assert_equal "run", output.fetch("kind")
    assert_equal true, output.fetch("success")
    assert_nil output.fetch("session_error")
  end
end
