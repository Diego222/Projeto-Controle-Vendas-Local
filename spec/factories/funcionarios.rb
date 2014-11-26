FactoryGirl.define do
  factory :funcionario do  	
	nome { "Diego"}
	data_nascimento { DateTime.now }
	endereco { "Rua 1"}
	cidade { "Araraquara"}
	estado { "SP"}
	cep { "14102011"}
	telefone { "1699990000" }
	admissao { Time.now }
	cargo { "Diretor"}
	cpf { "49022203022"}
	identidade { "teste identidade"}
  end
end