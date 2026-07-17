class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "0.9.106-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/0.9.106-beta/litex_0.9.106-beta_darwin_arm64.tar.gz"
    sha256 "2e2f37dca048365026610624e758c471457aa3f75a979ad7c0ab1ea447e57a5c"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/0.9.106-beta/litex_0.9.106-beta_linux_arm64.tar.gz"
      sha256 "b2798168f56e26a5ed6877158168e2b887c830675362b7ce7adea3b93ceeb5ac"
    else
      url "https://github.com/litexlang/golitex/releases/download/0.9.106-beta/litex_0.9.106-beta_linux_amd64.tar.gz"
      sha256 "263b2f49d2212804de686e1479c75503c856b1fdb91277f541cea37849929a25"
    end
  end

  def install
    bin.install "litex"
    (bin/"std").install Dir["std/*"]
  end

  test do
    assert_match "litex 0.9.106-beta", shell_output("#{bin}/litex -version")
    (testpath/"test.lit").write "import std basics\nby thm basics::nonempty_family_of_nonempty_sets_exists()\n"
    output = shell_output("#{bin}/litex -isolated -f #{testpath}/test.lit")
    assert_match '"type": "proof by theorem"', output
    refute_match '"result": "error"', output
  end
end
