class TopictidyCli < Formula
  desc "Local, explainable and reversible topic-based Downloads organizer (CLI)"
  homepage "https://github.com/YangChen-cn/TopicTidy"
  url "https://github.com/YangChen-cn/TopicTidy/releases/download/v0.10.0/topictidy-cli-0.10.0-arm64.tar.gz"
  sha256 "a58e53fd6a75c9c46693d115ee1b8f59d797900f08528b2ee035f502fd85c374"
  version "0.10.0"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on macos: :sequoia
  depends_on arch: :arm64

  def install
    prefix_dir = Dir["topictidy-cli-*/"].first || "."
    bin.install "#{prefix_dir}tt" => "tt"
    prefix.install "#{prefix_dir}LICENSE" => "LICENSE"
    doc.install "#{prefix_dir}README.md" => "README.md"
  end

  def caveats
    <<~EOS
      仅安装命令行工具。需要菜单栏界面时：
        brew install --cask YangChen-cn/tap/topictidy
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tt --version")
    system "#{bin}/tt", "--help"
  end
end
