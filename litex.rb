class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "0.9.99-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/0.9.99-beta/litex_0.9.99-beta_darwin_arm64.tar.gz"
    sha256 "683d39ef7ff824f02c50e356f6f22e4659152bd4b38c7d67dfed2ecbfb11750f"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/0.9.99-beta/litex_0.9.99-beta_linux_arm64.tar.gz"
      sha256 "e73a62e777e569150410584c1df68589a1e492a3355cac05ff95537a73c65406"
    else
      url "https://github.com/litexlang/golitex/releases/download/0.9.99-beta/litex_0.9.99-beta_linux_amd64.tar.gz"
      sha256 "a756c19ff1c31256c9d556cec1225d1c0e4051b8a42f195da58b61eecfe04e26"
    end
  end

  def install
    bin.install "litex"
    pkgshare.install "std"
  end

  test do
    assert_match "litex 0.9.99-beta", shell_output("#{bin}/litex -version")
    (testpath/"test.lit").write "import Trig\nTrig::sin(0) = 0\n"
    output = shell_output("#{bin}/litex -f #{testpath}/test.lit")
    assert_match "Trig::sin(0) = 0", output
    refute_match '"result": "error"', output
  end
end
