class CreditCardAPI < Sinatra::Base
 get '/' do
    "The service is running - corriendo para mi"
  end
  
  get '/api/v1/credit_card/validate' do
    number = params[:card_number]
    halt 400 unless number
    card = CreditCard.new(number,nil,nil,nil)
    {
      card: number,
      validated: card.validate_checksum
    }.to_json

  end
  
end
