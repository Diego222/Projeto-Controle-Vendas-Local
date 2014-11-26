class CustomersController < ApplicationController
  before_action :authenticate_usuario!, only: [:index, :show, :edit, :update, :destroy]
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
   # @customers = Customer.paginate(:page => params[:page], :per_page => 20).where(:published => true)
    @customers = Customer.search(params[:search]).paginate(:per_page => 20, :page => params[:page]).where(:published => true)
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
    @customer = Customer.find(params[:id])
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to '/clientes', notice: 'Cliente cadastrado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @customer }
      else
        format.html { render action: 'new' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to '/clientes', notice: 'Cliente atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.published = false
    @customer.save

    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:nome, :sobrenome, :phone_number, :email_address, :address, :city, :state, :zip, :published)
    end
end