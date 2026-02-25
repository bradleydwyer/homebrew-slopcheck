class Slopcheck < Formula
  desc "Fast regex-based detection of AI prose tells. No LLM calls, no heavy NLP."
  homepage "https://github.com/bradleydwyer/slopcheck"
  url "https://github.com/bradleydwyer/slopcheck/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "c023f45d134c29dcfaa67fb435a21fe71b0e9784368e9c17a03340918e7fbd2d"
  license "MIT"

  bottle do
    root_url "https://github.com/bradleydwyer/slopcheck/releases/download/v0.1.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "4e8811d442dad14dec915252c64dfa39433012dec3b0aab357114c489eb27835"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a7ad5210d6b9bedb5e396adb99c9db9c15d45f71b37c3ed8001cc39a92e5f7aa"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "941a3ca99e644fd7623151c9f8810507249c8656aef12362ccf0b2819768d439"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "slopcheck", shell_output("#{bin}/slopcheck --version")
  end
end
