class Litex < Formula
  desc "Litex: an intuitive and scalable formal language"
  homepage "https://litexlang.org"
  url "https://github.com/litexlang/golitex/releases/download/0.1.8-beta/litex_0.1.8-beta_darwin_amd64"
  sha256 "d6a654fcdde6c7f58f1bc80cf21d3dfc0cf08d8de4a2da6a943a40d91385f0a7"
  license "Apache-2.0"
  version "0.1.8-beta"

  def install
    bin.install "litex_0.1.8-beta_darwin_amd64" => "litex"
  end
end
