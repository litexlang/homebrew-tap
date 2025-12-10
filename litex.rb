class Litex < Formula
  desc "Litex: an intuitive and scalable formal language"
  homepage "https://litexlang.org"
  url "https://github.com/litexlang/golitex/releases/download/0.2.01-beta/litex_0.2.01-beta_darwin_amd64"
  sha256 "0a56225c5d8c08e5f07c64bfe5c867728708f063270c707f86881610dfdab8e4"
  license "Apache-2.0"
  version "0.2.01-beta"

  def install
    bin.install "litex_0.2.01-beta_darwin_amd64" => "litex"
  end
end
