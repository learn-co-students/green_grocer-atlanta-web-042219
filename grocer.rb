require "pry"

def consolidate_cart(cart)
  # code here
  output = {}
  
  cart.each do |item|
    if !output.has_key?(item.keys[0])
      output[item.keys[0]] = item.values[0]
      output[item.keys[0]][:count] = 1
    else
      output[item.keys[0]][:count] += 1
    end
  end
  output
end

def apply_coupons(cart, coupons)
  # code here
  output = {}
  
  cart.each do |item, data|
    coupons.each do |coupon_item|
      binding.pry
      if item == coupon_item[:item] && data[:count] >= coupon_item[:num]
        cart["#{item} W/COUPON"] = {price: coupon_item[:cost], clearance: 
      
      item
      end
    end
  end

end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
