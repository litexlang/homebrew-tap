class Litex < Formula
  desc "Litex: an intuitive and scalable formal language"
  homepage "https://litexlang.org"
  url "https://github.com/litexlang/golitex/releases/download/0.6.01-beta/litex_0.6.01-beta_darwin_amd64"
  sha256 "908b32c19b801d2a513f21e48ed4ed9c142b52e238aa070b5338b9d44aa14ab9"
  license "Apache-2.0"
  version "0.6.01-beta"

  def install
    bin.install "litex_0.6.01-beta_darwin_amd64" => "litex"
  end
end
