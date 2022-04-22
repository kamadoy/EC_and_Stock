class Form::InventoryCollection < Form::Base
  FORM_COUNT = 5
  attr_accessor :inventories 

  def initialize(attributes = {})
    super attributes
    self.inventories = FORM_COUNT.times.map { Inventory.new() } unless self.inventories.present?
  end

  def inventories_attributes=(attributes)
    self.inventories = attributes.map { |_, v| Inventory.new(v) if Inventory.new(v).valid?}.compact
     # Form::Inventory.new(inventories_attributes).tap { |v| v.availability = false }
  end

  def save
    Inventory.transaction do
      self.inventories.map do |inventory|
        # xxx.size_stock_id
        if inventory.availability? && Inventory.find_by(size_stock_id: inventory.size_stock_id, store_id: inventory.store_id)
          @size_stock = inventory.size_stock
          @size_stock.stock -= inventory.quantity
        #  return false if @size_stock.invalid?
          @size_stock.save if  @size_stock.stock_changed?
          @inventory = Inventory.find_by(size_stock_id: inventory.size_stock_id, store_id: inventory.store_id)
          @inventory.quantity += inventory.quantity.to_i
          @inventory.save!
        elsif inventory.availability
          inventory.save
          @size_stock = inventory.size_stock
          @size_stock.stock -= inventory.quantity
         # return false if @size_stock.invalid?
          @size_stock.save!
        else
         
        end
      end
    end
  end

end
