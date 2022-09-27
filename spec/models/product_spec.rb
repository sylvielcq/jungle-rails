require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    before(:each) do
      @category = Category.new
      @product = Product.new(name: "Green Plant", price_cents: 50, quantity: 10, category: @category)
      @product.save!
    end
  
    it "should save if all four fields have valid inputs" do
      expect(Product.all.count).to eq(1)
    end

    it "should not let a product be created if name is left blank" do
      @product.name = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages[0]).to eq("Name can't be blank")
    end

    it "should not let a product be created if price is left blank" do
      @product.price_cents = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages[0]).to eq("Price cents is not a number")
    end
    
    it "should not let a product be created if quantity is left blank" do
      @product.quantity= nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages[0]).to eq("Quantity can't be blank")
    end   

    it "should not let a product be created if category is left blank" do
      @product.category = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages[0]).to eq("Category must exist")
    end  

  end
  
end
