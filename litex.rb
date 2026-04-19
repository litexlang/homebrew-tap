class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "0.9.65-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/0.9.65-beta/litex_0.9.65-beta_darwin_arm64"
    sha256 "31ae7cad2bc71e44e4789488f8d57c7d068c627e2bcec1ddca7a6ddb8b70936d"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/0.9.65-beta/litex_0.9.65-beta_linux_arm64"
      sha256 "975ad7ad382d0fe8d40ad458d848b658d69dab58c2788c7ed63bd7af780a0a7e"
    else
      url "https://github.com/litexlang/golitex/releases/download/0.9.65-beta/litex_0.9.65-beta_linux_amd64"
      sha256 "1c5aa91fae09b7f9c31664e6df35b82cf35e902db1f9cc9834180d1405d0975b"
    end
  end

  def install
    bin.install Dir["litex_*"].first => "litex"
  end

  test do
    assert_match "litex 0.9.65-beta", shell_output("#{bin}/litex -version")
  end
end
