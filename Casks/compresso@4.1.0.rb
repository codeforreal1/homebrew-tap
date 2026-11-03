# AUTO-GENERATED FILE. DO NOT EDIT!
cask "compresso@4.1.0" do
  version "4.1.0"

  on_arm do
    url "https://github.com/codeforreal1/compressO/releases/download/#{version}/CompressO_#{version}_aarch64.dmg"
    sha256 "d94f22d5e49fd6189a537be854bbf8f06db5d446e7fba20c6792eb99b3d14436"
  end

  on_intel do
    url "https://github.com/codeforreal1/compressO/releases/download/#{version}/CompressO_#{version}_x64.dmg"
    sha256 "0a399b65a3d11a6350da8bfd62f2d74dff68149b498421abef874ecbcfb59f63"
  end

  name "CompressO"
  desc "Compress any video/image into a tiny size"
  homepage "https://github.com/codeforreal1/compressO"

  depends_on macos: :ventura # macOS 13 or newer

  # Clears the quarantine flag macOS adds to downloaded apps
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-cr", "{{appdir}}/CompressO.app"],
        must_succeed:   false,
        writable_paths: ["CompressO.app"],
        writable_base:  :appdir
  end

  app "CompressO.app"
  # The command line tool (4.1.0 and later), as `compresso`; inside the app it is `compresso-cli`,
  # as `compresso` would clash with the app's `compressO` on a case-insensitive disk
  binary "#{appdir}/CompressO.app/Contents/MacOS/compresso-cli", target: "compresso"

  zap trash: [
    "~/Library/Application Support/com.compresso.app",
    "~/Library/Caches/com.compresso.app",
    "~/Library/Preferences/com.compresso.app.plist",
    "~/Library/Saved Application State/com.compresso.app.savedState",
  ]
end
