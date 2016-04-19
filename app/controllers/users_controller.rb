class UsersController < ApplicationController
  def login
  end

  def show
    @user = User.find(params[:id])
  end
  
  def cadastro
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Conta cadastrada com sucesso!"
      redirect_to @user
    else
      render 'cadastro'
    end
  end
  
  def user_params
      params.require(:user).permit(:nome, :email, :cpf, :telefone, :matricula, :password, :password_confirmation, :tipo)
  end
end