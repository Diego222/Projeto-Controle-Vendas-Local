class Customer < ActiveRecord::Base

  #validates_presence_of :nome, :sobrenome, :message => "Campo obrigatório"
  #validates_uniqueness_of :email_address, :message => "Email já cadastrado"
  #validates_length_of :nome, :sobrenome, :address, :city, :maximum => 50, :message => "Limite de caracteres ultrapassado (max: 50)"
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
