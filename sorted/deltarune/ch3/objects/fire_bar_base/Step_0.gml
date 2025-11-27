if (init == 0)
{
    init = 1;
    var spd = 12;
    fire = instance_create(x, y, obj_fire_bar_piece);
    fire.rotator_target = id;
    fire.place = place;
    fire.len = 0;
    fire.place_speed = spd;
    fire = instance_create(x, y, obj_fire_bar_piece);
    fire.rotator_target = id;
    fire.place = place;
    fire.len = 20;
    fire.place_speed = spd;
    fire = instance_create(x, y, obj_fire_bar_piece);
    fire.rotator_target = id;
    fire.place = place;
    fire.len = 40;
    fire.place_speed = spd;
    fire = instance_create(x, y, obj_fire_bar_piece);
    fire.rotator_target = id;
    fire.place = place;
    fire.len = 60;
    fire.place_speed = spd;
    fire = instance_create(x, y, obj_fire_bar_piece);
    fire.rotator_target = id;
    fire.place = place;
    fire.len = 80;
    fire.place_speed = spd;
    if (place == 226)
    {
        fire = instance_create(x, y, obj_fire_bar_piece);
        fire.rotator_target = id;
        fire.place = place;
        fire.len = 100;
        fire.place_speed = spd;
        fire = instance_create(x, y, obj_fire_bar_piece);
        fire.rotator_target = id;
        fire.place = place;
        fire.len = 120;
        fire.place_speed = spd;
    }
}
