class Mish < Formula
  desc "Streamlined Android development tool - One-command app deployment"
  homepage "https://github.com/astralcollar/mish-cli"
  url "https://github.com/astralcollar/mish-cli/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "bc35abad123bf0322c56e7cf26a63448037bfcd6c18c1ed74a9e847fc3762fe1"
  license "MIT"

  depends_on "openjdk@11"

  def install
    ENV["JAVA_HOME"] = Formula["openjdk@11"].opt_prefix
    
    # Use gradlew wrapper included in the project
    system "./gradlew", "installDist"
    
    libexec.install Dir["build/install/mish-cli/*"]
    bin.install_symlink "#{libexec}/bin/mish-cli" => "mish"
  end

  test do
    system bin/"mish", "--help"
  end
end
