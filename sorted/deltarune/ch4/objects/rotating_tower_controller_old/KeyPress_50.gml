if (!scr_debug())
    exit;
orb = instance_create(320, 9999, obj_vertical_dark_laser1);
orb.angle_position = (270 - tower_angle - 80) + irandom(160);
orb.position = choose("above", "below");
orb.depth = depth - 4;
