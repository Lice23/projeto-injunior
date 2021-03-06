class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update, :destroy, :usuarios, :cadastro]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:destroy, :usuarios, :cadastro]
  
  def login
  end

  def show
    @user = User.find(params[:id])
  end
  
  def usuarios
    @users = User.all
  end
  
  def cadastro
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      if !logged_in?
        log_in @user
      end
      flash[:success] = "Conta cadastrada com sucesso!"
      redirect_to @user
    else
      render 'cadastro'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to usuarios_url
  end
  
  private
    def user_params
        params.require(:user).permit(:nome, :email, :cpf, :telefone, :matricula, :password, :password_confirmation, :gerente)
    end
  
  # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user.gerente? || current_user?(@user)
    end
    
    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.gerente?
    end
end