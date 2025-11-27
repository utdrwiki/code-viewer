food_marker = scr_marker(x + 4, y, spr_diner_hot_chocolate);
with (food_marker)
    scr_depth();
food_readable = instance_create(x, y, obj_readable_room1);
food_readable.image_xscale = 0.8;
steam_marker = scr_marker(x + 4, y - 12, spr_diner_food_steam);
steam_marker.image_speed = 0.08;
steam_marker.depth = food_marker.depth - 10;
steam_siner = 0;
