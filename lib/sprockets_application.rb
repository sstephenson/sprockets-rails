module SprocketsApplication
  class << self
    def routes(map)
      map.resource(:sprockets)
    end
    
    def output_file
      preprocessor_for(configuration).output_file
    end

    def source
      output_file.to_s
    end
    
    def generate_asset!
      output_file.save_to(asset_path)
    end

    def asset_path
      File.join(Rails.public_path, "sprockets.js")
    end

    protected
      def configuration
        YAML.load(IO.read(File.join(RAILS_ROOT, "config", "sprockets.yml"))) || {}
      end
    
      def expand_paths(paths)
        paths.map { |path| Dir[path] }.flatten.compact
      end
      
      def preprocessor_for(configruation)
        environment = environment_for(configuration)
        returning Sprockets::Preprocessor.new(environment) do |preprocessor|
          expand_paths(configuration[:source_files]).each do |filename|
            if pathname = environment.find(filename)
              preprocessor.require(pathname.source_file)
            else
              raise Sprockets::LoadError, "no such file `#{filename}'"
            end
          end
        end
      end

      def environment_for(configuration)
        Sprockets::Environment.new(RAILS_ROOT, expand_paths(configuration[:load_path]))
      end
  end
end
