require 'test_helper'

class TransportadorasControllerTest < ActionController::TestCase
  setup do
    @transportadora = transportadoras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transportadoras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transportadora" do
    assert_difference('Transportadora.count') do
      post :create, transportadora: { cidade: @transportadora.cidade, email: @transportadora.email, endereco: @transportadora.endereco, estado: @transportadora.estado, nome: @transportadora.nome, telefone: @transportadora.telefone }
    end

    assert_redirected_to transportadora_path(assigns(:transportadora))
  end

  test "should show transportadora" do
    get :show, id: @transportadora
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transportadora
    assert_response :success
  end

  test "should update transportadora" do
    patch :update, id: @transportadora, transportadora: { cidade: @transportadora.cidade, email: @transportadora.email, endereco: @transportadora.endereco, estado: @transportadora.estado, nome: @transportadora.nome, telefone: @transportadora.telefone }
    assert_redirected_to transportadora_path(assigns(:transportadora))
  end

  test "should destroy transportadora" do
    assert_difference('Transportadora.count', -1) do
      delete :destroy, id: @transportadora
    end

    assert_redirected_to transportadoras_path
  end
end
