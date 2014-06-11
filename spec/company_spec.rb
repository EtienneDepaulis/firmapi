require 'spec_helper'

describe Firmapi::Company do

  describe ":find_by_siren!" do

    context 'with a valid siren' do

      before(:each) do
        VCR.use_cassette "find_single_company_with_valid_siren" do
          @company = Firmapi::Company.find_by_siren!(480470152)
        end
      end

      subject(:company) { @company }

      it { expect(company.name).to eq("Norauto France") }
      it { expect(company.siren).to eq("480470152") }
      it { expect(company.nic).to eq("00012") }
      it { expect(company.commercial_name).to be_nil }
      it { expect(company.official_name).to eq("NORAUTO FRANCE") }
      it { expect(company.naf_code).to eq("4532Z") }
      it { expect(company.legal_form).to eq("SAS") }
      it { expect(company.address).to eq("511 589 R Des Seringats") }
      it { expect(company.postal_code).to eq("59262") }
      it { expect(company.city).to eq("Sainghin En Melantois") }
      it { expect(company.vat_number).to eq("FR71480470152") }
      it { expect(company.number_of_establishments).to eq(230) }
      it { expect(company.registration_date).to eq(Date.new(2005, 1, 20)) }
      it { expect(company.cessation_date).to be_nil }
      it { expect(company.website).to eq("http://centres.norauto.fr/110-norauto-leers?utm_source=google\u0026utm_medium=places\u0026utm_campaign=Norauto_20121219JC") }

      context 'financial_activity' do

        subject(:first_financial_activity) { company.financial_activity.first }

        it { expect(company.financial_activity.size).to eq(4) }

        it { expect(first_financial_activity.publication_year).to eq(2012) }
        it { expect(first_financial_activity.turnover).to be_nil }
        it { expect(first_financial_activity.income).to be_nil }
        it { expect(first_financial_activity.workforce_count).to be_nil }
        it { expect(first_financial_activity.publication_date).to eq(Date.new(2012, 9, 29)) }

      end

    end

    context 'with an invalid siren' do
      it "raises an exception" do
        VCR.use_cassette "find_single_company_with_invalid_siren" do
          expect{
            Firmapi::Company.find_by_siren!("INVALID SIREN")
          }.to raise_error Firmapi::Company::NoCompanyFound
        end
      end
    end

  end

end