namespace :sprockets do
  desc "Generate the Sprockets concatenated JavaScript file"
  task :generate_asset do
    require "config/environment"
    SprocketsApplication.generate_asset!
  end
end