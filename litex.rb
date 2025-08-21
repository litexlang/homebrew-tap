class Litex < Formula
  desc "Litex: an intuitive and scalable formal language"
  homepage "https://litexlang.org"
  url "https://github.com/litexlang/golitex/releases/download/0.1.10-beta/litex_0.1.10-beta_darwin_amd64"
  sha256 "6bd047cb394d35a1e27dabc0b84ab267e1d1ea7a2196e75aa38b41ac93f39ff6"
  license "Apache-2.0"
  version "0.1.10-beta"

  def install
    bin.install "litex_0.1.10-beta_darwin_amd64" => "litex"
  end
end
