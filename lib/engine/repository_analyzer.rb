require 'ripper'

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

    def analyze_ruby_file(file_name)
      tokens = Ripper.lex(File.read(file_name))
      tokens.delete_if { |token| token[1] != :on_ident }
      tokens.map { |token| token[2] }
    end
  end
end