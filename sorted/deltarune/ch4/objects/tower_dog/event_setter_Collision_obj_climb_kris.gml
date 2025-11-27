if (crumble_min != -4)
    obj_rotating_tower_controller_new.fall_limit_min = crumble_min;
if (crumble_max != -4)
    obj_rotating_tower_controller_new.tower_falls_apart_i = floor(crumble_max / 40);
if (crumble_max != -4)
    obj_rotating_tower_controller_new.tower_falls_apart_i_dog = floor(crumble_max / 40);
obj_rotating_tower_controller_new.fall_speed_dog = value;
if (!isdog)
    obj_rotating_tower_controller_new.fall_speed = value;
