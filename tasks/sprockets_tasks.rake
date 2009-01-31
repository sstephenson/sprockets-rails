namespace :sprockets do
  desc "Generate and install the Sprockets concatenated JavaScript file"
  task :install_script do
    require "config/environment"
    SprocketsApplication.install_script
  end
  
  desc "Install any assets provided by Sprockets scripts"
  task :install_assets do
    require "config/environment"
    SprocketsApplication.install_assets
  end
end