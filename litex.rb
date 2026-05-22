class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "0.9.88-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/0.9.88-beta/litex_0.9.88-beta_darwin_arm64.tar.gz"
    sha256 "c15dfead5bb0b6bce09f0c033cc830765de23c429911414bcc4bc251f466e72d"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/0.9.88-beta/litex_0.9.88-beta_linux_arm64.tar.gz"
      sha256 "42896491f7a18c245a2f7d54052b49be164253db033a82b5a325939b77af3ccc"
    else
      url "https://github.com/litexlang/golitex/releases/download/0.9.88-beta/litex_0.9.88-beta_linux_amd64.tar.gz"
      sha256 "d7b8e801a42fbf7a42377cf59ba5470ea39902bbf17fa0605715440b0c11ab4c"
    end
  end

  def install
    bin.install "litex"
    pkgshare.install "std"
  end

  test do
    assert_match "litex 0.9.88-beta", shell_output("#{bin}/litex -version")
  end
end
