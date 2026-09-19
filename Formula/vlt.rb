# typed: false
# frozen_string_literal: true

class Vlt < Formula
  desc "Local-first, zero-knowledge secrets and password manager"
  homepage "https://github.com/raynosc/vlt"
  version "1.0.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raynosc/vlt/releases/download/v#{version}/vlt_v#{version}_darwin_arm64.tar.gz"
      sha256 "ae86350d3632e429fc35553736818e118401822cfa1a6f2f76b05976151f539b"
    else
      url "https://github.com/raynosc/vlt/releases/download/v#{version}/vlt_v#{version}_darwin_amd64.tar.gz"
      sha256 "1868bf1bdb29e1451741d2d8cb9bdb7dbbbb24406a31815d9572154b5c4b2724"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/raynosc/vlt/releases/download/v#{version}/vlt_v#{version}_linux_amd64.tar.gz"
      sha256 "02dc12d760ffcda8b2ec93d78134bca8f7467a26ba194893cdf26df58d963a5c"
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
