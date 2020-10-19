class Order
  def initialize
    @line_items = []
  end

  def add_line_item(line_item)
    @line_items << line_item
  end

  def total
    subtotals = @line_items.map { |li| li.quantity * li.price }
    subtotals.reduce(:+)
  end
end

class LineItem
  attr_reader :quantity, :price

  def initialize(quantity, price)
    @price    = price
    @quantity = quantity
  end
end

order = Order.new
order.add_line_item LineItem.new(2, 3.00)
order.add_line_item LineItem.new(4, 1.00)
puts order.total
