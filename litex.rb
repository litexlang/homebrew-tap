class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "0.9.95-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/0.9.95-beta/litex_0.9.95-beta_darwin_arm64.tar.gz"
    sha256 "4c71a8a9c91fbd50193faecd04e065742e43cd5519264e20e1b5823e3a3a037e"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/0.9.95-beta/litex_0.9.95-beta_linux_arm64.tar.gz"
      sha256 "e6c766e913b653aca71c0b459e492509f66e33400489f5e1ae1d5ca92b8e2bc7"
    else
      url "https://github.com/litexlang/golitex/releases/download/0.9.95-beta/litex_0.9.95-beta_linux_amd64.tar.gz"
      sha256 "b17cd8c901fb96f16e7b38c4830d036950b5f85f07adf12b8d53e058954a66f2"
    end
  end

  def install
    bin.install "litex"
    pkgshare.install "std"
  end

  test do
    assert_match "litex 0.9.95-beta", shell_output("#{bin}/litex -version")
    (testpath/"test.lit").write "import Trig\nTrig::sin(0) = 0\n"
    output = shell_output("#{bin}/litex -f #{testpath}/test.lit")
    assert_match "Trig::sin(0) = 0", output
    refute_match '"result": "error"', output
  end
end
