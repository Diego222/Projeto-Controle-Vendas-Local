class PedidoMailer < ActionMailer::Base
  default from: "from@example.com"

  def pedido_email(pedido)
    @pedido = pedido
    @url  = 'http://google.com'
    mail(to: @pedido.email, subject: 'Solicitãção de Item (Art Nissi)')
  end
end
