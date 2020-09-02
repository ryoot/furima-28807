class UsersController < ApplicationController

  def edit
    @user = User.create(user_params)
    @user.password_confirmation = user_params[:password]
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_registration_path
      flash[:notice] = "新規登録が完了しました"
    else
      flash[:alert] = @user.errors.full_messages
      redirect_to user_registration_path
    end
  end

  def update
    current_user.update(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
