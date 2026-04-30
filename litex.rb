class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "0.9.72-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/0.9.72-beta/litex_0.9.72-beta_darwin_arm64"
    sha256 "b3355cdac511ad8389dd2ece9d3e188de45b44539cf7a5723e6e49b7496a1635"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/0.9.72-beta/litex_0.9.72-beta_linux_arm64"
      sha256 "e72554f271b36ba2b0161626ad703c040772c867869f6e8f8a95f82f6196ca16"
    else
      url "https://github.com/litexlang/golitex/releases/download/0.9.72-beta/litex_0.9.72-beta_linux_amd64"
      sha256 "f76343e8fcd6a9dc2bc58f7c220de9975bd2fc61b12dd75876580a7139d9f286"
    end
  end

  def install
    bin.install Dir["litex_*"].first => "litex"
  end

  test do
    assert_match "litex 0.9.72-beta", shell_output("#{bin}/litex -version")
  end
end
