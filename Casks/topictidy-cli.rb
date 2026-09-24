cask "topictidy-cli" do
  version "1.0.0"
  sha256 "e917a0a2c94c46b0184b1de0d6606736490b4d3737222808889c7a8a56cbe3c1"

  url "https://github.com/YangChen-cn/TopicTidy/releases/download/v#{version}/topictidy-cli-#{version}-arm64.tar.gz"
  name "TopicTidy CLI"
  desc "Command-line Downloads organizer (the tt binary from TopicTidy)"
  homepage "https://github.com/YangChen-cn/TopicTidy"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on macos: :sequoia
  depends_on arch: :arm64

  # Prebuilt arm64 binary: no Xcode, Swift, CLT or Python required.
  binary "topictidy-cli-#{version}-arm64/tt", target: "tt"

  caveats <<~EOS
    只需菜单栏界面时安装应用本体：
      brew install --cask YangChen-cn/tap/topictidy
  EOS
end
