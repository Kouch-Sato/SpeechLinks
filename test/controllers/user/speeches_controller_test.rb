require 'test_helper'

class User::SpeechesControllerTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers

  def setup
    @speech = speeches(:kouch1)
    @user = users(:kouch)
  end

  def test_show
    get user_speech_path(@speech)
    assert_response :success
  end

  def test_index
    get user_speeches_path
    assert_response :success
  end

  def test_new
    login_as(@user, scope: :user)
    get new_user_speech_path
    assert_response :success
  end
end
