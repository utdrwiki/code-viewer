if (global.fighting && i_ex(obj_growtangle))
{
    if (!box_init && obj_growtangle.growcon == 2)
    {
        box_init = true;
        with (obj_growtangle)
        {
            d = instance_create_depth(x, y, depth - 1, obj_afterimage);
            d.sprite_index = spr_custom_box;
            d.image_xscale = image_xscale / (maxxscale / 2);
            d.image_yscale = image_yscale / (maxyscale / 2);
            d.image_angle = image_angle;
            d.image_blend = image_blend;
            d.image_alpha = (1 - image_alpha) + 0.1;
            d.image_speed = 0;
            depth = 20;
        }
    }
    if (box_init && obj_growtangle.growcon == 3)
    {
        box_init = false;
        obj_growtangle.depth = 5;
    }
}
if (mem_darkness == -1)
    mem_darkness = image_alpha;
updated_this_frame = false;
