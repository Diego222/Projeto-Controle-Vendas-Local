json.array!(@transportadoras) do |transportadora|
  json.extract! transportadora, :id, :nome, :endereco, :cidade, :estado, :telefone, :email
  json.url transportadora_url(transportadora, format: :json)
end
