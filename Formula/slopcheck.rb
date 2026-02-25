class Slopcheck < Formula
  desc "Fast regex-based detection of AI prose tells. No LLM calls, no heavy NLP."
  homepage "https://github.com/bradleydwyer/slopcheck"
  url "https://github.com/bradleydwyer/slopcheck/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "7d4128cc85cebb72ac575da62b5cb087789874be17b70f97a20cad8da08e33f8"
  license "MIT"

  bottle do
    root_url "https://github.com/bradleydwyer/slopcheck/releases/download/v0.4.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "54d263cf0f848d48790378658e5be15caeb2d19c69f3ea59b836c43e567e3890"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9df1be254159870b10ca79cb16cddef8bb57c9d87c5ad0da78bcd10c27a5fa19"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "d9c607600b3d2864a6ea771aa7a506a5a6db42394f00fbf5ebfe5e83ec47ca2a"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "slopcheck", shell_output("#{bin}/slopcheck --version")
  end
end
