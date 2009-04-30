require 'yaml'
require 'fileutils'
include FileUtils
hash = YAML::load_file("config/externals.yml")
homepath = `pwd`
hash.keys.each do |path|
  rm_rf path
  system "git clone #{hash[path][:repository]} #{path}"
  cd path do
    system "git co #{hash[path][:revision]}"
    rm_rf ".git"
  end
end
