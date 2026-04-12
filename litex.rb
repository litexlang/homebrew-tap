class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "0.9.4-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/0.9.4-beta/litex_0.9.4-beta_darwin_arm64"
    sha256 "d421b7fcefa8bd5aee9a71aff5cb7b433fe308dfa384bb51a5b3da7b2b474fee"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/0.9.4-beta/litex_0.9.4-beta_linux_arm64"
      sha256 "18d4023fac48aed0a6171346c6952ee9b99dd31c6128d9ed8b2543c0053b4010"
    else
      url "https://github.com/litexlang/golitex/releases/download/0.9.4-beta/litex_0.9.4-beta_linux_amd64"
      sha256 "54bb6d1c6c79f96f0c785c152156d1425fe43a7500845d41537021dfaab257a4"
    end
  end

  def install
    bin.install Dir["litex_*"].first => "litex"
  end

  test do
    assert_match "litex 0.9.4-beta", shell_output("#{bin}/litex -version")
  end
end
