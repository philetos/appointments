require 'spec_helper'

describe AccessKey do

  context 'validations' do
    it { should validate_presence_of(:token) }
  end

  context 'filters' do
    context 'before create' do
      context ':generate_token' do 
        it 'should fire the callback' do 
          access_key = build(:access_key)
          access_key.should_receive(:generate_token)
          access_key.run_callbacks(:create) { true }
        end

        it 'should generate a token' do 
          access_key = build(:access_key)
          access_key.token.present?.should == false
          access_key.run_callbacks(:create) { true }
          access_key.token.present?.should == true
        end
      end
    end
  end
  
end