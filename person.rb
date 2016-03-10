require_relative "account"
class Person
  attr_reader :first_name, :last_name
  attr_accessor :accounts
  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @accounts = []
  end



end