class AddEmailToFornecedor < ActiveRecord::Migration
  def change
    add_column :fornecedors, :email, :string
  end
end
