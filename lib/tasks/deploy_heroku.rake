namespace :deploy do
  desc "Deploy to heroku"
  task :heroku_push do
    revision = `git rev-parse HEAD`
    puts revision
    system "echo #{revision.chomp} > REVISION"
    system "git add REVISION && git ci -am \"Marked latest revision\""
    system "git push heroku HEAD:master"
    system "git push origin master"
  end
end
