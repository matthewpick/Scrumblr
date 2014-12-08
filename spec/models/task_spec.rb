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
  
  describe 'checking to see if the task is completed' do
    it 'should return true iff the tasks status is completed' do      
      Task.all_status.each do |status|
        @fake_task = Task.new Hash[ :title=>'title', :points=>1, :status=> status, :needs_discussion=>false, :description=>'text' ]
        
        if status == 'completed'
          expect(@fake_task.completed?).to eq(true)
        else
          expect(@fake_task.completed?).to eq(false)
        end
        
      end
    end
  end
end
