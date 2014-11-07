require 'spec_helper'
require 'rails_helper'

describe Task  do
  context 'with no title' do
    before :each do
      @info = Hash[ :title=>nil, :points=>1, :status=>'backlog', :needs_discussion=>false, :description=>'text' ]
    end
    it 'should not be valid' do
      expect(Task.new(@info)).not_to be_valid
    end
  end
  context 'with incorrect points value' do
    before :each do
      @info_high = Hash[:title=>'hi', :points=>6, :status=>'backlog', :needs_discussion=>false, :description=>'text']
      @info_low = Hash[:title=>'lo', :points=>-1, :status=>'backlog', :needs_discussion=>false, :description=>'text']
    end
    it 'should not be valid' do
      expect(Task.new(@info_high)).not_to be_valid
      expect(Task.new(@info_low)).not_to be_valid
    end
  end
  context 'with incorrect status' do
    before :each do
      @info = Hash[ :title=>'title', :points=>1, :status=>'good', :needs_discussion=>false, :description=>'text' ]
    end
    it 'should not be valid' do
      expect(Task.new(@info)).not_to be_valid
    end
  end
  context 'with correct parameters' do
    before :each do
      @info = Hash[ :title=>'title', :points=>1, :status=>'backlog', :needs_discussion=>false, :description=>'text' ]
    end
    it 'should be valid' do
      expect(Task.new(@info)).to be_valid
    end
  end
end
