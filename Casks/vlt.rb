cask "vlt" do
  version "1.0.2"
  sha256 "7e8765a0e1be0ae5cca78bbdc6461ac15084ebc1665ad9b6e072264e722584e1"

  url "https://github.com/raynosc/vlt/releases/download/v#{version}/vlt_v#{version}_macOS_Universal.app.zip"
  name "vlt"
  desc "Local-first, zero-knowledge secrets and password manager"
  homepage "https://github.com/raynosc/vlt"

  app "vlt.app"
  binary "#{appdir}/vlt.app/Contents/MacOS/vlt", target: "vlt-gui"
  binary "#{appdir}/vlt.app/Contents/MacOS/vlt-cli", target: "vlt"
  binary "#{appdir}/vlt.app/Contents/MacOS/vlt-tui", target: "vlt-tui"
  binary "#{appdir}/vlt.app/Contents/MacOS/vlt-quick", target: "vlt-quick"
  binary "#{appdir}/vlt.app/Contents/MacOS/vlt-sync", target: "vlt-sync"

  postflight do
    system_command "xattr",
                   args: ["-d", "com.apple.quarantine", "#{appdir}/vlt.app"],
                   sudo: false
  end

  zap trash: [
    "~/.config/passwd",
  ]
end
