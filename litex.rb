class Litex < Formula
  desc "Litex: an intuitive and scalable formal language"
  homepage "https://litexlang.org"
  url "https://github.com/litexlang/golitex/releases/download/v0.1.5-beta/macos_64_litex_0.1.5-beta"
  sha256 "70a32ee5a3932ee67df3d2170f69c0bcc222c2a4ebc1223e5ae637e37f780b33"
  license "Apache-2.0"
  version "0.1.5-beta"

  def install
    bin.install "macos_64_litex_0_1_5_beta" => "litex"
  end

  test do
    system "false"
  end
end
