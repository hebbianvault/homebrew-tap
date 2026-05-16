class HebbianMcp < Formula
  desc "Customer-installable adapter for the Hebbian tenant brain"
  homepage "https://github.com/hebbianvault/hebbian-mcp"
  url "https://registry.npmjs.org/@hebbianvault/mcp/-/mcp-0.0.0.tgz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
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
