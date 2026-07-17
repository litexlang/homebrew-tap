class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "0.9.104-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/0.9.104-beta/litex_0.9.104-beta_darwin_arm64.tar.gz"
    sha256 "7d1d5d869679335dc4e6e51f541778b60cc13ecb2d588888a48907fb0b97cfe0"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/0.9.104-beta/litex_0.9.104-beta_linux_arm64.tar.gz"
      sha256 "d604be6cd10d1b1c72d60e6cf4edfeeb5eb82ecfe53d87ad554658eddc785642"
    else
      url "https://github.com/litexlang/golitex/releases/download/0.9.104-beta/litex_0.9.104-beta_linux_amd64.tar.gz"
      sha256 "d8de5f5c610acfc8542aa47b7824e66ba95096d4b84af73f75ab0b84c3578d06"
    end
  end

  def install
    bin.install "litex"
  end

  test do
    assert_match "litex 0.9.104-beta", shell_output("#{bin}/litex -version")
    (testpath/"test.lit").write "1 = 1\n"
    output = shell_output("#{bin}/litex -f #{testpath}/test.lit")
    assert_match '"type": "equality fact"', output
    refute_match '"result": "error"', output
  end
end
