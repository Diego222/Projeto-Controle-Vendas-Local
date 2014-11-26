class AddFornecedorToItem < ActiveRecord::Migration
  def change
    add_reference :items, :fornecedor, index: true
  end
end
