class Slopcheck < Formula
  desc "Fast regex-based detection of AI prose tells. No LLM calls, no heavy NLP."
  homepage "https://github.com/bradleydwyer/slopcheck"
  url "https://github.com/bradleydwyer/slopcheck/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "e1043935d5b4d0f14630ac3d3bbe45c82c3c0f3740e86689986d6e52857e9cf5"
  license "MIT"

  bottle do
    root_url "https://github.com/bradleydwyer/slopcheck/releases/download/v0.5.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "0d7d3c464b22c906a06ebd7587cfb1af3289e7c94c428b3b19593e7be7df7256"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6cff5edd9089e4c13f045d6abf447a39c290b000e60f99e0a97389c634de26a5"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "cdd8ff2ca0b0d06b048a54b1b54879538fb17898221f43268e08ca15be4cd8b9"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "slopcheck", shell_output("#{bin}/slopcheck --version")
  end
end
