class Slopcheck < Formula
  desc "Fast regex-based detection of AI prose tells. No LLM calls, no heavy NLP."
  homepage "https://github.com/bradleydwyer/slopcheck"
  url "https://github.com/bradleydwyer/slopcheck/archive/refs/tags/v0.5.2.tar.gz"
  sha256 "164ca0da45a88106e680800fd9a4b8e68767fe50c646b52862a1ae9748952ff0"
  license "MIT"

  bottle do
    root_url "https://github.com/bradleydwyer/slopcheck/releases/download/v0.5.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "5539b897d95adc830668fab01212ede0a7b312c342f1b6f39fe11a0bf603e129"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "15672f984a50c567f858488659c7aabf8245f30ba32f8a0b9ff1332c36e4e7b6"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "9978ec2edcc8cccf58f245b889c038b8ec00abbc6a9ecc7c223fc555529c215e"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "slopcheck", shell_output("#{bin}/slopcheck --version")
  end
end
