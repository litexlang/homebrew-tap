require "json"

class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "1.0.5-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/1.0.5-beta/litex_1.0.5-beta_darwin_arm64.tar.gz"
    sha256 "855290e2074d01fb0792b58cccdaed979673a9be266e4f93df62b60a19b3eb02"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/1.0.5-beta/litex_1.0.5-beta_linux_arm64.tar.gz"
      sha256 "4364ce7a21c03f1386c0165d53b931bd80ac48950f1a12753ab695d6cae70c2a"
    else
      url "https://github.com/litexlang/golitex/releases/download/1.0.5-beta/litex_1.0.5-beta_linux_amd64.tar.gz"
      sha256 "adbd273c969ad0f8528f4c350ef998a6e2b15f2cff957c4369331ed12083d436"
    end
  end

  def install
    bin.install "litex"
    (bin/"std").install Dir["std/*"]
  end

  test do
    version_output = shell_output("#{bin}/litex -version")
    assert_equal "Litex #{version}\n", version_output
    (testpath/"litex.config").write "[import std]\nbasics\n[export]\ntest = \"./test.lit\"\n"
    (testpath/"test.lit").write "quot(-7, 3) = -3\n$dvd(12, 3)\n"
    ENV["LITEX_STD_PATH"] = (bin/"std").to_s
    output = JSON.parse(shell_output("#{bin}/litex -lang en -f #{testpath}/test.lit"))
    assert_equal "run", output.fetch("kind")
    assert_equal true, output.fetch("success")
    assert_nil output.fetch("session_error")
  end
end
