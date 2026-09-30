class OtelGui < Formula
  desc "Lightweight OpenTelemetry trace viewer"
  homepage "https://github.com/metafab/otel-gui"
  version "3.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metafab/otel-gui/releases/download/v3.0.0/otel-gui-macos-arm64.tar.gz"
      sha256 "c00b6adadc6d32f33915ab86dc6d6fd00d813a5f0ea8f232addbdefe9cedd4cc"
    else
      url "https://github.com/metafab/otel-gui/releases/download/v3.0.0/otel-gui-macos-x64.tar.gz"
      sha256 "52e999e273a43e590a95ed4f5676bcac4bbd9aa25538bbe2bfc5cae326ba5b00"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/metafab/otel-gui/releases/download/v3.0.0/otel-gui-linux-arm64.tar.gz"
      sha256 "23ad106cb0d6494274421e70c855f8f6dadb9ed97df853e1eda2d808566d1d0f"
    else
      url "https://github.com/metafab/otel-gui/releases/download/v3.0.0/otel-gui-linux-x64.tar.gz"
      sha256 "7d8c1b84f2f432448529afcd1cf0acc8d294ac633f1edf50467cf227d47c7db1"
    end
  end

  def install
    libexec.install "otel-gui", "build", "proto", "node_modules"
    (bin/"otel-gui").write <<~EOS
      #!/bin/bash
      exec "#{libexec}/otel-gui" "$@"
    EOS
  end

  test do
    assert_path_exist libexec/"otel-gui"
  end
end
