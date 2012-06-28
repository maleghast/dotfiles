#!/usr/bin/env ruby

require 'fileutils'
require 'getoptlong'

class DotfilesInstaller
  def initialize
    # TODO: Find base path
    @base_path = "/Users/sth/Development/dotfiles"
  end

  def brew
    system "/usr/bin/ruby -e \"$(/usr/bin/curl -fsSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)\""

    ["ack", "connect", "rlwrap", "hg", "libyaml", "memcached", "rbfu", "ruby-build"].each do |package|
      system "brew install #{package}"
    end
  end

  def vim
    system "brew install https://raw.github.com/AndrewVos/homebrew-alt/master/duplicates/vim.rb"
    system "mv /usr/bin/vim /usr/bin/vim72"
  end

  def certificates
    location = File.expand_path("~/.certs")

    FileUtils.mkdir_p location

    ["dev.bbc.co.uk.p12", "dev.bbc.co.uk.pem", "ca.pem"].each do |cert|
      if File.exists?("#{path}/#{cert}") == false
        FileUtils.cp "#{path}/#{cert}", "#{location}/#{cert}"
      end
    end
  end

  def ssh path
    location = File.expand_path("~/.ssh")

    FileUtils.mkdir_p location

    FileUtils.ln_s "#{@base_path}/ssh/config", "#{location}/config"
    FileUtils.cp "#{path}/ssh/id_rsa", "#{location}/ssh/id_rsa"
    FileUtils.cp "#{path}/ssh/id_rsa.pub", "#{location}/ssh/id_rsa.pub"
  end

  def zsh

  end

  def git
    FileUtils.ln_s "#{@base_path}/git/gitconfig", "#{location}/.gitconfig"
  end
end

installer = DotfilesInstaller.new

opts = GetoptLong.new(
  [ '--help', '-h', GetoptLong::NO_ARGUMENT ],
  [ '--ssh', '-s', GetoptLong::OPTIONAL_ARGUMENT ],
  [ '--cert', '-c', GetoptLong::OPTIONAL_ARGUMENT ]
)

opts.each do |arg, val|
  case arg
    when "--help"
      puts "install [OPTION]"
      puts ""
      puts "\t--ssh\tInstalls SSH Certs"
      puts "\t--cert\tInstalls BBC Certs"
    when "--ssh"
      installer.ssh val
    when "--cert"
      installer.certificates val
  end
end

installer.brew
installer.zsh
installer.git