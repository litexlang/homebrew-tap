class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "0.9.103-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/0.9.103-beta/litex_0.9.103-beta_darwin_arm64.tar.gz"
    sha256 "91faad8c43d650c1bab32ef4a7f6843236922b4327bf838e6d74b710ff4e8ad3"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/0.9.103-beta/litex_0.9.103-beta_linux_arm64.tar.gz"
      sha256 "b5aaca53da93fd4b9ed923b210575395d3bcb916ecb14ac19579a2bec0f9c9da"
    else
      url "https://github.com/litexlang/golitex/releases/download/0.9.103-beta/litex_0.9.103-beta_linux_amd64.tar.gz"
      sha256 "fd787fadf238f7d6de75688e6b20bd1017a78e7ec495fa9cbc3b46f962804d34"
    end
  end

  def install
    bin.install "litex"
  end

  test do
    assert_match "litex 0.9.103-beta", shell_output("#{bin}/litex -version")
    (testpath/"test.lit").write "1 = 1\n"
    output = shell_output("#{bin}/litex -f #{testpath}/test.lit")
    assert_match '"type": "equality fact"', output
    refute_match '"result": "error"', output
  end
end
