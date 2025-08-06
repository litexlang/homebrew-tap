class Litex < Formula
  desc "Litex: an intuitive and scalable formal language"
  homepage "https://litexlang.org"
  url "https://github.com/litexlang/golitex/releases/download/0.1.8-beta/litex_0.1.8-beta_darwin_amd64"
  sha256 "66f5757911fe600044e96bc00fed1d62714080f3015dc7bb8e2f784324379e09"
  license "Apache-2.0"
  version "0.1.8-beta"

  def install
    bin.install "litex_0.1.8-beta_darwin_amd64" => "litex"
  end
end
