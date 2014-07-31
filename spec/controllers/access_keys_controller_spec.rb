require 'spec_helper'

describe AccessKeysController do
  describe "#new" do 
    it "should render a new view" do
      get :new
      should render_template(:new) 
    end
  end

  describe "#create" do
    it "should create a new AccessKey" do 
      expect {
        post :create, format: :json
      }.to change(AccessKey,:count).by(1)
    end

    it "should return token" do 
      post :create, format: :json
      json["token"].length.should == 20
    end
  end
end