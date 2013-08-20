require 'rspec'
require 'engine'
require 'json'

describe 'RepositoryAnalyzer' do


  let(:path) { "/some/path"}
  let(:extension) {"rb"}
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
      expect(analyzer.get_ruby_files(extension)).to be_eql(dir_content_with_only_ruby_files)
    end
  end

  describe "analyze_ruby_file" do
    let(:result) { [[[1, 4], :on_ident, "some_func"], [[2, 2], :on_ident, "result"], [[2, 18], :on_ident, "swapcase!"], [[3, 2], :on_ident, "puts"], [[3, 7], :on_ident, "result"]] }

    it 'should return the tokens for ruby when analyzing a ruby file' do
      expect(analyzer.analyze_ruby_file("spec/fixtures/test_ripper.rb")).to be_eql(result)
    end
  end

  describe "analyse working dir"  do

    let(:dir_content) { ['spec/fixtures/test_ripper.rb'] }
    let(:result) { ['spec/fixtures/test_ripper.rb', ["some_func", "result", "swapcase!", "puts", "result"]] }
    let(:report) do
      {
        project_name: "test project",
        vulnerabilities: [
          {
            token: "some_func",
            line: 1,
            column: 5,
            file_name: "spec/fixtures/test_ripper.rb"
          },
          {
              token: "result",
              line: 2,
              column: 2,
              file_name: "spec/fixtures/test_ripper.rb"
          },
          {
            token: "swapcase!",
            line: 2,
            column: 18,
            file_name: "spec/fixtures/test_ripper.rb"
          },
          {
              token: "puts",
              line: 3,
              column: 2,
              file_name: "spec/fixtures/test_ripper.rb"
          },
          {
              token: "result",
              line: 3,
              column: 7,
              file_name: "spec/fixtures/test_ripper.rb"
          },
        ]
      }
    end

    it "should return the tokens in JSON format " do
      Dir.stub(:glob).with(path+"/**/*").and_return(dir_content)
      result = puts report.to_json
     expect(analyzer.analyze_working_dir).to be_eql(result)
    end
  end


end