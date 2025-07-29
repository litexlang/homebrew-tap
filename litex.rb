class Litex < Formula
  desc "Litex: an intuitive and scalable formal language"
  homepage "https://litexlang.org"
  url "https://github.com/litexlang/golitex/releases/download/v0.1.5-beta/macos_64_litex_0_1_5_beta"
  sha256 "8041fc57047fa5bc9573af4b0f9b83b7a58219b75adde133393a484fcc36fa04"
  license "Apache-2.0"
  version "0.1.5-beta"

  def install
    bin.install "macos_64_litex_0_1_5_beta" => "litex"
  end

  test do
    system "false"
  end
end
