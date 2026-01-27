class Litex < Formula
  desc "Litex: an intuitive and scalable formal language"
  homepage "https://litexlang.org"
  url "https://github.com/litexlang/golitex/releases/download/0.7.11-beta/litex_0.7.11-beta_darwin_amd64"
  sha256 "ee4f075e54bad10fa372e501961bedfb23dfd19f40fad50bff2a0f195b0d6ede"
  license "Apache-2.0"
  version "0.7.11-beta"

  def install
    bin.install "litex_0.7.11-beta_darwin_amd64" => "litex"
  end
end
