class Litex < Formula
  desc "Litex: an intuitive and scalable formal language"
  homepage "https://litexlang.org"
  url "https://github.com/litexlang/golitex/releases/download/0.7.01-beta/litex_0.7.01-beta_darwin_amd64"
  sha256 "6762c90cb0dd5460f43eaf0f00f1d8e79e4f469c4e641343d1dce37d90edcb99"
  license "Apache-2.0"
  version "0.7.01-beta"

  def install
    bin.install "litex_0.7.01-beta_darwin_amd64" => "litex"
  end
end
