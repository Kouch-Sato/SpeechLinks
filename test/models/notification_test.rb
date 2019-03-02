# == Schema Information
#
# Table name: notifications
#
#  id             :bigint(8)        not null, primary key
#  user_id        :integer
#  notified_by_id :bigint(8)
#  speech_id      :integer
#  notified_type  :string(255)
#  read           :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
