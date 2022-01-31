require 'account'

describe Account do
  it "initializes with a balance of zero" do
    account = Account.new
    expect(account.balance).to eq(0)
  end

  it { is_expected.to respond_to(:deposit).with(1).argument}

  it "can deposit money into the account" do
    account = Account.new
    account.deposit(100)
    expect(account.balance).to eq(100)
  end
end