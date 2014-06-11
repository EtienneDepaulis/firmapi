module Firmapi
  class Company
  	include Virtus.model

  	attribute :siren, String
  	attribute :nic, String
  	attribute :commercial_name, String
  	attribute :official_name, String
  	attribute :name, String
  	attribute :naf_code, String
  	attribute :legal_form, String
  	attribute :address, String
  	attribute :postal_code, String
  	attribute :city, String
  	attribute :vat_number, String
  	attribute :number_of_establishments, Integer
  	attribute :registration_date, Date
  	attribute :cessation_date, Date
  	attribute :website, String
    attribute :financial_activity, Array[FinancialYear]

  	def self.find_by_siren!(siren)

      response = API.new.get '/company', { siren: siren }

			if response.status == 200
				json = response.body
				self.new(json["result"])
			elsif response.status == 404
				raise NoCompanyFound, "No company was found with the siren '#{siren}'."
			end
  	end

  	class NoCompanyFound < StandardError ; end
  end
end