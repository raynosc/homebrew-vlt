cask "vlt" do
  version "1.0.0"
  sha256 "0141c2a3408a8d9ec79c83f3e57a481eff777b9c2287eebfef1276498705ebe8"

  url "https://github.com/raynosc/vlt/releases/download/v#{version}/vlt_v#{version}_macOS_Universal.app.zip"
  name "vlt"
  desc "Local-first, zero-knowledge secrets and password manager"
  homepage "https://github.com/raynosc/vlt"

  app "vlt.app"
  binary "#{appdir}/vlt.app/Contents/MacOS/vlt"

  postflight do
    system_command "xattr",
                   args: ["-d", "com.apple.quarantine", "#{appdir}/vlt.app"],
                   sudo: false
  end

  zap trash: [
    "~/.config/passwd",
  ]
end
