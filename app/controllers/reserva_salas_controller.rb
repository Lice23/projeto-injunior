class ReservaSalasController < ApplicationController
  before_action :set_reserva_sala, only: [:show, :edit, :update, :destroy]

  # GET /reserva_salas
  # GET /reserva_salas.json
  def index
    @reserva_salas = ReservaSala.all
    @salas = Sala.all
    @users = User.all
  end

  # GET /reserva_salas/1
  # GET /reserva_salas/1.json
  def show
  end

  # GET /reserva_salas/new
  def new
    @reserva_sala = ReservaSala.new
  end

  # GET /reserva_salas/1/edit
  def edit
  end

  # POST /reserva_salas
  # POST /reserva_salas.json
  def create
    @reserva_sala = ReservaSala.new(reserva_sala_params)

    respond_to do |format|
      if @reserva_sala.save
        format.html { redirect_to @reserva_sala, notice: 'Reserva sala was successfully created.' }
        format.json { render :show, status: :created, location: @reserva_sala }
      else
        format.html { render :new }
        format.json { render json: @reserva_sala.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reserva_salas/1
  # PATCH/PUT /reserva_salas/1.json
  def update
    respond_to do |format|
      if @reserva_sala.update(reserva_sala_params)
        format.html { redirect_to @reserva_sala, notice: 'Reserva sala was successfully updated.' }
        format.json { render :show, status: :ok, location: @reserva_sala }
      else
        format.html { render :edit }
        format.json { render json: @reserva_sala.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reserva_salas/1
  # DELETE /reserva_salas/1.json
  def destroy
    @reserva_sala.destroy
    respond_to do |format|
      format.html { redirect_to reserva_salas_url, notice: 'Reserva sala was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reserva_sala
      @reserva_sala = ReservaSala.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reserva_sala_params
      params.require(:reserva_sala).permit(:sala_id, :user_id, :data_ini_sala, :data_fin_sala)
    end
end
