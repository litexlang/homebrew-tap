class Litex < Formula
  desc "Litex: an intuitive and scalable formal language"
  homepage "https://litexlang.org"
  url "https://github.com/litexlang/golitex/releases/download/0.6.01-beta/litex_0.6.01-beta_darwin_amd64"
  sha256 "70d338cec5d56a2dcbadf4ae09a3b7642706e33ccf6f526ce172971dd098a1cd"
  license "Apache-2.0"
  version "0.6.01-beta"

  def install
    bin.install "litex_0.6.01-beta_darwin_amd64" => "litex"
  end
end
