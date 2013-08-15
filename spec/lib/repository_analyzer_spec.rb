require 'rspec'
require 'engine'

describe 'RepositoryAnalyzer' do


  let(:path) { "/some/path"}
  let(:analyzer) { Engine::RepositoryAnalyzer.new(path) }
  let(:dir_content) { ['file1.rb', 'subdir/file2.rb', 'file3.txt'] }
  let(:dir_content_with_only_ruby_files) { ['file1.rb', 'subdir/file2.rb'] }

  it 'should get a list of files in the working directory' do
    Dir.stub(:glob).with(path+"/**/*").and_return(dir_content)

    expect(analyzer.get_directory_contents).to be_eql(dir_content)
  end

  it 'should only list .rb files' do
    Dir.stub(:glob).with(path+"/**/*").and_return(dir_content)
    expect(analyzer.get_ruby_files).to be_eql(dir_content_with_only_ruby_files)
  end



end