class Slopcheck < Formula
  desc "Fast regex-based detection of AI prose tells. No LLM calls, no heavy NLP."
  homepage "https://github.com/bradleydwyer/slopcheck"
  url "https://github.com/bradleydwyer/slopcheck/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "1dab24e3ce42d567984894a3691676de0715fdcb7bb8af73053615d9fb03142e"
  license "MIT"

  bottle do
    root_url "https://github.com/bradleydwyer/slopcheck/releases/download/v0.5.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "233443db1c101506204c0618e22491b174978287bdbaed25986a2bb7afe075cc"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2acb201f6f2fccbafd892a09175c1a9477468db94c097b21556ff9e37e6485c2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "624a32b8538c4a3b4b51e1a558acfd47edc19673c1fdee5bd761f7bee5ec2bfd"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "slopcheck", shell_output("#{bin}/slopcheck --version")
  end
end
