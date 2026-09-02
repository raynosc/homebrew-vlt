# typed: false
# frozen_string_literal: true

class Vlt < Formula
  desc "Local-first, zero-knowledge secrets and password manager"
  homepage "https://github.com/raynosc/vlt"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raynosc/vlt/releases/download/v1.0.0/vlt_v1.0.0_darwin_arm64.tar.gz"
      sha256 "c95d903557ec6ef41f4947ac6a04c062163c2f72ffb8641e76a7b369b438bbc3"
    else
      url "https://github.com/raynosc/vlt/releases/download/v1.0.0/vlt_v1.0.0_darwin_amd64.tar.gz"
      sha256 "c01d757be339191a541a1fb4b5f993b1b64b035c64ad707769f05bbef7efac92"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/raynosc/vlt/releases/download/v1.0.0/vlt_v1.0.0_linux_amd64.tar.gz"
      sha256 "a3ad2e80f0745db5f0d6f38f128a52a5551602e9b960aac926e7fc932d253956"
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
