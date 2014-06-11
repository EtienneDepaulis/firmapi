require 'spec_helper'

describe Firmapi::Company do

  describe ":where" do

    before(:each) do
      VCR.use_cassette "find_companies_with_valid_siren" do
        @companies = Firmapi::Companies.where(postal_code: 69)
      end
    end

    subject(:companies) { @companies }

    it { expect(companies.results).to eq 103307 }
    it { expect(companies.size).to eq 100 }
    it { expect(companies.page).to eq 1 }
    it { expect(companies.number_of_pages).to eq 1033 }

    context 'list' do

      subject(:company) { @companies.to_a.first }

      it { is_expected.to be_a Firmapi::Company }

      it { expect(company.name).to eq("C.M.") }
      it { expect(company.siren).to eq("527810279") }
      it { expect(company.nic).to be_nil }
      it { expect(company.commercial_name).to be_nil }

    end

    context ':next_page' do

      before(:each) do
        VCR.use_cassette "find_companies_with_valid_siren_next_page" do
          @companies = @companies.next_page
        end
      end

      subject(:companies) { @companies }

      it { expect(companies.page).to eq 2 }

    end

  end

end