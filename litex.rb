class Litex < Formula
  desc "Litex: an intuitive and scalable formal language"
  homepage "https://litexlang.org"
  url "https://github.com/litexlang/golitex/releases/download/0.1.11-beta/litex_0.1.11-beta_darwin_amd64"
  sha256 "bf4cad3bfd992a5dcc90d22fb80a9b318969f90a7aa2596bacbcaa08967374b9"
  license "Apache-2.0"
  version "0.1.11-beta"

  def install
    bin.install "litex_0.1.11-beta_darwin_amd64" => "litex"
  end
end
