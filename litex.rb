class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "0.9.113-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/0.9.113-beta/litex_0.9.113-beta_darwin_arm64.tar.gz"
    sha256 "0d12c52b6ba70ce3df5f59cd34106726b3a6247031e5d0342bf6903bc7641c33"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/0.9.113-beta/litex_0.9.113-beta_linux_arm64.tar.gz"
      sha256 "fbce2c354503579324b6799427df2b88944196e38213f01430e05cc6a5cbc126"
    else
      url "https://github.com/litexlang/golitex/releases/download/0.9.113-beta/litex_0.9.113-beta_linux_amd64.tar.gz"
      sha256 "f0c1c2a159f2729f1fb76564864798ec10abf2548348ffa67aaf6bcecf480815"
    end
  end

  def install
    bin.install "litex"
    (bin/"std").install Dir["std/*"]
  end

  test do
    assert_match "litex 0.9.113-beta", shell_output("#{bin}/litex -version")
    (testpath/"test.lit").write "import std basics\nby thm basics::finite_set_has_bijective_index({1, 2})\n"
    output = shell_output("#{bin}/litex -isolated -f #{testpath}/test.lit")
    assert_match '"type": "proof by theorem"', output
    refute_match '"result": "error"', output
  end
end
