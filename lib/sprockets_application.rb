module SprocketsApplication
  class << self
    def routes(map)
      map.resource(:sprockets)
    end
    
    def source
      output_file.to_s
    end
    
    def install_script
      output_file.save_to(asset_path)
    end
    
    def install_assets
      secretary.install_assets
    end

    protected
      def secretary
        Sprockets::Secretary.new(configuration.merge(:root => RAILS_ROOT))
      end
    
      def configuration
        YAML.load(IO.read(File.join(RAILS_ROOT, "config", "sprockets.yml"))) || {}
      end

      def output_file
        secretary.output_file
      end

      def asset_path
        File.join(Rails.public_path, "sprockets.js")
      end
  end
end
