
module Engine
  class RepositoryAnalyzer
    def initialize(dir_path)
      @path = dir_path
    end

    def get_directory_contents
      Dir.glob(@path + "/**/*")
    end

    def get_ruby_files
      dir_content = Dir.glob(@path + "/**/*")
      ruby_files = []
      dir_content.each do |file|

        if file[-3,3] == ".rb"
            ruby_files << file
        end
      end
      ruby_files
    end
  end
end