require 'rspec'
require 'engine'

describe 'RepositoryAnalyzer' do


  let(:path) { "/some/path"}
  let(:analyzer) { Engine::RepositoryAnalyzer.new(path) }
  let(:dir_content) { ['file1.rb', 'subdir/file2.rb', 'file3.txt'] }
  let(:dir_content_with_only_ruby_files) { ['file1.rb', 'subdir/file2.rb'] }

  describe "get_directory_contents" do

    it 'should get a list of files in the working directory' do
      Dir.stub(:glob).with(path+"/**/*").and_return(dir_content)

      expect(analyzer.get_directory_contents).to be_eql(dir_content)
    end
  end

  describe "get_ruby_files" do
    it 'should only list .rb files' do
      Dir.stub(:glob).with(path+"/**/*").and_return(dir_content)
      expect(analyzer.get_ruby_files).to be_eql(dir_content_with_only_ruby_files)
    end
  end

  describe "analyze_ruby_file" do
    let(:result) { ["some_func", "result", "swapcase!", "puts", "result"] }

    it 'should return the tokens for ruby when analyzing a ruby file' do
      expect(analyzer.analyze_ruby_file("spec/fixtures/test_ripper.rb")).to be_eql(result)
    end
  end


end