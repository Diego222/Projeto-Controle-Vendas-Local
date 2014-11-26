class CreateTransportadoras < ActiveRecord::Migration
  def change
    create_table :transportadoras do |t|
      t.string :nome
      t.string :endereco
      t.string :cidade
      t.string :estado
      t.string :telefone
      t.string :email

      t.timestamps
    end
  end
end
