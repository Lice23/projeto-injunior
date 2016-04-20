require 'test_helper'

class ReservaSalasControllerTest < ActionController::TestCase
  setup do
    @reserva_sala = reserva_salas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reserva_salas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reserva_sala" do
    assert_difference('ReservaSala.count') do
      post :create, reserva_sala: { data_fin_sala: @reserva_sala.data_fin_sala, data_ini_sala: @reserva_sala.data_ini_sala, sala_id: @reserva_sala.sala_id, user_id: @reserva_sala.user_id }
    end

    assert_redirected_to reserva_sala_path(assigns(:reserva_sala))
  end

  test "should show reserva_sala" do
    get :show, id: @reserva_sala
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reserva_sala
    assert_response :success
  end

  test "should update reserva_sala" do
    patch :update, id: @reserva_sala, reserva_sala: { data_fin_sala: @reserva_sala.data_fin_sala, data_ini_sala: @reserva_sala.data_ini_sala, sala_id: @reserva_sala.sala_id, user_id: @reserva_sala.user_id }
    assert_redirected_to reserva_sala_path(assigns(:reserva_sala))
  end

  test "should destroy reserva_sala" do
    assert_difference('ReservaSala.count', -1) do
      delete :destroy, id: @reserva_sala
    end

    assert_redirected_to reserva_salas_path
  end
end
