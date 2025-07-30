class Litex < Formula
  desc "Litex: an intuitive and scalable formal language"
  homepage "https://litexlang.org"
  url "https://github.com/litexlang/golitex/releases/download/latest/litex_0.1.6-beta_darwin_amd64"
  sha256 "f76cd915580a02cf264bb6addf922dc924a4da46db2e68cae52d842080d4c182"
  license "Apache-2.0"
  version "0.1.6-beta"

  def install
    bin.install "litex_0.1.6-beta_darwin_amd64" => "litex"
  end

  test do
    system "false"
  end
end
