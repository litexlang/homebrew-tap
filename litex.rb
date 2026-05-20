class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "0.9.86-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/0.9.86-beta/litex_0.9.86-beta_darwin_arm64"
    sha256 "36fe388294a5d8adcdfd2f0ea622ecd216477cfeec599fc793dd169403d8b081"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/0.9.86-beta/litex_0.9.86-beta_linux_arm64"
      sha256 "c0ee3e2d3290649ef3fb125eb3ab59a0c3e1a88359f05158fa5697674599e393"
    else
      url "https://github.com/litexlang/golitex/releases/download/0.9.86-beta/litex_0.9.86-beta_linux_amd64"
      sha256 "4c936dc33e49b5578460fc782b8905328460657b1f760c114f7b08b0d49bfad0"
    end
  end

  def install
    bin.install Dir["litex_*"].first => "litex"
  end

  test do
    assert_match "litex 0.9.86-beta", shell_output("#{bin}/litex -version")
  end
end
