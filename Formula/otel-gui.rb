class OtelGui < Formula
  desc "Lightweight OpenTelemetry viewer for local development"
  homepage "https://github.com/metafab/otel-gui"
  version "3.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metafab/otel-gui/releases/download/v3.1.0/otel-gui-macos-arm64.tar.gz"
      sha256 "5200faeb5ea3344af9a5d95fcbc1a9d74e3a4a2538af652252426fa30b656151"
    else
      url "https://github.com/metafab/otel-gui/releases/download/v3.1.0/otel-gui-macos-x64.tar.gz"
      sha256 "e265fc5bc79e6a8ae4c0889080c42f08a3c238606d34b2515527f5b72a198da4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/metafab/otel-gui/releases/download/v3.1.0/otel-gui-linux-arm64.tar.gz"
      sha256 "6105fe2053fe5e5369c6ba666a2077d2db69577aec3fd3609627716654dcf249"
    else
      url "https://github.com/metafab/otel-gui/releases/download/v3.1.0/otel-gui-linux-x64.tar.gz"
      sha256 "deb9772ff1c14f4db3ccc4f3cb1b3269bfcc59f21e195d733fadab276487ba64"
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
