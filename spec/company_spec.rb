require 'spec_helper'

describe Firmapi::Company do

  before(:all) do
    Firmapi.configure do |config|
      config.api_key = "123456"
    end
  end

  describe ":find_by_siren!" do

    context 'with a valid siren' do

      before(:each) do
        VCR.use_cassette "find_single_company_with_valid_siren" do
          @company = Firmapi::Company.find_by_siren!(480470152)
        end
      end

      subject(:company) { @company }

      it { expect(subject.name).to eq("Norauto France") }
      it { expect(subject.siren).to eq("480470152") }
      it { expect(subject.nic).to eq("00012") }
      it { expect(subject.commercial_name).to be_nil }
      it { expect(subject.official_name).to eq("NORAUTO FRANCE") }
      it { expect(subject.naf_code).to eq("4532Z") }
      it { expect(subject.legal_form).to eq("SAS") }
      it { expect(subject.address).to eq("511 589 R Des Seringats") }
      it { expect(subject.postal_code).to eq("59262") }
      it { expect(subject.city).to eq("Sainghin En Melantois") }
      it { expect(subject.vat_number).to eq("FR71480470152") }
      it { expect(subject.number_of_establishments).to eq(230) }
      it { expect(subject.registration_date).to eq(Date.new(2005, 1, 20)) }
      it { expect(subject.cessation_date).to be_nil }
      it { expect(subject.website).to eq("http://centres.norauto.fr/110-norauto-leers?utm_source=google\u0026utm_medium=places\u0026utm_campaign=Norauto_20121219JC") }

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