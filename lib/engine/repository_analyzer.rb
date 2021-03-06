require 'ripper'
require 'json'

module Engine
  class RepositoryAnalyzer
    def initialize(dir_path)
      @path = dir_path
    end

    def get_directory_contents
      Dir.glob(@path + "/**/*")
    end

    def get_ruby_files(extension)
      dir_content = Dir.glob(@path + "/**/*")
      ruby_files = []
      dir_content.each do |file|

        if file[-extension.length-1,extension.length+1] == "."+extension
            ruby_files << file

        end
      end
      ruby_files
    end

    def analyze_ruby_file(file_name)
      tokens = Ripper.lex(File.read(file_name))
      tokens.delete_if { |token| token[1] != :on_ident }
     # tokens.map { |token| token[2] }
    end


    def analyze_working_dir
      ruby_files = get_ruby_files("rb") #Todo refactor this to other languages

      puts ruby_files.to_s
      ruby_files.each do |file|
          tokens = analyze_ruby_file(file)
          tokens.each do |token|
            match = Rule.find_by_expression token[2]
            puts token[2] + ' vs ' + match.nil?.to_s

            if !match.nil?
              Vulnerability.create(file: file, loc:token[0][0], rule_id: match.id )

            end
          end
      end


    end

  end
end