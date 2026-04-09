class OtelGui < Formula
  desc "Lightweight OpenTelemetry trace viewer"
  homepage "https://github.com/metafab/otel-gui"
  version "1.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metafab/otel-gui/releases/download/v1.3.0/otel-gui-macos-arm64.tar.gz"
      sha256 "db8282167974fcb4ca54fa403e93f182209c656fdbfce6919b9bbbdd3542c6ea"
    else
      url "https://github.com/metafab/otel-gui/releases/download/v1.3.0/otel-gui-macos-x64.tar.gz"
      sha256 "0f9146610b7097266e0c4384865d5c6d9a871365fea05ef479965135b50f94b4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/metafab/otel-gui/releases/download/v1.3.0/otel-gui-linux-arm64.tar.gz"
      sha256 "64d9034cb91cb15b9d33a27980b9dde7aa2f6eb8b0a68dde58ab217b9275a2cc"
    else
      url "https://github.com/metafab/otel-gui/releases/download/v1.3.0/otel-gui-linux-x64.tar.gz"
      sha256 "b89d09c6db46b6e206cf0dcd4f76789aa7cb4bac1978c72865c210f0dd02622e"
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
