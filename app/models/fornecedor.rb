class Fornecedor < ActiveRecord::Base

	has_many :pedidos
	has_many :items

	#validates_presence_of :empresa, :message => "Campo obrigatório"
	validates_uniqueness_of :empresa, :message => "Empresa já cadastrada"
	#validates_length_of :empresa, :endereco, :cidade, :maximum => 50, :message => "Limite de caracteres ultrapassado (max: 50)"
	

	default_scope :order => 'empresa ASC'

  def self.search(search)
	  if search
	    where('empresa LIKE ?', "%#{search}%")
	  else
	    scoped
	  end
	end

end
