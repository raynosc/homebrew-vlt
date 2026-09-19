cask "vlt" do
  version "1.0.4"
  sha256 "a9d3280ded6c2f7a14665c8fbbd8f5f4a50d84bc41ac2107349fc83ade716e5c"

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
