class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "0.9.108-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/0.9.108-beta/litex_0.9.108-beta_darwin_arm64.tar.gz"
    sha256 "49136f4501c3020d074639576c9170b0615c6b42c690355a8479c34d33600a64"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/0.9.108-beta/litex_0.9.108-beta_linux_arm64.tar.gz"
      sha256 "a412f0d3b76c25c833fed6e807c1f2ea3521c4eabb4d2f360c64c8a252a5f808"
    else
      url "https://github.com/litexlang/golitex/releases/download/0.9.108-beta/litex_0.9.108-beta_linux_amd64.tar.gz"
      sha256 "e72c0ae1ec5010b256f298d6867f99739bce90c0f2958d4d12835cd2dd2f8636"
    end
  end

  def install
    bin.install "litex"
    (bin/"std").install Dir["std/*"]
  end

  test do
    assert_match "litex 0.9.108-beta", shell_output("#{bin}/litex -version")
    (testpath/"test.lit").write "import std basics\nby thm basics::finite_set_has_bijective_index({1, 2})\n"
    output = shell_output("#{bin}/litex -isolated -f #{testpath}/test.lit")
    assert_match '"type": "proof by theorem"', output
    refute_match '"result": "error"', output
  end
end
