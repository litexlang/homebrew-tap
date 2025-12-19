class Litex < Formula
  desc "Litex: an intuitive and scalable formal language"
  homepage "https://litexlang.org"
  url "https://github.com/litexlang/golitex/releases/download/0.2.01-beta/litex_0.2.01-beta_darwin_amd64"
  sha256 "b114b193b83eebbcd311754346f26cda1f2bd881d8ba0e3a66c928001c1c2bb2"
  license "Apache-2.0"
  version "0.2.01-beta"

  def install
    bin.install "litex_0.2.01-beta_darwin_amd64" => "litex"
  end
end
