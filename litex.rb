class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "0.9.106-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/0.9.106-beta/litex_0.9.106-beta_darwin_arm64.tar.gz"
    sha256 "a66d9e794b530601f8e7a29baf5fdff2e11639f9bfa0f243a9d8fb37555417a1"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/0.9.106-beta/litex_0.9.106-beta_linux_arm64.tar.gz"
      sha256 "b14ec603effc1833cb6a4684c87900f64cf8c4f9d3a1efddfec8b92203af3e51"
    else
      url "https://github.com/litexlang/golitex/releases/download/0.9.106-beta/litex_0.9.106-beta_linux_amd64.tar.gz"
      sha256 "a64a6b4c73051c18e52a1307303db1c48384055c112a22e2e2b52c15617940f1"
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
