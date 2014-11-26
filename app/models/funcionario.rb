class Funcionario < ActiveRecord::Base

	#validates_presence_of :nome, :data_nascimento, :endereco, :cidade, :estado, :cep, :telefone, :admissao, :cargo, :cpf, :identidade, :message => "Campo Obrigatório"
	validates_uniqueness_of :cpf, :message => "Cpf já cadastrado"
	validates_uniqueness_of :identidade, :message => "Identidade já cadastrada"
	#validates_length_of :nome, :endereco, :cidade, :maximum => 50, :message => "Limite de caracteres ultrapassado (max: 50)"
	has_many :sales

	default_scope :order => 'nome ASC'

  def self.search(search)
	  if search
	    where('nome LIKE ?', "%#{search}%")
	  else
	    scoped
	end
  end
end
