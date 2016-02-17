class Mas < Formula
  desc "Mac App Store command line interface"
  homepage "https://github.com/argon/mas"
  url "https://github.com/argon/mas/releases/download/v1.0.2/mas-cli.zip"
  version "1.0.2"
  sha256 "2b4e799102bbbcac581b4f9e5a077a823f66de1022be8dd8d12dd15ce02d315d"

  head do
    url "https://github.com/cybertk/mas.git", :branch => "master"
  end

  def install
    # rbenv support
    if ENV["RBENV_ROOT"]
      ENV.prepend_path "PATH", ENV["RBENV_ROOT"] + "/shims"
    end

    # rvm support
    if ENV["rvm_path"]
      ENV["GEM_HOME"] = ENV["rvm_path"] + "/gems/" + ENV["RUBY_VERSION"]
      ENV.prepend_path "PATH", ENV["GEM_HOME"] + "/bin"
      ENV.prepend_path "PATH", ENV["MY_RUBY_HOME"] + "/bin"
    end

    system "script/bootstrap"
    system "script/build"

    bin.install "build/mas"
  end
end
