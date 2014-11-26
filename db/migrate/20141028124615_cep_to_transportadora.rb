class CepToTransportadora < ActiveRecord::Migration
  def change
  	add_column :transportadoras, :cep, :string
  end
end
