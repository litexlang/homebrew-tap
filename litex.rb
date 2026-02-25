class Litex < Formula
  desc "Litex: an intuitive and scalable formal language"
  homepage "https://litexlang.org"
  url "https://github.com/litexlang/golitex/releases/download/0.8.01-beta/litex_0.8.01-beta_darwin_amd64"
  sha256 "5ae95365b686324a908dc9a630ee0e5b8c32bb1e8c18371ac32641124430656b"
  license "Apache-2.0"
  version "0.8.01-beta"

  def install
    bin.install "litex_0.8.01-beta_darwin_amd64" => "litex"
  end
end
