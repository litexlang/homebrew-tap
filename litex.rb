class Litex < Formula
  desc "Litex: an intuitive and scalable formal language"
  homepage "https://litexlang.org"
  url "https://github.com/litexlang/golitex/releases/download/v0.1.8-beta/litex_0.1.8-beta_darwin_amd64"
  sha256 "f72eb714144f94a7b0735c8a7173e52741b33bbd13b02166fa933e93feb35928"
  license "Apache-2.0"
  version "0.1.8-beta"

  def install
    bin.install "litex_0.1.8-beta_darwin_amd64" => "litex"
  end
end
