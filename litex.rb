class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "0.9.69-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/0.9.69-beta/litex_0.9.69-beta_darwin_arm64"
    sha256 "13b11c1cda3e9d7746808e3b56a6f598247796233a63950759a2b19a8b304a45"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/0.9.69-beta/litex_0.9.69-beta_linux_arm64"
      sha256 "d63464aec968f46c918a5eb15686b36e86164063827edf17e4922460de5033db"
    else
      url "https://github.com/litexlang/golitex/releases/download/0.9.69-beta/litex_0.9.69-beta_linux_amd64"
      sha256 "030d9e75a5cfe75f166eebd6db3e3ac238ed2f52ef2316bb1977ec405ee71b8e"
    end
  end

  def install
    bin.install Dir["litex_*"].first => "litex"
  end

  test do
    assert_match "litex 0.9.69-beta", shell_output("#{bin}/litex -version")
  end
end
