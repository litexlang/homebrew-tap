class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "0.9.68-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/0.9.68-beta/litex_0.9.68-beta_darwin_arm64"
    sha256 "b61efc8ebe55e5c65c22ed148e4e21539ad2625accf30180c8d7daf093299e02"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/0.9.68-beta/litex_0.9.68-beta_linux_arm64"
      sha256 "dd38b5555cb6caff5bdcae38ae7c7f01ed4cd29dd95b797eea4242a9e64af4ef"
    else
      url "https://github.com/litexlang/golitex/releases/download/0.9.68-beta/litex_0.9.68-beta_linux_amd64"
      sha256 "f503228f17906db641d78958b9a17e5e2e354322945f1fc1bae12bd845dffa37"
    end
  end

  def install
    bin.install Dir["litex_*"].first => "litex"
  end

  test do
    assert_match "litex 0.9.68-beta", shell_output("#{bin}/litex -version")
  end
end
