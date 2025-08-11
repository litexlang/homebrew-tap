class Litex < Formula
  desc "Litex: an intuitive and scalable formal language"
  homepage "https://litexlang.org"
  url "https://github.com/litexlang/golitex/releases/download/0.1.9-beta/litex_0.1.9-beta_darwin_amd64"
  sha256 "96c33991b7a0f590a6a66760cb42df4a708c7fde9d7e4d7fdad77a4e9bea962a"
  license "Apache-2.0"
  version "0.1.9-beta"

  def install
    bin.install "litex_0.1.9-beta_darwin_amd64" => "litex"
  end
end
