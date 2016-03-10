require "date"
class Transaction
  attr_reader :date, :id, :difference
  def initialize(difference)
    @difference = difference
    rando = Random.new
    @id = rando.rand(1000)
    @date = DateTime.now
  end

end