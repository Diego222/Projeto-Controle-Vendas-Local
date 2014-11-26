json.array!(@pedidos) do |pedido|
  json.extract! pedido, :id, :fornecedor_id, :data, :pedido, :observacoes, :email
  json.url pedido_url(pedido, format: :json)
end
