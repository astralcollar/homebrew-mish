class Mish < Formula
  desc "Streamlined Android development tool - One-command app deployment"
  homepage "https://github.com/astralcollar/mish-cli"
  url "https://github.com/astralcollar/mish-cli/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "bc35abad123bf0322c56e7cf26a63448037bfcd6c18c1ed74a9e847fc3762fe1"
  license "MIT"

  depends_on "openjdk@17" 
  depends_on "gradle"

  def install
    ENV["JAVA_HOME"] = Formula["openjdk@17"].opt_prefix  # Usar JDK 17
    

    system "gradle", "installDist"
    
    libexec.install Dir["build/install/mish-cli/*"]
    bin.install_symlink "#{libexec}/bin/mish-cli" => "mish"
  end

  test do
    system bin/"mish", "--help"
  end
end