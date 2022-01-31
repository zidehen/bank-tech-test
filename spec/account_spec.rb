require 'account'

describe Account do
  subject(:account) {described_class.new}

  it "initializes with a balance of zero" do
    expect(account.balance).to eq(0)
  end

  it { is_expected.to respond_to(:deposit).with(1).argument}

  it "can deposit money into the account" do
    account.deposit(100)
    expect(account.balance).to eq(100)
  end
  
  it { is_expected.to respond_to(:withdraw).with(1).argument}

  it "can deposit money into the account" do
    account.deposit(100)
    account.withdraw(20)
    expect(account.balance).to eq(80)
  end
end