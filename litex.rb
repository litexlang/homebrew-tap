class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "0.9.107-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/0.9.107-beta/litex_0.9.107-beta_darwin_arm64.tar.gz"
    sha256 "d8e9553aa10c22902e6a46318555485a7bfccce90abd6aadfe18f59962f19cf2"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/0.9.107-beta/litex_0.9.107-beta_linux_arm64.tar.gz"
      sha256 "85aeba6632fed24cb0cb33f9310eb243d771a7abf88f8f8604174c9819c3f0f4"
    else
      url "https://github.com/litexlang/golitex/releases/download/0.9.107-beta/litex_0.9.107-beta_linux_amd64.tar.gz"
      sha256 "6921b15e6e2eebaf1d8f1a4f60f385b7bbb34494006ce6505e3a44bc318813ef"
    end
  end

  def install
    bin.install "litex"
    (bin/"std").install Dir["std/*"]
  end

  test do
    assert_match "litex 0.9.107-beta", shell_output("#{bin}/litex -version")
    (testpath/"test.lit").write "import std basics\nby thm basics::nonempty_family_of_nonempty_sets_exists()\n"
    output = shell_output("#{bin}/litex -isolated -f #{testpath}/test.lit")
    assert_match '"type": "proof by theorem"', output
    refute_match '"result": "error"', output
  end
end
