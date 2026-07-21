class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "0.9.109-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/0.9.109-beta/litex_0.9.109-beta_darwin_arm64.tar.gz"
    sha256 "6358a0a29b013d3f395629d1fe27889a60d986d3fc00f7ba403454e6ec56dbd5"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/0.9.109-beta/litex_0.9.109-beta_linux_arm64.tar.gz"
      sha256 "13f400170310572e3a6c0a6907ab2a615358de8ff409df8d6bb113e8e6fe6e1a"
    else
      url "https://github.com/litexlang/golitex/releases/download/0.9.109-beta/litex_0.9.109-beta_linux_amd64.tar.gz"
      sha256 "dac940433b3226e0c1614afe3877f322a66e73ee4cbdb4714058adb9cfea146e"
    end
  end

  def install
    bin.install "litex"
    (bin/"std").install Dir["std/*"]
  end

  test do
    assert_match "litex 0.9.109-beta", shell_output("#{bin}/litex -version")
    (testpath/"test.lit").write "import std basics\nby thm basics::finite_set_has_bijective_index({1, 2})\n"
    output = shell_output("#{bin}/litex -isolated -f #{testpath}/test.lit")
    assert_match '"type": "proof by theorem"', output
    refute_match '"result": "error"', output
  end
end
