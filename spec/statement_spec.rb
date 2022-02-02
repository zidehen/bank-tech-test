# frozen_string_literal: true

require 'statement'

describe Statement do
  subject(:statement) { described_class.new }
  let(:transactions) do
    [{ date: '31/01/2022', credit: '100.00', debit: '', balance: '100.00' },
     { date: '01/02/2022', credit: '', debit: '25.00', balance: '75.00' }]
  end
  let(:bank_statement) do
    "date || credit || debit || balance\n"\
    "01/02/2022 ||  || 25.00 || 75.00\n"\
    "31/01/2022 || 100.00 ||  || 100.00\n"
  end

  describe '#print' do
    it 'should display the bank statement header string' do
      subject.header
      expect(subject.header).to eq 'date || credit || debit || balance'
    end

    it 'should print the bank statement with all transactions' do
      subject.print(transactions)
      expect { subject.print(transactions) }.to output(bank_statement).to_stdout
    end
  end
end
