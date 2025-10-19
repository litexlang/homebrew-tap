class Litex < Formula
  desc "Litex: an intuitive and scalable formal language"
  homepage "https://litexlang.org"
  url "https://github.com/litexlang/golitex/releases/download/0.1.11-beta/litex_0.1.11-beta_darwin_amd64"
  sha256 "fac4de90d46fc35a20bd9c0ce2dc1e2d8c1d92364da6cc212e99c4a544311b49"
  license "Apache-2.0"
  version "0.1.11-beta"

  def install
    bin.install "litex_0.1.11-beta_darwin_amd64" => "litex"
  end
end
