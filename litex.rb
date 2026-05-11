class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "0.9.80-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/0.9.80-beta/litex_0.9.80-beta_darwin_arm64"
    sha256 "73ae73e8fdbbad52e9934a29d8551b6e7a58457d7304d54971dc31c4f402be0d"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/0.9.80-beta/litex_0.9.80-beta_linux_arm64"
      sha256 "b79929b08f0a9d7785c6746615db1b1bc771c25e98eba443d782bc843e2c8335"
    else
      url "https://github.com/litexlang/golitex/releases/download/0.9.80-beta/litex_0.9.80-beta_linux_amd64"
      sha256 "2dbc535a21b977fcb94c08fe0ba6d58f3be89412bf67cf98eea5b23c50485c21"
    end
  end

  def install
    bin.install Dir["litex_*"].first => "litex"
  end

  test do
    assert_match "litex 0.9.80-beta", shell_output("#{bin}/litex -version")
  end
end
