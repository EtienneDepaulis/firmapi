module Firmapi
  class FinancialYear
  	include Virtus.model

  	attribute :publication_year, Integer
  	attribute :turnover, String
  	attribute :income, String
  	attribute :workforce_count, Integer
  	attribute :publication_date, Date

  end
end