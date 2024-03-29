function Inventory() constructor {
	inventory_items = [];
	
	set_item = function(name, quantity, sprite) {
		array_push(inventory_items, {
			name: name,
			quantity: quantity,
			sprite: sprite,
		});
		
	}
	find_item = function(name) {
		for(var i = 0; i < array_length(inventory_items); i++) {
			if(name == inventory_items[i].name) {
				return i;
			}
		}
		return -1;
	}
	add_item = function(name, quantity, sprite) {
		var index = find_item(name);
		
		if(index >= 0) {
			inventory_items[index].quantity += quantity
		} else {
			set_item(name, quantity, sprite);
		}
	}
	
	has_item = function(name, quantity) {
		var index = find_item(name);
		
		if(index >= 0) {
			return inventory_items[index].quantity >= quantity;
		}
		return false;
	}
	
	subtract_item = function(name, quantity) {
		var index = find_item(name);
		
		if(index >= 0) {
			
			if(has_item(name, quantity)) {
				inventory_items[index].quantity -= quantity;
				
				if(inventory_items[index].quantity <= 0) {
					remove_item(index);
				}
			}
		}
	}
			
	remove_item = function(index) {
		array_delete(inventory_items, index, 1);
	}
	toString = function() {
		return json_stringify(inventory_items);
	}
		
}