if (instance_exists(grabdaddy))
{
    if (type == 0)
    {
        if ((con == 0 && blocked != 0 && grabdaddy.canfreemove && lifetimer > 2 && (grabdaddy.facing == 0 || grabdaddy.facing == 1 || grabdaddy.facing == 2 || grabdaddy.facing == 3)) || grabdaddy.graballpots == true)
        {
            if (grabdaddy.graballpots_con == 3 && grabdaddy.graballpots_timer > 1 && drawreticle == true)
                draw_sprite_ext(spr_board_throw_reticle, 0, grabdaddy.xx, grabdaddy.yy, 2, 2, 0, c_white, 1);
            else if (drawreticle == true && snap)
                draw_sprite_ext(spr_board_throw_reticle, 0, aimx, aimy, 2, 2, 0, c_white, 1);
        }
        if (drawreticle == true && !snap && blocked)
            draw_sprite_ext(spr_board_throw_reticle, 0, aimx, aimy, 2, 2, 0, c_white, 1);
    }
    if (type == 1 && instance_exists(grabbedid))
    {
        if (con == 0)
        {
            var bblocked = true;
            if (grabbedid.size == 1)
            {
                if (bridgereticle1)
                    bblocked = false;
            }
            if (grabbedid.size == 2)
            {
                bblocked = true;
                if (bridgereticle1 && bridgereticle2)
                    bblocked = false;
            }
            draw_sprite_ext(spr_board_bridge_reticle, bblocked, checkx, checky, 2, 2, 0, c_white, 1);
            if (grabbedid.size == 2)
                draw_sprite_ext(spr_board_bridge_reticle, bblocked, checkx + 32, checky, 2, 2, 0, c_white, 1);
        }
    }
    if (type == 2)
    {
        if (blocked == 1)
            draw_sprite_ext(spr_board_throw_reticle, 0, aimx, aimy, 2, 2, 0, c_white, 1);
    }
    if (type == 3)
    {
        if (blocked)
            draw_sprite_ext(spr_board_throw_reticle, 0, aimx, aimy, 2, 2, 0, c_white, 1);
    }
}
if (con == 0)
{
    with (marker)
        draw_self();
}
else
{
    with (marker)
    {
        var truex = round(x / 2) * 2;
        var truey = round(y / 2) * 2;
        draw_sprite_ext(sprite_index, image_index, truex, truey + other.fakey, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    }
    draw_self();
}
