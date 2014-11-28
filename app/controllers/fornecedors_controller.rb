class FornecedorsController < ApplicationController
  before_action :authenticate_usuario!, only: [:index, :show, :edit, :update, :destroy, :new]
  before_action :set_fornecedor, only: [:show, :edit, :update, :destroy]

  # GET /fornecedors
  # GET /fornecedors.json
  def index
    @fornecedors = Fornecedor.search(params[:search]).paginate(:per_page => 20, :page => params[:page])
  end

  # GET /fornecedors/1
  # GET /fornecedors/1.json
  def show
  end

  # GET /fornecedors/new
  def new
    @fornecedor = Fornecedor.new
  end

  # GET /fornecedors/1/edit
  def edit
  end

  # POST /fornecedors
  # POST /fornecedors.json
  def create
    @fornecedor = Fornecedor.new(fornecedor_params)

    respond_to do |format|
      if @fornecedor.save
        format.html { redirect_to '/fornecedores', notice: 'Fornecedor cadastrado com sucesso.' }
        format.json { render :show, status: :created, location: @fornecedor }
      else
        format.html { render :new }
        format.json { render json: @fornecedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fornecedors/1
  # PATCH/PUT /fornecedors/1.json
  def update
    respond_to do |format|
      if @fornecedor.update(fornecedor_params)
        format.html { redirect_to '/fornecedores', notice: 'Fornecedor atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @fornecedor }
      else
        format.html { render :edit }
        format.json { render json: @fornecedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fornecedors/1
  # DELETE /fornecedors/1.json
  def destroy
    @fornecedor.destroy
    respond_to do |format|
      format.html { redirect_to fornecedors_url, notice: 'Fornecedor excluido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fornecedor
      @fornecedor = Fornecedor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fornecedor_params
      params.require(:fornecedor).permit(:empresa,:endereco, :cidade, :estado, :cep, :telefone, :fax, :email)
    end
end
