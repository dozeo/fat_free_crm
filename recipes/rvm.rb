namespace :rvm do

  desc "Install rvm"
  task :install, :roles => :web do
    install_deps

    run "if ! (which rvm); then sudo curl -L http://bit.ly/rvm-install-system-wide | sudo bash; fi"
    run "if ! (rvm list | grep #{rvm_ruby_string}); then rvmsudo rvm install #{rvm_ruby_string}; fi"
  end

  task :install_deps, :roles => :web do
    yum.install( {:base => %w(curl git gcc-c++ patch readline readline-devel zlib zlib-devel libyaml-devel libffi-devel openssl-devel postgresql-devel)}, :stable )
  end

end

before "deploy:cold", "rvm:install"
