class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(matricula: params[:session][:matricula])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Matrícula/Senha Inválidos'
      render 'new'
    end
  end

  def destroy
  end
end
