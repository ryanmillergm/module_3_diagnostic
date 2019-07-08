class Food
  attr_reader :name,
              :items,
              :name

  def initialize(attributes = {})
    binding.pry
    @total = attributes[1][:total]
    @items = attributes[1][:item]
    @name = attributes[1][:q]
  end
end
