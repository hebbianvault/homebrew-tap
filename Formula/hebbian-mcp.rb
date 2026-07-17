class HebbianMcp < Formula
  desc "Customer-installable adapter for the Hebbian tenant brain"
  homepage "https://github.com/hebbianvault/hebbian-mcp"
  url "https://registry.npmjs.org/@hebbianvault/mcp/-/mcp-0.4.0.tgz"
  sha256 "60f424c7c822d736eec64298f32af0aa511a1515fc687d2181eb121fc5b96216"
  license "Apache-2.0"

  depends_on "node"

  def install
    system "npm", "install", "-g", "--prefix=#{libexec}", "@hebbianvault/mcp@#{version}"
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hebbian-mcp --version")
  end
end
