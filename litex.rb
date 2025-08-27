class Litex < Formula
  desc "Litex: an intuitive and scalable formal language"
  homepage "https://litexlang.org"
  url "https://github.com/litexlang/golitex/releases/download/${VERSION}/litex_${VERSION}_darwin_amd64"
  sha256 "${BINARY_SHA}"
  license "Apache-2.0"
  version "${VERSION}"

  def install
    bin.install "litex_${VERSION}_darwin_amd64" => "litex"
  end
end
