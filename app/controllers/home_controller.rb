class HomeController < ApplicationController
  def top
    @speeches = Speech.all.order("created_at DESC").limit(3)
  end
end
