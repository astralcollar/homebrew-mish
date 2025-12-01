class Mish < Formula
  desc "Streamlined Android development tool - One-command app deployment"
  homepage "https://github.com/astralcollar/mish-cli"
  url "https://github.com/astralcollar/mish-cli/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "a1aac582560a1483001978b812f7efdbba6167484efca038c7db72ad19a885b1" 
  license "MIT"

  depends_on "openjdk@11"
  depends_on "gradle"

  def install
    system "gradle", "installDist"
    libexec.install Dir["build/install/mish-cli/*"]
    bin.install_symlink "#{libexec}/bin/mish-cli" => "mish"
  end

  test do
    system "#{bin}/mish", "--help"
  end
end