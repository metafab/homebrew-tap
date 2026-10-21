class OtelGui < Formula
  desc "Lightweight OpenTelemetry viewer for local development"
  homepage "https://github.com/metafab/otel-gui"
  version "3.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/metafab/otel-gui/releases/download/v3.1.0/otel-gui-macos-arm64.tar.gz"
      sha256 "2982fd3b3c44a459dd8a8ae973c7b6a835165ddaad4b500e414272122f3a281d"
    else
      url "https://github.com/metafab/otel-gui/releases/download/v3.1.0/otel-gui-macos-x64.tar.gz"
      sha256 "0b0643f39f53956da01b03aee701bd07c75574c1e74d6a400a19ee9cb5471af0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/metafab/otel-gui/releases/download/v3.1.0/otel-gui-linux-arm64.tar.gz"
      sha256 "44e5b3ce8227f3460f3b663b929b9af629ab4a92605e9713cd9113afa3822a22"
    else
      url "https://github.com/metafab/otel-gui/releases/download/v3.1.0/otel-gui-linux-x64.tar.gz"
      sha256 "ad3dd780c7e5eff0f7a5d3435ad3f00f09078afc08c16790f6f4afb88bee8e26"
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
