class Transportadora < ActiveRecord::Base
	validates_presence_of :nome, :message => "Campo Obrigatório"
	validates_uniqueness_of :nome, :message => "Transportadora já cadastrada"
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{3,})\z/i, on: :create, :message => "Email inválido" }
end
