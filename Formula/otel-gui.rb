class OtelGui < Formula
  desc "Lightweight OpenTelemetry trace viewer"
  homepage "https://github.com/metafab/otel-gui"
  version "1.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metafab/otel-gui/releases/download/v1.3.0/otel-gui-macos-arm64.tar.gz"
      sha256 "88bb991dd3ce456298f3b8d55f72ba4dd8757fb20dde8914b63e0b5d800590f0"
    else
      url "https://github.com/metafab/otel-gui/releases/download/v1.3.0/otel-gui-macos-x64.tar.gz"
      sha256 "0feba464bfae58f71e9c87a0df84bf2e3ee06d798d418b1651b9cc3eeba279cd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/metafab/otel-gui/releases/download/v1.3.0/otel-gui-linux-arm64.tar.gz"
      sha256 "c7c6e11a878e3af6e7846ca06da0ac1b185183d65098661559f84cd04325c9ae"
    else
      url "https://github.com/metafab/otel-gui/releases/download/v1.3.0/otel-gui-linux-x64.tar.gz"
      sha256 "f8e9d5e93dcc6c090139dcb556ea206e16888f427d539ea07969e6990558f9e1"
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
