class UsersController < ApplicationController
  include UsersHelper

  before_action :authenticate_user!

  def index
    set_user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(current_user.id)
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:perfil)
    end
end
