require 'account'

describe Account do
  it "initializes with a balance of zero" do
    account = Account.new
    expect(account.balance).to eq(0)
  end
end