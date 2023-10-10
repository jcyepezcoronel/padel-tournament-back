class UserControllersController < ApplicationController
    def index
        @users = User.all
    end
end
