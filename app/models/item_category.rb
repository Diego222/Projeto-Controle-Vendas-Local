class ItemCategory < ActiveRecord::Base

	#validates_presence_of :name, :message => "Campo Obrigatório"
	validates_uniqueness_of :name, :message => "Nome já cadastrado"
	#validates_length_of :name, :maximum => 50, :message => "Limite de caracteres ultrapassado (max: 50)"

	default_scope :order => 'name ASC'
	has_many :items

end
