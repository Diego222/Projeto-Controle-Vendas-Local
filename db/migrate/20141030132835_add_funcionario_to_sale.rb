class AddFuncionarioToSale < ActiveRecord::Migration
  def change
    add_reference :sales, :funcionario, index: true
  end
end
