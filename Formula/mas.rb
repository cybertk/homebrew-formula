class Mas < Formula
  desc "Mac App Store command line interface"
  homepage "https://github.com/argon/mas"
  url "https://github.com/argon/mas/releases/download/v1.0.2/mas-cli.zip"
  version "1.0.2"
  sha256 "2b4e799102bbbcac581b4f9e5a077a823f66de1022be8dd8d12dd15ce02d315d"

  head do
    url "https://github.com/cybertk/mas.git", :branch => "login"
  end

  def install
    # rbenv and rvm support
    ENV.prepend_path "PATH", "/usr/local/var/rbenv/shims"
    ENV.prepend_path "PATH", "~/.rvm/bin"

    system "script/bootstrap"
    system "script/build"

    bin.install "build/mas"
  end
end
