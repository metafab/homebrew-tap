class OtelGui < Formula
  desc "Lightweight OpenTelemetry trace viewer"
  homepage "https://github.com/metafab/otel-gui"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metafab/otel-gui/releases/download/v1.2.0/otel-gui-macos-arm64.tar.gz"
      sha256 "c385a3353ed2a2411cad461f1fabc9b7ed8255d9fe46975b569d74d960b184db"
    else
      url "https://github.com/metafab/otel-gui/releases/download/v1.2.0/otel-gui-macos-x64.tar.gz"
      sha256 "3f3c273977139c4d0a080ec9e574b2856e3fd13bf25d312f6e7d1c82c4131b5e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/metafab/otel-gui/releases/download/v1.2.0/otel-gui-linux-arm64.tar.gz"
      sha256 "2dbb8639f629c03363926165acfac3903610b80e186e6a683920a0e166eef05b"
    else
      url "https://github.com/metafab/otel-gui/releases/download/v1.2.0/otel-gui-linux-x64.tar.gz"
      sha256 "d8d2e5722c5492e5bf80ec3fbabd796d79b4d94e12ef651c6d1fd501592c1be2"
    end
  end

  def install
    libexec.install "otel-gui", "build", "proto"
    (bin/"otel-gui").write <<~EOS
      #!/bin/bash
      exec "#{libexec}/otel-gui" ""
    EOS
  end

  test do
    assert_path_exist libexec/"otel-gui"
  end
end
