require 'spec_helper'

describe Firmapi::Company do

  describe ":find_by_siren" do
    context 'with a valid siren' do
      it "builds the company" do
        VCR.use_cassette "find_single_company_with_valid_siren" do
          @company = Firmapi::Company.find_by_siren(480470152)
        end

        expect(@company.name).to eq("EVANGELINA")
      end
    end
  end

end
