class Litex < Formula
  desc "Litex: an intuitive and scalable formal language"
  homepage "https://litexlang.org"
  url "https://github.com/litexlang/golitex/releases/download/0.1.10-beta/litex_0.1.10-beta_darwin_amd64"
  sha256 "c165fe5351471ce5f7c5534b9376049ff8b76b8327012ab655c4794b4411d1ca"
  license "Apache-2.0"
  version "0.1.10-beta"

  def install
    bin.install "litex_0.1.10-beta_darwin_amd64" => "litex"
  end
end
