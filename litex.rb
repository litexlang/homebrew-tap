class Litex < Formula
  desc "Litex: an intuitive and scalable formal language"
  homepage "https://litexlang.org"
  url "https://github.com/litexlang/golitex/releases/download/0.8.02-beta/litex_0.8.02-beta_darwin_amd64"
  sha256 "c7476f22820edb12ee023c730bf0bd6bef23b7fc544e34e1fc1356b01f3fb2bb"
  license "Apache-2.0"
  version "0.8.02-beta"

  def install
    bin.install "litex_0.8.02-beta_darwin_amd64" => "litex"
  end
end
