class ReservaEquipamentosController < ApplicationController
  before_action :set_reserva_equipamento, only: [:show, :edit, :update, :destroy]

  # GET /reserva_equipamentos
  # GET /reserva_equipamentos.json
  def index
    @reserva_equipamentos = ReservaEquipamento.all
  end

  # GET /reserva_equipamentos/1
  # GET /reserva_equipamentos/1.json
  def show
  end

  # GET /reserva_equipamentos/new
  def new
    @reserva_equipamento = ReservaEquipamento.new
  end

  # GET /reserva_equipamentos/1/edit
  def edit
  end

  # POST /reserva_equipamentos
  # POST /reserva_equipamentos.json
  def create
    @reserva_equipamento = ReservaEquipamento.new(reserva_equipamento_params)

    respond_to do |format|
      if @reserva_equipamento.save
        format.html { redirect_to @reserva_equipamento, notice: 'Reserva equipamento was successfully created.' }
        format.json { render :show, status: :created, location: @reserva_equipamento }
      else
        format.html { render :new }
        format.json { render json: @reserva_equipamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reserva_equipamentos/1
  # PATCH/PUT /reserva_equipamentos/1.json
  def update
    respond_to do |format|
      if @reserva_equipamento.update(reserva_equipamento_params)
        format.html { redirect_to @reserva_equipamento, notice: 'Reserva equipamento was successfully updated.' }
        format.json { render :show, status: :ok, location: @reserva_equipamento }
      else
        format.html { render :edit }
        format.json { render json: @reserva_equipamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reserva_equipamentos/1
  # DELETE /reserva_equipamentos/1.json
  def destroy
    @reserva_equipamento.destroy
    respond_to do |format|
      format.html { redirect_to reserva_equipamentos_url, notice: 'Reserva equipamento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reserva_equipamento
      @reserva_equipamento = ReservaEquipamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reserva_equipamento_params
      params.require(:reserva_equipamento).permit(:equipamento_id, :user_id, :data_ini_equip, :data_fin_equip)
    end
end
