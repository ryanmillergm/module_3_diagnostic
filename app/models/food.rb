class Food
  attr_reader :total,
              :items,
              :name

  def initialize(attributes = {})
    @total = attributes[1][:total]
    @items = attributes[1][:item]
    @name = attributes[1][:q]
  end
end
