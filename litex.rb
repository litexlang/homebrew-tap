class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "0.9.112-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/0.9.112-beta/litex_0.9.112-beta_darwin_arm64.tar.gz"
    sha256 "13d615b2e50cafceef303f064300d5e08dbb9d5c589eb29b55d195343eaa819c"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/0.9.112-beta/litex_0.9.112-beta_linux_arm64.tar.gz"
      sha256 "87c63b1f5891c2d95595256ccf32a43850ee9c607d4d963b8fd94063b67cface"
    else
      url "https://github.com/litexlang/golitex/releases/download/0.9.112-beta/litex_0.9.112-beta_linux_amd64.tar.gz"
      sha256 "057fcb561c2a6be31f5447ca008c380ff0341b9e13e4c8b22e18a21b5e8c4570"
    end
  end

  def install
    bin.install "litex"
    (bin/"std").install Dir["std/*"]
  end

  test do
    assert_match "litex 0.9.112-beta", shell_output("#{bin}/litex -version")
    (testpath/"test.lit").write "import std basics\nby thm basics::finite_set_has_bijective_index({1, 2})\n"
    output = shell_output("#{bin}/litex -isolated -f #{testpath}/test.lit")
    assert_match '"type": "proof by theorem"', output
    refute_match '"result": "error"', output
  end
end
