class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "0.9.91-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/0.9.91-beta/litex_0.9.91-beta_darwin_arm64.tar.gz"
    sha256 "b14ff579293f5d78635f938d452ce8b195108069a5382f61fbb7b9a2502ae6fc"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/0.9.91-beta/litex_0.9.91-beta_linux_arm64.tar.gz"
      sha256 "770b411a94f58238dd714403d2898648f382af4d8fc58fe2fe5c9e1d0d636a81"
    else
      url "https://github.com/litexlang/golitex/releases/download/0.9.91-beta/litex_0.9.91-beta_linux_amd64.tar.gz"
      sha256 "bc797ab023b80dfcfd7469cf89885baed9f9cd2fef0b925a59fc6f4695c60fc0"
    end
  end

  def install
    bin.install "litex"
    pkgshare.install "std"
  end

  test do
    assert_match "litex 0.9.91-beta", shell_output("#{bin}/litex -version")
    (testpath/"test.lit").write "run_file trigonometry\nsin(0) = 0\n"
    assert_match "sin(0) = 0", shell_output("#{bin}/litex -f #{testpath}/test.lit")
  end
end
