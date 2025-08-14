class Litex < Formula
  desc "Litex: an intuitive and scalable formal language"
  homepage "https://litexlang.org"
  url "https://github.com/litexlang/golitex/releases/download/0.1.10-beta/litex_0.1.10-beta_darwin_amd64"
  sha256 "e333226f3c2c498ca9b2c391d1dcb874ae29830b781c10896d1e5789ab8983bb"
  license "Apache-2.0"
  version "0.1.10-beta"

  def install
    bin.install "litex_0.1.10-beta_darwin_amd64" => "litex"
  end
end
