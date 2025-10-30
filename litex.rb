class Litex < Formula
  desc "Litex: an intuitive and scalable formal language"
  homepage "https://litexlang.org"
  url "https://github.com/litexlang/golitex/releases/download/0.1.11-beta/litex_0.1.11-beta_darwin_amd64"
  sha256 "822c49d56f435ceb1d11a560cba98142bbd4c836d08d319282b18e680ede53a9"
  license "Apache-2.0"
  version "0.1.11-beta"

  def install
    bin.install "litex_0.1.11-beta_darwin_amd64" => "litex"
  end
end
