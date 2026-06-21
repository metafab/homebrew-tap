class OtelGui < Formula
  desc "Lightweight OpenTelemetry trace viewer"
  homepage "https://github.com/metafab/otel-gui"
  version "2.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metafab/otel-gui/releases/download/v2.0.0/otel-gui-macos-arm64.tar.gz"
      sha256 "acd55eea71fb208b1baae732ca7bfea97f4e5a7b659589705025fa709c6d3d83"
    else
      url "https://github.com/metafab/otel-gui/releases/download/v2.0.0/otel-gui-macos-x64.tar.gz"
      sha256 "f4110a8ff60f2d7606f5428071d2015b5240158cf0129d373a758dc9b06bd09d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/metafab/otel-gui/releases/download/v2.0.0/otel-gui-linux-arm64.tar.gz"
      sha256 "c6a28c97ca44a35daf0ce66522a20bc36196f4ea3d8a24b84d0e56fdbdd52efc"
    else
      url "https://github.com/metafab/otel-gui/releases/download/v2.0.0/otel-gui-linux-x64.tar.gz"
      sha256 "8d580081e24a0419c11c3d7d610377b5d0d52a7fcb9ef15623b13065cae012a1"
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
