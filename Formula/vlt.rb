# typed: false
# frozen_string_literal: true

class Vlt < Formula
  desc "Local-first, zero-knowledge secrets and password manager"
  homepage "https://github.com/raynosc/vlt"
  version "1.0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raynosc/vlt/releases/download/v#{version}/vlt_v#{version}_darwin_arm64.tar.gz"
      sha256 "0c6b287f4f8c49baefd69836ecc10f2c504cbaa84632e0abafd9e29e2c771c53"
    else
      url "https://github.com/raynosc/vlt/releases/download/v#{version}/vlt_v#{version}_darwin_amd64.tar.gz"
      sha256 "b609fcbdd6be38e0a1c21e830c859328c0cddf63a0e1224c57a73c5db37b7137"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/raynosc/vlt/releases/download/v#{version}/vlt_v#{version}_linux_amd64.tar.gz"
      sha256 "5a35bf3c2183d89c39bc2bc2c65f66e5da298d783f6a797ff49de4440f3bd66d"
    end
  end

  def install
    bin.install "vlt"
    bin.install "vlt-gui" if File.exist?("vlt-gui")
    bin.install "vlt-tui"
    bin.install "vlt-quick"
    bin.install "vlt-sync"
  end

  test do
    system "#{bin}/vlt", "--version"
  end
end
