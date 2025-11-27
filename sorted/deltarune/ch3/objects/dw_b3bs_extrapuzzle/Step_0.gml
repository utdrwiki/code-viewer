if (roomstart < 10)
    roomstart++;
if (scr_debug())
{
    if (keyboard_check_pressed(ord("0")) && keyboard_check(ord("W")))
        room_goto(room_dw_b3bs_mysterypuzzle);
}
if (pressed == 0)
{
    var triggered = 0;
    with (trigger)
    {
        if (place_meeting(x, y, obj_pushableblock_board))
            triggered = 1;
    }
    if (triggered)
    {
        solidblock.x = room_width;
        pressed = 1;
        if (prefire == 0)
        {
            if (roomstart >= 10)
            {
                snd_play(snd_board_splash);
                for (var i = 0; i < 4; i++)
                {
                    with (instance_create(384 + (i * 32), 192, obj_board_smokepuff))
                        image_blend = #CE6951;
                }
            }
        }
        if (prefire == 1)
            prefire = 0;
        trigd = 1;
    }
}
if (pressed == 1)
{
    var untriggered = 0;
    with (trigger)
    {
        if (!place_meeting(x, y, obj_pushableblock_board))
            untriggered = 1;
    }
    if (untriggered == 1)
    {
        for (var i = 0; i < 4; i++)
        {
            with (instance_create(384 + (i * 32), 192, obj_board_smokepuff))
                image_blend = #4EBBC3;
        }
        trigd = 0;
        debug_print("untriggered");
        solidblock.x = solidblock.xstart;
        snd_play(snd_board_splash);
        pressed = 0;
    }
}
if (doorcon == 0)
{
    with (obj_board_switchtile)
    {
        if (pressed)
            other.doorcon = 1;
    }
}
if (doorcon == 1)
{
    global.flag[1112] = 1;
    with (obj_board_switchtile)
    {
        with (instance_create(x, y, obj_board_smokepuff))
        {
            depth = other.depth;
            image_blend = #F22D81;
        }
        instance_destroy();
    }
    safe_delete(doorblock);
    snd_play(snd_impact);
    scr_shakescreen();
    doorcon = 2;
}
if (i_ex(block))
{
    if (update == false)
    {
        if (i_ex(obj_board_grabobject))
            update = true;
    }
    var doupdate = true;
    if (obj_pushableblock_board.con != 0)
        doupdate = false;
    if (update == true && global.interact == 0 && doupdate == true)
    {
        if (!i_ex(obj_board_grabobject))
        {
            update = false;
            global.flag[1109] = block.x - bxoff;
            global.flag[1110] = block.y - byoff;
            debug_message("block x/y=" + string(global.flag[1109]) + "|" + string(global.flag[1110]));
        }
    }
}
if (endcon == 1)
{
    if (obj_b3bs_console.swordinteract == 1)
    {
        endcon = 2;
        global.interact = 1;
        global.msc = 1411;
        scr_text(global.msc);
        d_make();
    }
}
if (endcon == 2 && !d_ex())
{
    endcon = 1;
    obj_b3bs_console.swordinteract = 0;
    global.interact = 0;
}
