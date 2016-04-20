require 'test_helper'

class ReservaEquipamentosControllerTest < ActionController::TestCase
  setup do
    @reserva_equipamento = reserva_equipamentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reserva_equipamentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reserva_equipamento" do
    assert_difference('ReservaEquipamento.count') do
      post :create, reserva_equipamento: { data_fin_equip: @reserva_equipamento.data_fin_equip, data_ini_equip: @reserva_equipamento.data_ini_equip, equipamento_id: @reserva_equipamento.equipamento_id, user_id: @reserva_equipamento.user_id }
    end

    assert_redirected_to reserva_equipamento_path(assigns(:reserva_equipamento))
  end

  test "should show reserva_equipamento" do
    get :show, id: @reserva_equipamento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reserva_equipamento
    assert_response :success
  end

  test "should update reserva_equipamento" do
    patch :update, id: @reserva_equipamento, reserva_equipamento: { data_fin_equip: @reserva_equipamento.data_fin_equip, data_ini_equip: @reserva_equipamento.data_ini_equip, equipamento_id: @reserva_equipamento.equipamento_id, user_id: @reserva_equipamento.user_id }
    assert_redirected_to reserva_equipamento_path(assigns(:reserva_equipamento))
  end

  test "should destroy reserva_equipamento" do
    assert_difference('ReservaEquipamento.count', -1) do
      delete :destroy, id: @reserva_equipamento
    end

    assert_redirected_to reserva_equipamentos_path
  end
end
