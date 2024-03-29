hp = 100;
spd = 0.5;
image_speed = 0.4;

// inventory creation
inventory = new Inventory();

inventory.add_item("Coal", 4, spr_Coal);
inventory.add_item("Copper", 2, spr_Copper);

show_debug_message(inventory);

inventory.subtract_item("Coal", 2);
inventory.subtract_item("Copper", 2);

show_debug_message(inventory);