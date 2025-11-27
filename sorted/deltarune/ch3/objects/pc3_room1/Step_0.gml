with (block)
{
    reset--;
    if (reset == 0)
    {
        debug_print("global.interact=0 set by reset tile");
        global.interact = 0;
    }
}
if (con == 0)
{
    if (resettile.pt == 1)
    {
        resettile.pt = 2;
        with (block)
        {
            var doreset = true;
            with (obj_board_grabobject)
            {
                if (grabbedid == other.id)
                    doreset = false;
            }
            if (doreset == true)
            {
                var __tileLayer = layer_get_id("BOARD_Tiles");
                var __originX = layer_get_x(__tileLayer);
                var __originY = layer_get_y(__tileLayer);
                global.interact = 1;
                scr_lerpvar("x", x, xstart + __originX, 10, 1, "in");
                scr_lerpvar("y", y, ystart + __originY, 10, 1, "out");
                reset = 10;
            }
        }
    }
    var count = 0;
    with (trig1)
    {
        if (place_meeting(x, y, obj_pushableblock_board))
            count++;
    }
    if (count == 1 && resettile.pressed == false)
    {
        safe_delete(trig1);
        timer = -10;
        snd_play(snd_board_secret_normal);
        global.interact = 1;
        con = 1;
    }
}
if (con == 1)
{
    var timedelay = 6;
    timer++;
    if (timer == (timedelay * 1))
    {
        with (tree1)
        {
            snd_play(snd_board_splash);
            instance_create_depth(x, y, depth - 1, obj_board_smokepuff);
            instance_destroy();
        }
    }
    if (timer == (timedelay * 2))
    {
        with (tree2)
        {
            snd_play(snd_board_splash);
            instance_create_depth(x, y, depth - 1, obj_board_smokepuff);
            instance_destroy();
        }
    }
    if (timer == (timedelay * 3))
    {
        with (block)
        {
            snd_play(snd_board_splash);
            instance_create_depth(x, y, depth - 1, obj_board_smokepuff);
            instance_destroy();
        }
    }
    if (timer == (timedelay * 4))
    {
        with (resettile)
        {
            snd_play(snd_board_splash);
            instance_create_depth(x, y, depth - 1, obj_board_smokepuff);
            instance_destroy();
        }
        global.interact = 0;
        with (obj_board_nothrow)
        {
            if (image_blend == #FF9999)
                instance_destroy();
        }
        with (obj_board_solidenemy)
        {
            if (image_blend == #FFFF75)
                instance_destroy();
        }
        global.flag[1150] = 2;
        timer = 0;
        con++;
    }
}
