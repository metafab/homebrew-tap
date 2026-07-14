class OtelGui < Formula
  desc "Lightweight OpenTelemetry trace viewer"
  homepage "https://github.com/metafab/otel-gui"
  version "2.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metafab/otel-gui/releases/download/v2.1.0/otel-gui-macos-arm64.tar.gz"
      sha256 "161b4b335cb37350e9b00845177d30a78e3e8d066a9556d7c84e894ae95959bb"
    else
      url "https://github.com/metafab/otel-gui/releases/download/v2.1.0/otel-gui-macos-x64.tar.gz"
      sha256 "3d2c3ca7c7aed41bf2d5d24f8c1b28986471ca110613c45121365625a7db4362"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/metafab/otel-gui/releases/download/v2.1.0/otel-gui-linux-arm64.tar.gz"
      sha256 "015dc10d976329201ed60edc0dd83dce5f8106d6287f6b50267fae5c969f2a6e"
    else
      url "https://github.com/metafab/otel-gui/releases/download/v2.1.0/otel-gui-linux-x64.tar.gz"
      sha256 "713491a574e6ea291edb9e1ca64703f6e4f2faf212af939fa58d8b54b6a5a655"
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
