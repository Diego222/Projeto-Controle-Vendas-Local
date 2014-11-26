require 'test_helper'

class FuncionariosControllerTest < ActionController::TestCase
  setup do
    @funcionario = funcionarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:funcionarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create funcionario" do
    assert_difference('Funcionario.count') do
      post :create, funcionario: { admissao: @funcionario.admissao, cargo: @funcionario.cargo, cep: @funcionario.cep, cidade: @funcionario.cidade, cpf: @funcionario.cpf, data_nascimento: @funcionario.data_nascimento, endereco: @funcionario.endereco, estado: @funcionario.estado, identidade: @funcionario.identidade, nome: @funcionario.nome, telefone: @funcionario.telefone }
    end

    assert_redirected_to funcionario_path(assigns(:funcionario))
  end

  test "should show funcionario" do
    get :show, id: @funcionario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @funcionario
    assert_response :success
  end

  test "should update funcionario" do
    patch :update, id: @funcionario, funcionario: { admissao: @funcionario.admissao, cargo: @funcionario.cargo, cep: @funcionario.cep, cidade: @funcionario.cidade, cpf: @funcionario.cpf, data_nascimento: @funcionario.data_nascimento, endereco: @funcionario.endereco, estado: @funcionario.estado, identidade: @funcionario.identidade, nome: @funcionario.nome, telefone: @funcionario.telefone }
    assert_redirected_to funcionario_path(assigns(:funcionario))
  end

  test "should destroy funcionario" do
    assert_difference('Funcionario.count', -1) do
      delete :destroy, id: @funcionario
    end

    assert_redirected_to funcionarios_path
  end
end
