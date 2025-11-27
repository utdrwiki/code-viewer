scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        if (scr_debug())
            kris.camera = true;
    }
    if (global.interact == 0 && obj_board_camera.con == 0 && obj_board_camera.shift == "none")
    {
        if (makecrabs == true)
        {
            var cont = true;
            with (obj_board_b2crab_spawner)
            {
                if (done == 1)
                    cont = false;
            }
            if (cont)
            {
                var xloc = board_tilex(2.5);
                var yloc = board_tiley(2.5);
                var xspace = 192;
                var yspace = 96;
                crtimer++;
                if ((crtimer % 120) == 0)
                {
                    var special = choose(0, 1, 2, 3);
                    crab[0] = instance_create(xloc, yloc, obj_board_b2crab_spawner);
                    crab[1] = instance_create(xloc + xspace, yloc, obj_board_b2crab_spawner);
                    crab[2] = instance_create(xloc, yloc + yspace, obj_board_b2crab_spawner);
                    crab[3] = instance_create(xloc + xspace, yloc + yspace, obj_board_b2crab_spawner);
                    with (obj_board_b2crab_spawner)
                        timer = irandom_range(-10, 0);
                    if (global.flag[1227] == 0)
                        crab[special].special = 1;
                    crindex++;
                }
            }
        }
    }
}
else
{
}
