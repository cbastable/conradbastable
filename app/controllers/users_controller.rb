class UsersController < ApplicationController

	private

    def signed_in_user
      redirect_to root_path unless signed_in?
    end
end
