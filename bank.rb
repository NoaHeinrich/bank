require_relative "account"
require_relative "person"
class Bank
  attr_reader :accounts
  def initialize
    @accounts = []
  end

  def open_account(person)
    new_account = Account.new(person)
    @accounts << new_account
    return new_account
  end

  def display_clients
    @account.each do |account|
      account.print_holder
    end
  end

  def search_by_name(name)
    search_array = []
    @accounts.each do |account|
      if account.return_holder.downcase.include?(name)
        search_array << account
      end
    end
    search_array
  end

  def search_by_acct(number)
    @accounts.each do |account|
      if account.routing_num == number
        return account
      end
    end
    nil
  end

  def search_by_transaction(number)
  end

  def get_all_transactions
    transactions = []
    @accounts.each do |account|
      transactions << account.record
    end
    transactions.flatten!
    transactions.sort! { |a, b| a.date <=> b.date }
    return transactions
  end

end