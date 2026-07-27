class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "0.9.110-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/0.9.110-beta/litex_0.9.110-beta_darwin_arm64.tar.gz"
    sha256 "58a5827e693897ed3dcd9432042e9b70b900c8872da8bd07c88872155020a137"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/0.9.110-beta/litex_0.9.110-beta_linux_arm64.tar.gz"
      sha256 "88eabf2001bd5a8df0536d0743ce7c5fb0b35e6c8ed832a319db6276760e35b9"
    else
      url "https://github.com/litexlang/golitex/releases/download/0.9.110-beta/litex_0.9.110-beta_linux_amd64.tar.gz"
      sha256 "03eb02fb725156d921c9124b96866deef72fd74643a21ea7f7c0f61ce26393ae"
    end
  end

  def install
    bin.install "litex"
    (bin/"std").install Dir["std/*"]
  end

  test do
    assert_match "litex 0.9.110-beta", shell_output("#{bin}/litex -version")
    (testpath/"test.lit").write "import std basics\nby thm basics::finite_set_has_bijective_index({1, 2})\n"
    output = shell_output("#{bin}/litex -isolated -f #{testpath}/test.lit")
    assert_match '"type": "proof by theorem"', output
    refute_match '"result": "error"', output
  end
end
