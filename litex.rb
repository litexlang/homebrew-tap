class Litex < Formula
  desc "Litex: an intuitive and scalable formal language"
  homepage "https://litexlang.org"
  url "https://github.com/litexlang/golitex/releases/download/0.1.10-beta/litex_0.1.10-beta_darwin_amd64"
  sha256 "b8a5e86b4defbc0b836147561d275498705a01d7d340aae9524085023c686a5b"
  license "Apache-2.0"
  version "0.1.10-beta"

  def install
    bin.install "litex_0.1.10-beta_darwin_amd64" => "litex"
  end
end
