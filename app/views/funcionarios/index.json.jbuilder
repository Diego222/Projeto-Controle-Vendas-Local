json.array!(@funcionarios) do |funcionario|
  json.extract! funcionario, :id, :nome, :data_nascimento, :endereco, :cidade, :estado, :cep, :telefone, :admissao, :cargo, :cpf, :identidade
  json.url funcionario_url(funcionario, format: :json)
end
