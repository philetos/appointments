class AccessKeysController < ApplicationController
  def new
  end

  def create
    access_key = AccessKey.create!

    respond_to do |format|
      format.json { render json: access_key }
    end
  end
end
