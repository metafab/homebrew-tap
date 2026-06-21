class OtelGui < Formula
  desc "Lightweight OpenTelemetry trace viewer"
  homepage "https://github.com/metafab/otel-gui"
  version "2.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metafab/otel-gui/releases/download/v2.0.0/otel-gui-macos-arm64.tar.gz"
      sha256 "4a3ecf98569bbd736a218ffa8165e164eab67e93b5ff9ed7766aa87252f9e0ec"
    else
      url "https://github.com/metafab/otel-gui/releases/download/v2.0.0/otel-gui-macos-x64.tar.gz"
      sha256 "fcd38e45dc9278627edb5746e07209500a050191cd8bc902512304400f2ee914"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/metafab/otel-gui/releases/download/v2.0.0/otel-gui-linux-arm64.tar.gz"
      sha256 "ea4e54c522302aa2b0a771f476f3a60b53779109735846f19a0cf60d01bb80dc"
    else
      url "https://github.com/metafab/otel-gui/releases/download/v2.0.0/otel-gui-linux-x64.tar.gz"
      sha256 "5fe7af4d4f201dd57a9919173588f88b30eece040c65762570963817116f6e82"
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
