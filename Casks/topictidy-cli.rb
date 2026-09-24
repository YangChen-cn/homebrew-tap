cask "topictidy-cli" do
  version "1.0.1"
  sha256 "660eb09cbc8d986d970e066e5513521882677fcafe21d38a78f8581546bff523"

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
