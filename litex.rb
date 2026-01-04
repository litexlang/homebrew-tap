class Litex < Formula
  desc "Litex: an intuitive and scalable formal language"
  homepage "https://litexlang.org"
  url "https://github.com/litexlang/golitex/releases/download/0.6.01-beta/litex_0.6.01-beta_darwin_amd64"
  sha256 "3048a8f7b4cb93f3b61ffb6b2409152c20645a7fef72818e1e5a61b6ce27fae5"
  license "Apache-2.0"
  version "0.6.01-beta"

  def install
    bin.install "litex_0.6.01-beta_darwin_amd64" => "litex"
  end
end
