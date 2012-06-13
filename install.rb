#!/usr/bin/env ruby

require 'fileutils'

class DotfilesInstaller
  def initialize
    @certificates_path = File.expand_path("~/.certs")
  end

  def certificates
    if !File.exists?(@certificates_path)
      File.mkdir(@certificates_path)
    end

    printf "Enter certificate location [skip|dir]: "
    location = gets.chomp

    if location == "skip"
      return nil
    end

    location = File.expand_path(location)

    if (!File.exists?(location))
      return nil
    end

    ["greenhouse.p12", "greenhouse.pem", "ca.greenhouse.pem"].each do |cert|
      if !File.exists?("#{location}/#{cert}")
        FileUtils.cp "#{location}/#{cert}", "#{@certificates_path}/#{cert}"
      end
    end
  end

  def go
    self.certificates
  end
end

installer = DotfilesInstaller.new()
installer.go()