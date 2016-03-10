require "rspec"
require_relative "../account"
describe Account do
  before(:each) do
    @person = Person.new("John", "Doe")
    @account = Account.new(@person)
  end

  describe "#deposit" do
    it "increases balance by the inputted amount" do
      @account.deposit(1)
      expect(@account.balance).to eq 1
      expect(@account.record[0]).to be_a Transaction
    end
  end

  describe "#withdrawal" do
    it "decreases balance by inputed amount" do
      @account.withdrawal(1)
      expect(@account.balance).to eq -1
      expect(@account.record[0]).to be_a Transaction
    end
  end
end