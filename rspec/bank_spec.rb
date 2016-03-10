require "rspec"
require_relative "../bank"
describe Bank do
  before(:each) do
    @bank = Bank.new
  end

  describe "#new" do
    it "is a Bank object" do
      expect(@bank).to be_a Bank
    end

    it "has accounts" do
      expect(@bank.accounts).to eq []
    end
  end

  describe "#open_account" do
    it "places a new account into accounts" do
      person = Person.new("John", "Doe")
      @bank.open_account(person)
      expect(@bank.accounts[0]).to be_a Account
      expect(@bank.accounts[0].holder).to be person
    end
  end

  describe "#search_by_name" do
    it "returns an array of accounts opened by the matching user" do
      person = Person.new("John", "Doe")
      account = @bank.open_account(person)
      expect(@bank.search_by_name("john")).to eq [account]
    end
  end

  describe "#search_by_acct" do
    it "returns an account if it exists" do
      person = Person.new("John", "Doe")
      account = @bank.open_account(person)
      account.routing_num = 5
      expect(@bank.search_by_acct(5)).to be account
    end
  end
end