class Litex < Formula
  desc "Litex: an intuitive and scalable formal language"
  homepage "https://litexlang.org"
  url "https://github.com/litexlang/golitex/releases/download/0.1.7-beta/litex_0.1.7-beta_darwin_amd64"
  sha256 "f572da41f03b6443d2b4430c68709df10622b73dd048d023f35ef7cc652d11c4"
  license "Apache-2.0"
  version "0.1.7-beta"

  def install
    bin.install "litex_0.1.7-beta_darwin_amd64" => "litex"
  end
end
