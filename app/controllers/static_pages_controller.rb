class StaticPagesController < ApplicationController
  def home
  end

  def predio1
  end

  def predio2
  end

  def equipamentos
    @users = User.all
  end
end
