#!/usr/bin/env ruby

class GitDropbox
  def dropbox_path
    dropbox = `defaults read com.getdropbox.dropbox NSNavLastRootDirectory`.chop
    dropbox = File.expand_path "#{dropbox}/Dropbox/Projects"

    if !File.exists?(dropbox) then
      puts "Dropbox path not found"
      Process.exit 0
    end

    @dropbox_path = dropbox
  end

  def create_repo(name)
   puts "git init --base #{self.dropbox_path}/#{name}.git"
  end

  def add_remote(remote_name)
    repo = "#{self.dropbox_path}/#{remote_name}.git"

    if !File.exists?(repo) then
      self.create_repo remote_name
    end

    puts "git remote add dropbox #{repo}"
  end
end

gd = GitDropbox.new()

if ARGV[0] == "init" then
  gd.create_repo ARGV[1]
elsif ARGV[0] == "add-remote"
  gd.add_remote ARGV[1]
end
