#!/usr/bin/env ruby

class GitDropbox
  def initialize()
    @working = Dir.pwd
  end

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
   system "git init --bare #{self.dropbox_path}/#{name}.git"
  end

  def add_remote(remote_name)
    repo = "#{self.dropbox_path}/#{remote_name}.git"

    if !File.exists?(repo) then
      self.create_repo remote_name
    end

    system "git remote add dropbox #{repo}"
  end
  
  def clone(repo_name, name = nil)
    repo = "#{self.dropbox_path}/#{repo_name}.git"

    if !File.exists?(repo) then
      self.create_repo repo_name
    end
 
    if name != nil then
      system "git clone #{repo} #{name}"
    else 
      name = repo_name
      system "git clone #{repo}"
    end

    Dir.chdir "#{@working}/#{name}"
    system "git remote rm origin"

    self.add_remote repo_name
  end

  def help
    puts "add-remote\tAdds remote to the current project"
    puts "init\t\tCreates a new repo in dropbox"
    puts "clone\t\tClones repo"
  end
end

gd = GitDropbox.new()

if ARGV[0] == "init" then
  gd.create_repo ARGV[1]
elsif ARGV[0] == "add-remote"
  gd.add_remote ARGV[1]
 elsif ARGV[0] == "clone"
  gd.clone ARGV[1], ARGV[2]
else
  gd.help
end
