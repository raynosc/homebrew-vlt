cask "vlt" do
  version "1.0.3"
  sha256 "8571ed1f5f064acba221b7f475c10a9ec6995a1842c6b911968d7caa9d611cf3"

  url "https://github.com/raynosc/vlt/releases/download/v#{version}/vlt_v#{version}_macOS_Universal.app.zip"
  name "vlt"
  desc "Local-first, zero-knowledge secrets and password manager"
  homepage "https://github.com/raynosc/vlt"

  app "vlt.app"
  binary "#{appdir}/vlt.app/Contents/MacOS/vlt", target: "vlt-gui"
  binary "#{appdir}/vlt.app/Contents/MacOS/vlt-cli", target: "vlt"
  binary "#{appdir}/vlt.app/Contents/MacOS/vlt-tui", target: "vlt-tui"
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
