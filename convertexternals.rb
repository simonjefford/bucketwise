require 'yaml'
hash = YAML::load_file("config/externals.yml")
hash.keys.each do |path|
  puts path
end
