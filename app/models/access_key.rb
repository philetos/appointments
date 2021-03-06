# == Schema Information
#
# Table name: access_keys
#
#  id         :integer          not null, primary key
#  token      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class AccessKey < ActiveRecord::Base

  before_validation :generate_token

  private

  def generate_token
    self.token = SecureRandom.hex(10)
  end
end
