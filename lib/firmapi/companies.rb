module Firmapi
  class Companies

    attr_reader :results, :size, :page, :number_of_pages, :params, :list

    def initialize(options, params)
      @results = options["results"]
      @size = options["size"]
      @page = options["page"]
      @number_of_pages = options["number_of_pages"]
      @list = []
      @params = params
    end

    def add_company(company)
      @list << company
    end

    def to_a
      @list
    end

    def next_page
      params[:page] = page + 1

      Companies.where(params)
    end

  	def self.where(params)

      @params = params

      response = API.new.get '/companies', params

			if response.status == 200
				json = response.body

				companies = self.new(json["result"]["search"], params)

        json["result"]["list"].each do |company_info|
          companies.add_company Company.new(company_info)
        end

        companies
			end
  	end

  end
end