require_relative "person"
require_relative "transaction"
class Account
  attr_reader :holder, :balance, :record
  attr_accessor :routing_num
  def initialize(holder)
    @balance = 0
    @holder = holder
    @holder.accounts << self
    rando = Random.new
    @routing_num = rando.rand(9999)
    @record = []
  end

  def deposit(amount)
    @balance += amount
    string  = "+#{amount}"
    new_transaction = Transaction.new(string)
    @record << new_transaction
  end

  def withdrawal(amount)
    @balance -= amount
    string = "-#{amount}"
    new_transaction = Transaction.new(string)
    @record << new_transaction
  end

  def print_holder
    puts "#{@holder.first_name} #{@holder.last_name}"
  end

  def return_holder
    full_name = "#{@holder.first_name} #{@holder.last_name}"
    full_name
  end

end