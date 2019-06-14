require 'rails_helper'

RSpec.describe Candidate, type: :model do
  describe 'Invitation' do
    let(:candidate) { create(:candidate) }

    it 'is expected to access spreadsheet data' do
      expect(Candidate.access_spreadsheets.rows.last.count).to eq(5)
    end

    it 'is expected to invite the candidate' do
      expect(candidate.invite!).to eq(true)
    end
  end
end
