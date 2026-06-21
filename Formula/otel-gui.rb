class OtelGui < Formula
  desc "Lightweight OpenTelemetry trace viewer"
  homepage "https://github.com/metafab/otel-gui"
  version "2.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metafab/otel-gui/releases/download/v2.0.0/otel-gui-macos-arm64.tar.gz"
      sha256 "73fbb724fd6d2e8e92f775ed4d312cc5f68fbe64bc48ba47ba6e056b05479931"
    else
      url "https://github.com/metafab/otel-gui/releases/download/v2.0.0/otel-gui-macos-x64.tar.gz"
      sha256 "78a7c9c480f6fbfd72e9d82644facbc97c47659a535eb1b589db6445ba74310b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/metafab/otel-gui/releases/download/v2.0.0/otel-gui-linux-arm64.tar.gz"
      sha256 "cf73f62a106ab244d1fea6313ac433e3223212a274b92e244394b07d918dc7fc"
    else
      url "https://github.com/metafab/otel-gui/releases/download/v2.0.0/otel-gui-linux-x64.tar.gz"
      sha256 "ed679720918be8e1f561d19d070159d1f00573f5b07b2d7e8b85eaeaf3091517"
    end
  end

  def install
    libexec.install "otel-gui", "build", "proto", "node_modules"
    (bin/"otel-gui").write <<~EOS
      #!/bin/bash
      exec "#{libexec}/otel-gui" ""
    EOS
  end

  test do
    assert_path_exist libexec/"otel-gui"
  end
end
