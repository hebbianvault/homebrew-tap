class HebbianMcp < Formula
  desc "Customer-installable adapter for the Hebbian tenant brain"
  homepage "https://github.com/hebbianvault/hebbian-mcp"
  url "https://registry.npmjs.org/@hebbianvault/mcp/-/mcp-0.6.0.tgz"
  sha256 "b1437a7f38b20318b004deda897df5837c8f6b0c8e3e706e85dce47ac0838755"
  license "Apache-2.0"

  depends_on "node"

  def install
    system "npm", "install", "-g", "--prefix=#{libexec}", "@hebbianvault/mcp@#{version}"
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    # hebbian-mcp has no --version flag: it starts the server and exits 1 without a token.
    assert_predicate bin/"hebbian-mcp", :exist?
    assert_match "\"version\": \"#{version}\"",
                 (libexec/"lib/node_modules/@hebbianvault/mcp/package.json").read
  end
end
