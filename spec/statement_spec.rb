# frozen_string_literal: true

require 'statement'

describe Statement do
  subject(:statement) { described_class.new }

  describe '#print' do
    it 'should display a bank statement header string' do
      subject.header
      expect(subject.header).to eq 'date || credit || debit || balance'
    end
  end
end
