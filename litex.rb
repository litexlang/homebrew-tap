class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "0.9.101-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/0.9.101-beta/litex_0.9.101-beta_darwin_arm64.tar.gz"
    sha256 "947693c476d164193fae6257db51d8e9e5b5a8a2b6dcb7428a66b915e9998cbe"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/0.9.101-beta/litex_0.9.101-beta_linux_arm64.tar.gz"
      sha256 "15c9ba041ffd8eec215b8622f65d16a5536ede19e852ea798876187fab5c8742"
    else
      url "https://github.com/litexlang/golitex/releases/download/0.9.101-beta/litex_0.9.101-beta_linux_amd64.tar.gz"
      sha256 "3f2b69b739c81ea233f8c566161d6447f85d669c9d43dfef96253e1b79c18382"
    end
  end

  def install
    bin.install "litex"
    pkgshare.install "std"
  end

  test do
    assert_match "litex 0.9.101-beta", shell_output("#{bin}/litex -version")
    (testpath/"test.lit").write "import Trig\nTrig::sin(0) = 0\n"
    output = shell_output("#{bin}/litex -f #{testpath}/test.lit")
    assert_match '"type": "equality fact"', output
    assert_match "Trig::sin(0)", output
    refute_match '"result": "error"', output
  end
end
