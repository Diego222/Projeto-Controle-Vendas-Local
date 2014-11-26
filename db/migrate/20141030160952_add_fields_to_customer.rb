class AddFieldsToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :nome, :string
    add_column :customers, :sobrenome, :string
  end
end
