class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
      t.references :fornecedor, index: true
      t.string :data
      t.string :pedido
      t.text :observacoes
      t.string :email

      t.timestamps
    end
  end
end
