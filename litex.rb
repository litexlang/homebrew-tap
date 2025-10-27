class Litex < Formula
  desc "Litex: an intuitive and scalable formal language"
  homepage "https://litexlang.org"
  url "https://github.com/litexlang/golitex/releases/download/0.1.11-beta/litex_0.1.11-beta_darwin_amd64"
  sha256 "00e31101657956f857bc2080da9bb109f68862a04a22c20852efd5a550bf75b8"
  license "Apache-2.0"
  version "0.1.11-beta"

  def install
    bin.install "litex_0.1.11-beta_darwin_amd64" => "litex"
  end
end
