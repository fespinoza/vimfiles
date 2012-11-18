require 'rake'

desc 'Install plugin and documentation'
task :install do
  current_dir = Dir.pwd
  system_puts("rm -rf ~/.vim ~/.vimrc ~/.gvimrc")
  system_puts("git submodule init")
  system_puts("git submodule update")
  system_puts("ln -s #{current_dir} ~/.vim")
  system_puts("ln -s #{current_dir}/vimrc ~/.vimrc")
  system_puts("ln -s #{current_dir}/gvimrc ~/.gvimrc")
end

task default: :install

def system_puts(command)
  puts(command)
  system(command)
end
