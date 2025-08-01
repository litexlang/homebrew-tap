class Litex < Formula
  desc "Litex: an intuitive and scalable formal language"
  homepage "https://litexlang.org"
  url "https://github.com/litexlang/golitex/releases/download/latest/litex_0.1.7-beta_darwin_amd64"
  sha256 "e8247d0e8a11bb11cd6bdde033df15546215a3967aaaa7b180cbac194f365fbe"
  license "Apache-2.0"
  version "0.1.7-beta"

  def install
    bin.install "litex_0.1.7-beta_darwin_amd64" => "litex"
  end
end
