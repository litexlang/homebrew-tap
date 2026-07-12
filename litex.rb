class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "0.9.102-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/0.9.102-beta/litex_0.9.102-beta_darwin_arm64.tar.gz"
    sha256 "6faf566b18a43620f265e0c36d14056009ae49859910421f9538c9a53b8bc557"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/0.9.102-beta/litex_0.9.102-beta_linux_arm64.tar.gz"
      sha256 "774affa0396351f96ec5253c3bc0d576ee45f7d9d74af8f3e2bb4b2e794c86dc"
    else
      url "https://github.com/litexlang/golitex/releases/download/0.9.102-beta/litex_0.9.102-beta_linux_amd64.tar.gz"
      sha256 "20de8a417f715ec916b98bc24ee1c29b1fb94fffc14cc145e05f3eb2b64ee305"
    end
  end

  def install
    bin.install "litex"
    pkgshare.install "std"
  end

  test do
    assert_match "litex 0.9.102-beta", shell_output("#{bin}/litex -version")
    (testpath/"test.lit").write "import Trig\nTrig::sin(0) = 0\n"
    output = shell_output("#{bin}/litex -f #{testpath}/test.lit")
    assert_match '"type": "equality fact"', output
    assert_match "Trig::sin(0)", output
    refute_match '"result": "error"', output
  end
end
