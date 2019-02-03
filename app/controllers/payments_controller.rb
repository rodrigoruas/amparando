class PaymentsController < ApplicationController
  def create
      # O modo como você irá armazenar os produtos que estão sendo comprados
      # depende de você. Neste caso, temos um modelo Order que referência os
      # produtos que estão sendo comprados.
      @donation = Donation.find(params[:donation_id])

      payment = PagSeguro::PaymentRequest.new

      # Você também pode fazer o request de pagamento usando credenciais
      # diferentes, como no exemplo abaixo

      # payment = PagSeguro::PaymentRequest.new(email: current_user.email, token: 'token')

      # payment.reference = order.id
      # payment.notification_url = "http://2216ca24.ngrok.io"
      if Rails.env.production?
        payment.redirect_url = "http://amparando.herokuapp.com/confirmed"
      else
        payment.redirect_url = "localhost:3000/confirmed"
      end

        payment.items << {
          id: @donation.id,
          description: @donation.campaign.title,
          amount: @donation.amount,
          weight: 0
        }


      # Caso você precise passar parâmetros para a api que ainda não foram
      # mapeados na gem, você pode fazer de maneira dinâmica utilizando um
      # simples hash.
      # payment.extra_params << { paramName: 'paramValue' }
      # payment.extra_params << { senderBirthDate: '07/05/1981' }
      # payment.extra_params << { extraAmount: '-15.00' }

      #faz o post pro pagseguro
      response = payment.register

      # Caso o processo de checkout tenha dado errado, lança uma exceção.
      # Assim, um serviço de rastreamento de exceções ou até mesmo a gem
      # exception_notification poderá notificar sobre o ocorrido.
      #
      # Se estiver tudo certo, redireciona o comprador para o PagSeguro.
      if response.errors.any?
        raise response.errors.join("\n")
      else
        redirect_to response.url
      end
    end
end
