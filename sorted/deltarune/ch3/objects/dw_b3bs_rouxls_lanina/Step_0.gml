if (ver == 0)
{
    if (freeze == 0)
    {
        timer++;
        if ((timer % 8) == 0)
        {
            with (elnina)
            {
                image_speed = 0.125;
                with (instance_create_depth(x + 22, y, depth - 1, obj_board_crytear))
                {
                    image_blend = #5ACEDE;
                    image_xscale = 4;
                    image_yscale = 4;
                    gravity = 0.4;
                    vspeed = -2;
                    hspeed = 2;
                    scr_doom(id, 16);
                }
                with (instance_create_depth(x + 4, y, depth - 1, obj_board_crytear))
                {
                    image_blend = #5ACEDE;
                    image_xscale = 4;
                    image_yscale = 4;
                    gravity = 0.4;
                    vspeed = -2;
                    hspeed = -2;
                    scr_doom(id, 16);
                }
            }
            with (lanino)
            {
                image_speed = 0.125;
                with (instance_create_depth((x + 22) - 34, y + 12, depth - 1, obj_board_crytear))
                {
                    image_blend = #5ACEDE;
                    image_xscale = 4;
                    image_yscale = 4;
                    gravity = 0.4;
                    vspeed = -2;
                    hspeed = 2;
                    scr_doom(id, 16);
                }
                with (instance_create_depth((x + 4) - 34, y + 12, depth - 1, obj_board_crytear))
                {
                    image_blend = #5ACEDE;
                    image_xscale = 4;
                    image_yscale = 4;
                    gravity = 0.4;
                    vspeed = -2;
                    hspeed = -2;
                    scr_doom(id, 16);
                }
            }
        }
    }
    if (freeze == 1)
    {
        lanino.image_speed = 0;
        elnina.image_speed = 0;
    }
}
if (ver == 1)
{
    if (global.flag[1106] == 0)
    {
        if (puz.solved == 1)
        {
            safe_delete(puz);
            global.flag[1106] = 1;
        }
    }
}
with (obj_board_watertile)
    active = true;
