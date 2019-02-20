# == Schema Information
#
# Table name: speeches
#
#  id         :bigint(8)        not null, primary key
#  title      :string(255)
#  content    :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  overview   :text(65535)
#

require 'test_helper'

class SpeechTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
