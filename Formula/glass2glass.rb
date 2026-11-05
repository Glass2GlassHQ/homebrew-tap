class Glass2glass < Formula
  desc "Multimedia pipeline tools g2g-launch and g2g-inspect"
  homepage "https://github.com/Glass2GlassHQ/glass2glass"
  version "0.14.0"
  license "MPL-2.0"

  depends_on :macos

  on_arm do
    url "https://github.com/Glass2GlassHQ/glass2glass/releases/download/v0.14.0/g2g-v0.14.0-aarch64-apple-darwin.tar.gz"
    sha256 "9d242338d8c1432d1ae4f77f691a33e9e25dec5e1b183a1870baccb0f85418f8"
  end
  on_intel do
    url "https://github.com/Glass2GlassHQ/glass2glass/releases/download/v0.14.0/g2g-v0.14.0-x86_64-apple-darwin.tar.gz"
    sha256 "f1571da0095853dc0f4a8da3b976d75c5a74c8ed882c1cc1082cfc15c670655a"
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"g2g-launch", libexec/"g2g-inspect"
  end

  test do
    system bin/"g2g-inspect", "fakesink"
    system bin/"g2g-launch", "-q", "audiotestsrc", "num-buffers=20", "!", "avenc_aac", "!", "fakesink"
  end
end
