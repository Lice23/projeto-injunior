require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get predio1" do
    get :predio1
    assert_response :success
  end

  test "should get predio2" do
    get :predio2
    assert_response :success
  end

  test "should get equipamentos" do
    get :equipamentos
    assert_response :success
  end

  test "should get cadastro" do
    get :cadastro
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get usuario" do
    get :usuario
    assert_response :success
  end

end
