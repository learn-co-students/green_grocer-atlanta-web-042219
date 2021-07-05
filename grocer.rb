def consolidate_cart(cart)
	consolidated={}
	cart.each {|hsh|
		hsh.each {|item, item_hsh|
			consolidated[item] ||= item_hsh
			consolidated[item][:count] ||= 0
			consolidated[item][:count]  += 1
		}
	}
	consolidated
end

def apply_coupons(cart, coupons)
	new_cart={}.merge(cart)
	cart.each {|food, food_hash|
		coupons.each {|coupon_hash|
			if coupon_hash[:item] == food && (new_cart[food][:count] - coupon_hash[:num] >= 0)
				new_cart[food+" W/COUPON"] ||= {price: coupon_hash[:cost], clearance: food_hash[:clearance], count: 0}
				new_cart[food+" W/COUPON"][:count] += 1
				new_cart[food][:count] -= coupon_hash[:num]
			end
		}
	}
	new_cart
end

def apply_clearance(cart)
	cart.map {|food, food_hash|
		if food_hash[:clearance]
			food_hash[:price] = (food_hash[:price] * 0.80).round(2)
		end
	}
	cart
end

def checkout(cart, coupons)
	total=0.0
	cart = apply_clearance(apply_coupons(consolidate_cart(cart), coupons))
	cart.each {|food, food_hash|
		total += (food_hash[:price] * food_hash[:count]) 
	}
	total = (total*0.90).round(2) if total > 100
	total
end
