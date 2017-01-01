module Admin
  class UsersController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # simply overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = User.all.paginate(10, params[:page])
    # end
    
    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to admin_users_path
      else
        render action: 'new'
      end
    end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   User.find_by!(slug: param)
    # end

    # See https://administrate-docs.herokuapp.com/customizing_controller_actions
    # for more information
    
    protected
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name)
    end
  end
end
