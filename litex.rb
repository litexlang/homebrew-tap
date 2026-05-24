class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "0.9.89-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/0.9.89-beta/litex_0.9.89-beta_darwin_arm64.tar.gz"
    sha256 "99bc58aa15eef83fa59a1645dec00abab83656908af6e64461a80e2d759c591d"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/0.9.89-beta/litex_0.9.89-beta_linux_arm64.tar.gz"
      sha256 "f105793db97f2540332f429fc2223c8730779a0734e78a35ccbc1f585cdf79b1"
    else
      url "https://github.com/litexlang/golitex/releases/download/0.9.89-beta/litex_0.9.89-beta_linux_amd64.tar.gz"
      sha256 "8ae4416991c7b8a5722535deeefbed6675d63eede82e622408d1536dcb845918"
    end
  end

  def install
    bin.install "litex"
    pkgshare.install "std"
  end

  test do
    assert_match "litex 0.9.89-beta", shell_output("#{bin}/litex -version")
  end
end
