if (image_xscale > 0)
    piece = instance_create(x + 10 + random(66), y + 10 + random(60), obj_susiezilla_building_piece);
else
    piece = instance_create((x + 10 + random(66)) - 80, y + 10 + random(60), obj_susiezilla_building_piece);
piece.vspeed = -8;
piece.hspeed = -2 + random(4);
piece.gravity_direction = 270;
piece.gravity = 0.5;
piece.depth = depth - 10;
