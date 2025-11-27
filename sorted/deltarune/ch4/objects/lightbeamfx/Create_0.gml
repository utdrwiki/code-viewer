ps = part_system_create();
part_system_automatic_draw(ps, false);
ptdust = part_type_create();
part_type_sprite(ptdust, 4844, true, false, false);
part_type_speed(ptdust, 0.06, 0.2, 0, 0.1);
part_type_direction(ptdust, 0, 360, 0, 0.5);
part_type_life(ptdust, 50, 350);
part_type_alpha3(ptdust, 0, 1, 0);
part_type_size(ptdust, 0.7, 3, 0, 0);
part_type_blend(ptdust, true);
surfdust_tiled = -4;
surfdust = -4;
surfmask = -4;
pemitter = part_emitter_create(ps);
part_emitter_region(ps, pemitter, 0, 640, 0, 480, 0, 0);
part_emitter_stream(ps, pemitter, ptdust, 6);
repeat (60)
    part_system_update(ps);
