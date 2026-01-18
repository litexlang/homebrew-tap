class Litex < Formula
  desc "Litex: an intuitive and scalable formal language"
  homepage "https://litexlang.org"
  url "https://github.com/litexlang/golitex/releases/download/0.6.01-beta/litex_0.6.01-beta_darwin_amd64"
  sha256 "a60e0fe139b1f7fffabee02b719f2edefe6b8ca5563fcd79156ce3c552807dda"
  license "Apache-2.0"
  version "0.6.01-beta"

  def install
    bin.install "litex_0.6.01-beta_darwin_amd64" => "litex"
  end
end
