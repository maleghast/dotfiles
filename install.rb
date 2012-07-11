#!/usr/bin/env ruby

require 'fileutils'
require 'getoptlong'

class DotfilesInstaller
  def initialize
    @base_path = File.expand_path File.dirname(__FILE__)
    @user = ENV['USER']
  end

  def brew
    system "/usr/bin/ruby -e \"$(/usr/bin/curl -fsSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)\""

    packages = [
      "ack", 
      "connect", 
      "rlwrap", 
      "hg", 
      "libyaml", 
      "memcached",
      "rbenv",
      "ruby-build",
      "https://raw.github.com/hmans/rbfu/1a1690e7fab18d01c03abc9c4655e8a57388c8b1/homebrew/rbfu.rb",
      "samba", 
      "https://raw.github.com/AndrewVos/homebrew-alt/master/duplicates/vim.rb"
    ]

    packages.each do |package|
      system "brew install #{package}"
    end
  end

  def certificates path
    location = File.expand_path "~/.certs"

    FileUtils.mkdir_p location

    ["dev.bbc.co.uk.p12", "dev.bbc.co.uk.pem", "ca.pem"].each do |cert|
      if File.exists?("#{path}/#{cert}")
        FileUtils.cp "#{path}/#{cert}", "#{location}/#{cert}"
      end
    end
  end

  def ssh path
    location = File.expand_path "~/.ssh"

    FileUtils.mkdir_p location

    FileUtils.ln_s "#{@base_path}/ssh/config", "#{location}/config"
    FileUtils.ln_s "#{@base_path}/ssh/proxy", "#{location}/proxy"
    FileUtils.cp "#{path}/id_rsa", "#{location}/id_rsa"
    FileUtils.cp "#{path}/id_rsa.pub", "#{location}/id_rsa.pub"

    FileUtils.chmod 0600, "#{location}/id_rsa"
    FileUtils.chmod 0600, "#{location}/id_rsa.pub"
  end

  def zsh
    location = File.expand_path "~"

    FileUtils.ln_s "#{@base_path}/zsh/zshrc", "#{location}/.zshrc"

    system "curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh"
  end
  
  def terminal
    location = File.expand_path "~"

    FileUtils.ln_s "#{@base_path}/terminal/inputrc", "#{location}/.inputrc"
    FileUtils.ln_s "#{@base_path}/terminal/language", "#{location}/.language"
  end

  def git
    location = File.expand_path "~"

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

installer.zsh
installer.terminal
installer.brew
installer.git