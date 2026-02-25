class Slopcheck < Formula
  desc "Fast regex-based detection of AI prose tells. No LLM calls, no heavy NLP."
  homepage "https://github.com/bradleydwyer/slopcheck"
  url "https://github.com/bradleydwyer/slopcheck/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "cc5430f381b3a12135ac2c0cf569c982026e1c45d09bfd23afc773d46dabf0a2"
  license "MIT"

  bottle do
    root_url "https://github.com/bradleydwyer/slopcheck/releases/download/v0.3.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "c60d9b61f7f6b5ce3ee9919f51950d1228c9aa76e86d213b60032a0825a55232"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7c2f5cd2862665d5688e3017241edf05835ffcc3caca62ab5dbbbc175d49382f"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "d3678137c9bbc302d2562d1209626e65d98048720dd0c0b7a6f2713b718cb797"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "slopcheck", shell_output("#{bin}/slopcheck --version")
  end
end
