json.array!(@fornecedors) do |fornecedor|
  json.extract! fornecedor, :id, :empresa, :endereco, :cidade, :estado, :cep, :telefone, :fax
  json.url fornecedor_url(fornecedor, format: :json)
end
