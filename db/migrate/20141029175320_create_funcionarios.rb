class CreateFuncionarios < ActiveRecord::Migration
  def change
    create_table :funcionarios do |t|
      t.string :nome
      t.string :data_nascimento
      t.string :endereco
      t.string :cidade
      t.string :estado
      t.string :cep
      t.string :telefone
      t.string :admissao
      t.string :cargo
      t.string :cpf
      t.string :identidade

      t.timestamps
    end
  end
end
