class CreateFornecedors < ActiveRecord::Migration
  def change
    create_table :fornecedors do |t|
      t.string :empresa
      t.string :endereco
      t.string :cidade
      t.string :estado
      t.string :cep
      t.string :telefone
      t.string :fax

      t.timestamps
    end
  end
end
