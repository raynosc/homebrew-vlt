cask "vlt" do
  version "1.0.0"
  sha256 "2477d48a1dd06df489eedca16216f9f58b703312850bc39fb6fcd53e1dde3812"

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
