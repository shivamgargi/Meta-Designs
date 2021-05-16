class UsersController < ApplicationController
  def index
  	@user = User.all
  end

  def get_info
  	unless params[:file].nil?
  		get_user_info = GetUserInfoService.run(params[:file])
  		$err = get_user_info.nil? ? nil : get_user_info
  	end
  	redirect_to :back
  end
end
