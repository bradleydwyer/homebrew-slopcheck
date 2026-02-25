class Slopcheck < Formula
  desc "Fast regex-based detection of AI prose tells. No LLM calls, no heavy NLP."
  homepage "https://github.com/bradleydwyer/slopcheck"
  url "https://github.com/bradleydwyer/slopcheck/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "dd615626f67d3a60bff2d47b64259c4f599de060094e35c42fbe500c4a19bcd1"
  license "MIT"

  bottle do
    root_url "https://github.com/bradleydwyer/slopcheck/releases/download/v0.2.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "b4997aba7406755b62851def7314f83b451b0d26f7361f54370bd4b5c63bbda4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "facf8b4e66961df173b9335cda2c9c4ad81d0f1a15b646cdb0d5e1e8a28d8775"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "90a72c568be7677e390bc49e96f366f757951d22e059231070ccb5fd8bdee8c1"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "slopcheck", shell_output("#{bin}/slopcheck --version")
  end
end
