if (scr_debug())
{
    if (keyboard_check(ord("E")))
    {
        global.flag[1099] = 1;
        scr_keyitemget(16);
        debug_print("got nina/lancers");
    }
}
amt = 0;
con = 0;
timer = 0;
animindex = 0;
tearbuff = 0;
waterfalllength = -16;
scr_darksize();
depth = 999990;
keycard = 0;
mysolid = 0;
if (room == room_dw_b3bs_idcardpuzzle)
{
    if (global.flag[1097] == 0)
    {
        keycard = instance_create(x + 32 + 8, y + 16 + 10, obj_board_marker_sin);
        scr_darksize(keycard);
        keycard.style = 1;
        keycard.yamt = 0;
        keycard.yrate = 30;
        keycard.sprite_index = spr_board_keycard;
    }
    if (global.flag[1097] == 1)
    {
        with (instance_create(x + 32 + 8, 196, obj_board_pickup))
        {
            type = "idcard";
            image_alpha = 1;
            sprite_index = spr_board_keycard;
            con = 2;
        }
    }
    if (global.flag[1097] > 0)
    {
        con = 3;
        waterfalllength = 64;
    }
    if (scr_debug())
    {
        if (keyboard_check(ord("P")))
            global.flag[1060] = 1;
    }
}
if (room == room_dw_b3bs_rouxls_lanina)
{
    mysolid = instance_create(x, y, obj_board_solid);
    mysolid.sprite_index = sprite_index;
    scr_darksize(mysolid);
    if (room == room_dw_b3bs_rouxls_lanina)
    {
        if (global.flag[1107] == 1)
        {
            for (var i = 0; i < 3; i++)
            {
                instance_create(x + (i * 32), y, obj_board_watertile);
                instance_create(x + (i * 32), y + 32, obj_board_watertile);
            }
            safe_delete(mysolid);
            instance_destroy();
        }
    }
}
