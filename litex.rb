class Litex < Formula
  desc "A simple formal proof language and verifier"
  homepage "https://litexlang.com"
  version "0.9.116-beta"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/litexlang/golitex/releases/download/0.9.116-beta/litex_0.9.116-beta_darwin_arm64.tar.gz"
    sha256 "f5c27650c968ec2564987435b362d0eb90e6d348aef53b8758138b36c7655988"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/litexlang/golitex/releases/download/0.9.116-beta/litex_0.9.116-beta_linux_arm64.tar.gz"
      sha256 "0a94c612d8c2441fd1fd1ebc7a569d75e7646e36b5adaec7117df77c68bad536"
    else
      url "https://github.com/litexlang/golitex/releases/download/0.9.116-beta/litex_0.9.116-beta_linux_amd64.tar.gz"
      sha256 "7a44a830eea9d9913d22560c715ebbcbc725ae7d662254771936018512fe11a1"
    end
  end

  def install
    bin.install "litex"
    (bin/"std").install Dir["std/*"]
  end

  test do
    assert_match "litex 0.9.116-beta", shell_output("#{bin}/litex -version")
    (testpath/"test.lit").write "import std basics\nby thm basics::prime_implies_prime_by_trial_division(2)\n"
    output = shell_output("#{bin}/litex -isolated -f #{testpath}/test.lit")
    assert_match '"type": "proof by theorem"', output
    refute_match '"result": "error"', output
  end
end
