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
      if item == coupon_item[:item] && data[:count] >= coupon_item[:num]
        output["#{item} W/COUPON"] = {price: coupon_item[:cost], clearance: data[:clearance], count: 1}
        data[:count] -= coupon_item[:num]
      end
    end
  end
  cart.each do |item, data|
    binding.pry
    if data[:count] > 0
      output[item] = data
  end

end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
