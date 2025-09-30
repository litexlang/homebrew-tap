class Litex < Formula
  desc "Litex: an intuitive and scalable formal language"
  homepage "https://litexlang.org"
  url "https://github.com/litexlang/golitex/releases/download/0.1.11-beta/litex_0.1.11-beta_darwin_amd64"
  sha256 "b96f97567ed4fb0af0f418a200dc8f900fb4a23365bba47b703f5d7ea4254291"
  license "Apache-2.0"
  version "0.1.11-beta"

  def install
    bin.install "litex_0.1.11-beta_darwin_amd64" => "litex"
  end
end
