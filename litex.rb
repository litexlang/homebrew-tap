require "json"

class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "1.0.4-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/1.0.4-beta/litex_1.0.4-beta_darwin_arm64.tar.gz"
    sha256 "c2336ad7b343950ac60a1bdab4240bc700751e59c1cdeaf290a272044e1735fc"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/1.0.4-beta/litex_1.0.4-beta_linux_arm64.tar.gz"
      sha256 "0739babc02e8337b0b187bfc82fc1ceaa72248043c5dddd917c064ee680ad108"
    else
      url "https://github.com/litexlang/golitex/releases/download/1.0.4-beta/litex_1.0.4-beta_linux_amd64.tar.gz"
      sha256 "ece3875120d1e47e29dda22a17938b3effc675fed039824c26fb7421bc564808"
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
