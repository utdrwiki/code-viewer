with (scr_afterimage_grow())
{
    sprite_index = spr_darkshape_blast_impact;
    image_xscale = 0.75;
    image_yscale = 0.75;
    fade = 0;
    xrate = -0.075;
    yrate = -0.075;
}
instance_destroy();
with (instance_create(x, y, obj_darkshape_blast))
{
    hx = other.hx + 200 + irandom_range(-50, 50);
    hy = (other.hy - 75) + irandom_range(-50, 50);
    direction = point_direction(x, y, hx, hy) + random_range(178, 182);
    image_angle = direction;
    image_yscale = 0.5;
    image_speed = 0;
    snd_play(snd_heartshot_dr_b);
    scr_lerpvar("spd", 30, 2, 6, 0, "in");
    scr_lerpvar("sparksize", 0, 0.4, 12, 0, "in");
    scr_script_delayed(scr_lerpvar, 12, "spd", 2, 30, 12, 0, "out");
}
