class Litex < Formula
  desc "Litex: an intuitive and scalable formal language"
  homepage "https://litexlang.org"
  url "https://github.com/litexlang/golitex/releases/download/0.8.02-beta/litex_0.8.02-beta_darwin_amd64"
  sha256 "53e646b27a1dd7f9af89caad4a5ba3d1812c05fb8cc0d934347b1a828ab0a97d"
  license "Apache-2.0"
  version "0.8.02-beta"

  def install
    bin.install "litex_0.8.02-beta_darwin_amd64" => "litex"
  end
end
