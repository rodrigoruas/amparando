class PaymentsController < ApplicationController
  before_action :authenticate_user!
  def create
      @donation = Donation.find(params[:donation_id])
      payment = PagSeguro::PaymentRequest.new

      if Rails.env.production?
        payment.redirect_url = "http://amparando.herokuapp.com/pagamento"
      else
        payment.redirect_url = "localhost:3000/pagamento"
      end

        payment.items << {
          id: @donation.id,
          description: @donation.campaign.title,
          amount: @donation.amount,
          weight: 0
        }

      response = payment.register

      if response.errors.any?
        raise response.errors.join("\n")
      else
        redirect_to response.url
      end
    end


  def pagseguro
    if Rails.env.production?
      if params.has_key?(:transaction_id)
        @donation = Donation.where("user_id = #{current_user.id}").last
        transaction_id = (params[:transaction_id])
        @json = payment_json(transaction_id)
        @donation.transaction_id = transaction_id
        @donation.state = @json["transaction"]["status"]
        @donation.save
      end
    else
      @donation = Donation.where("user_id = #{current_user.id}").last
      @donation.transaction_id = "TESTE-123-123-123"
      @donation.state = "3"
      @donation.save
    end
  end

  private

  def payment_json(transaction_id)
    url = "https://ws.pagseguro.uol.com.br/v3/transactions/#{transaction_id}?email=#{PG_EMAIL}&token=#{PG_PRODUCTION_TOKEN}"
    parsed_url = URI.parse(url)
    http = Net::HTTP.new(parsed_url.host, parsed_url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(parsed_url.request_uri)
    response = http.request(request)
    JSON.parse(Hash.from_xml(response.body).to_json)
  end
end
