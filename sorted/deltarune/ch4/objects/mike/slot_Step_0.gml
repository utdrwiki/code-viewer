if (act == 1)
{
    hoverlerp = 1;
}
else
{
    with (obj_mike)
    {
        if (act == 1 || act == 3)
        {
            var xpad = 10;
            var ypad = 10;
            var ob = collision_rectangle(bbox_left + xoff + xpad, bbox_top + yoff + ypad, (bbox_right + xoff) - xpad, (bbox_bottom + yoff) - ypad, obj_mike_slot, 1, 0);
            if (ob)
            {
                ob.hoverlerp = scr_approach(ob.hoverlerp, 0.8, 0.1);
                switch (sprite_index)
                {
                    case spr_mike_l:
                        other.col = 255;
                        break;
                    case spr_mike_m:
                        other.col = 127999;
                        break;
                    case spr_mike_s:
                        other.col = 13217535;
                        break;
                }
            }
        }
    }
    hoverlerp = scr_approach(hoverlerp, 0, 0.05);
}
image_blend = merge_color(c_black, col, hoverlerp);
