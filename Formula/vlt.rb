# typed: false
# frozen_string_literal: true

class Vlt < Formula
  desc "Local-first, zero-knowledge secrets and password manager"
  homepage "https://github.com/raynosc/vlt"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raynosc/vlt/releases/download/v#{version}/vlt_v#{version}_darwin_arm64.tar.gz"
      sha256 "cb3187a5c070b9dd8704f1b16f0435f306f440d9c890b83cf8b3a37d02226c7f"
    else
      url "https://github.com/raynosc/vlt/releases/download/v#{version}/vlt_v#{version}_darwin_amd64.tar.gz"
      sha256 "43cafc338870f9e2e27f2294fe0ca52dd6f59e72c19affc26e29887569720c4a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/raynosc/vlt/releases/download/v#{version}/vlt_v#{version}_linux_amd64.tar.gz"
      sha256 "368704653b5625c7e8ac99f05967ff9d809bfd8368ba0ac6713f0b1c148db333"
    end
  end

  def install
    bin.install "vlt"
    bin.install "vlt-tui"
    bin.install "vlt-quick"
    bin.install "vlt-sync"
  end

  test do
    system "#{bin}/vlt", "--version"
  end
end
