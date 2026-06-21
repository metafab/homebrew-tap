class OtelGui < Formula
  desc "Lightweight OpenTelemetry trace viewer"
  homepage "https://github.com/metafab/otel-gui"
  version "2.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metafab/otel-gui/releases/download/v2.0.1/otel-gui-macos-arm64.tar.gz"
      sha256 "bc3ed0ad851dbef29792cb2ce27463644f9ae41dd715a4eeecb7535ee3f75863"
    else
      url "https://github.com/metafab/otel-gui/releases/download/v2.0.1/otel-gui-macos-x64.tar.gz"
      sha256 "9f3a569bccc63aa2a4969e7651e29b49d1ad02677b6cbe24f43fda17ec985226"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/metafab/otel-gui/releases/download/v2.0.1/otel-gui-linux-arm64.tar.gz"
      sha256 "85ad21c5ba4501b58163617837c8066ab747ffab1888158d82f9b791d19ecfbe"
    else
      url "https://github.com/metafab/otel-gui/releases/download/v2.0.1/otel-gui-linux-x64.tar.gz"
      sha256 "fee430f27a9ce02841605b3b233b32dd8120c2fdb5589b8799a8f4b816af814a"
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
