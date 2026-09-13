# typed: false
# frozen_string_literal: true

class Vlt < Formula
  desc "Local-first, zero-knowledge secrets and password manager"
  homepage "https://github.com/raynosc/vlt"
  version "1.0.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raynosc/vlt/releases/download/v#{version}/vlt_v#{version}_darwin_arm64.tar.gz"
      sha256 "5846ba6d24f8668d8c0a90e729768fff3c9e1fde98bd8d459bc2c292f9461bae"
    else
      url "https://github.com/raynosc/vlt/releases/download/v#{version}/vlt_v#{version}_darwin_amd64.tar.gz"
      sha256 "5940a287b7f2c9aec8bf25d0ace293fa329470bb06b458fda6249de29a607765"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/raynosc/vlt/releases/download/v#{version}/vlt_v#{version}_linux_amd64.tar.gz"
      sha256 "0b6690641f01a72d7be380da7466ddd7976ef9f3ce568d368456e4592fb1c654"
    end
  end

  def install
    bin.install "vlt"
    bin.install "vlt-gui" if File.exist?("vlt-gui")
    bin.install "vlt-tui"
    bin.install "vlt-sync"
  end

  test do
    system "#{bin}/vlt", "--version"
  end
end
