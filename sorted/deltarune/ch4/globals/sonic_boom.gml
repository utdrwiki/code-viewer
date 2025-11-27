function scr_sonic_boom(arg0 = 0, arg1 = 1)
{
    var sanic = instance_create_depth(x, y, depth + 1, obj_bulletparent);
    with (sanic)
    {
        image_angle = arg0;
        image_xscale = 0.25 * arg1;
        image_yscale = 0.5 * arg1;
        sprite_index = spr_finisher_explosion;
        image_index = 2;
        image_speed = 0.5;
        image_blend = c_gray;
        scr_lerpvar("image_xscale", 0.25 * arg1, 0.5 * arg1, 10);
        scr_lerpvar("image_yscale", 0.5 * arg1, 1 * arg1, 10);
        scr_script_delayed(instance_destroy, 10);
    }
    return sanic;
}
