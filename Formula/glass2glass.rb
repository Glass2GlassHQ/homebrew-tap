class Glass2glass < Formula
  desc "Multimedia pipeline tools g2g-launch and g2g-inspect"
  homepage "https://github.com/Glass2GlassHQ/glass2glass"
  version "0.20.0"
  license "MPL-2.0"

  depends_on :macos

  on_arm do
    url "https://github.com/Glass2GlassHQ/glass2glass/releases/download/v0.20.0/g2g-v0.20.0-aarch64-apple-darwin.tar.gz"
    sha256 "c0b275ac6aef4d8ec14d9134f900100e9e2d603ad94adb7d3253cb9451b728c4"
  end
  on_intel do
    url "https://github.com/Glass2GlassHQ/glass2glass/releases/download/v0.20.0/g2g-v0.20.0-x86_64-apple-darwin.tar.gz"
    sha256 "1f075d618bcd61d52a9b682ec78f10557a25f4295f5912bf199caaf64b0fce7c"
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"g2g-launch", libexec/"g2g-inspect"
    bash_completion.install_symlink libexec/"g2g.bash" => "g2g-launch"
    bash_completion.install_symlink libexec/"g2g.bash" => "g2g-inspect"
  end

  test do
    system bin/"g2g-inspect", "fakesink"
    system bin/"g2g-launch", "-q", "audiotestsrc", "num-buffers=20", "!", "avenc_aac", "!", "fakesink"
  end
end
