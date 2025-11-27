function scr_save_image_values(arg0 = 0, arg1 = 0)
{
    if (arg0 == 0)
        arg0 = id;
    if (arg1 == 0)
        arg1 = arg0;
    with (arg1)
    {
        sprite_values = 
        {
            x: arg0.x,
            y: arg0.y,
            depth: arg0.depth,
            image_angle: arg0.image_angle,
            image_blend: arg0.image_blend,
            image_xscale: arg0.image_xscale,
            image_yscale: arg0.image_yscale,
            image_alpha: arg0.image_alpha,
            image_speed: arg0.image_speed
        };
    }
}

function scr_load_image_values(arg0 = 0, arg1 = 0)
{
    if (arg0 == 0)
        arg0 = id;
    with (arg0)
    {
        if (v_ex("sprite_values"))
        {
            arg1.x = sprite_values.x;
            arg1.y = sprite_values.y;
            arg1.image_angle = sprite_values.image_angle;
            arg1.image_blend = sprite_values.image_blend;
            arg1.image_xscale = sprite_values.image_xscale;
            arg1.image_yscale = sprite_values.image_yscale;
            arg1.image_alpha = sprite_values.image_alpha;
            arg1.image_speed = sprite_values.image_speed;
        }
        else
        {
            debug_print("can't load values w/o saved values!!!!!");
        }
    }
}
