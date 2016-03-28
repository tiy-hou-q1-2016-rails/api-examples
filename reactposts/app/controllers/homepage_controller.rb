class HomepageController < ApplicationController

  before_action do
    if @current_user.nil?
      redirect_to sign_in_path
    end
  end

  def show
  end
end
