module Users
  class ProfileController < Users::BaseController

    # GET /profile
    def index
      @user = @current_user
    end

    def edit
      @user = @current_user
    end

    def update
      @user = @current_user
      @user.assign_attributes(user_params)
      @user.save
      set_flash_message("Profile details has been updated successfully", :success) if @user.errors.blank?
      render_or_redirect(@user.errors.any?, users_profile_path, "edit")
    end

    private

    def user_params
      params[:user].permit(:name, :username, :email, :phone, :designation_overridden, :linkedin, :skype, :department_id, :designation_id)
    end

    def set_navs
      set_nav("user/profile")
    end

  end
end

