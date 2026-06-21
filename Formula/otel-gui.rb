class OtelGui < Formula
  desc "Lightweight OpenTelemetry trace viewer"
  homepage "https://github.com/metafab/otel-gui"
  version "2.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metafab/otel-gui/releases/download/v2.0.0/otel-gui-macos-arm64.tar.gz"
      sha256 "4a0b9e08a37c0a91d7809a84c3dc97f9ae0cdb30830cfc32e2d0e071c91643e9"
    else
      url "https://github.com/metafab/otel-gui/releases/download/v2.0.0/otel-gui-macos-x64.tar.gz"
      sha256 "657cec95cf9d62d29df7f651977d188f63b94c2716373093500738eafa1d278e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/metafab/otel-gui/releases/download/v2.0.0/otel-gui-linux-arm64.tar.gz"
      sha256 "f893f83b925411bd1099c7fbd612041950844afaa1f1d87fd7bc1966b2751ac2"
    else
      url "https://github.com/metafab/otel-gui/releases/download/v2.0.0/otel-gui-linux-x64.tar.gz"
      sha256 "f6f7e61e57a85c87593e11d5db06adb2e512ac498da1b2cf01e52b0f6dd6a0f2"
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
