class Litex < Formula
  desc "Litex: an intuitive and scalable formal language"
  homepage "https://litexlang.org"
  url "https://github.com/litexlang/golitex/releases/download/0.8.02-beta/litex_0.8.02-beta_darwin_amd64"
  sha256 "9969c7732d9bffca602849d0635b06de719132f35719d6571b93b58afe85ff86"
  license "Apache-2.0"
  version "0.8.02-beta"

  def install
    bin.install "litex_0.8.02-beta_darwin_amd64" => "litex"
  end
end
