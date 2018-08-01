require 'pagarme'
class TransactionController < ApplicationController
	skip_before_action :verify_authenticity_token, :only => :capturar
	def capturar
		puts params[:token]

		PagarMe.api_key = "SUA_API_KEY";

		transaction = PagarMe::Transaction.find_by_id(params[:token])
		transaction.capture({:amount => 8000})
	end
end
