# typed: false
# frozen_string_literal: true

class Vlt < Formula
  desc "Local-first, zero-knowledge secrets and password manager"
  homepage "https://github.com/raynosc/vlt"
  version "1.0.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raynosc/vlt/releases/download/v#{version}/vlt_v#{version}_darwin_arm64.tar.gz"
      sha256 "a05eedd1c95c8f287a5d0b8ba607c0c9a8dc18fe2eeb7a285f8ad34091dad0b2"
    else
      url "https://github.com/raynosc/vlt/releases/download/v#{version}/vlt_v#{version}_darwin_amd64.tar.gz"
      sha256 "a3640c8e044d6c531920332ec054982a2260c70e15bb5d50272a9431b9d5bce4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/raynosc/vlt/releases/download/v#{version}/vlt_v#{version}_linux_amd64.tar.gz"
      sha256 "029ab24ede46e1cd44dbefa6e2f907cbdbd29a93640be205ea8a1b6914db6819"
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
