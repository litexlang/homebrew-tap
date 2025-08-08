class Litex < Formula
  desc "Litex: an intuitive and scalable formal language"
  homepage "https://litexlang.org"
  url "https://github.com/litexlang/golitex/releases/download/0.1.8-beta/litex_0.1.8-beta_darwin_amd64"
  sha256 "5a0bf41b8a76667bce7ecf2c8d366180757094207cabd7776028ad453d284b46"
  license "Apache-2.0"
  version "0.1.8-beta"

  def install
    bin.install "litex_0.1.8-beta_darwin_amd64" => "litex"
  end
end
