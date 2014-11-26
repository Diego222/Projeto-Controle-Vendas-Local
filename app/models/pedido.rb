class Pedido < ActiveRecord::Base
  belongs_to :fornecedor

  validates_presence_of :pedido, :email, :fornecedor, :message => "Campo obrigatório"
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{3,})\z/i, on: :create, :message => "Email inválido" }

  default_scope :order => 'created_at ASC'

  def self.search(search)
	  if search
	    where('pedido LIKE ?', "%#{search}%")
	  else
	    scoped
	  end
	end
end
