scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        intimer++;
        if (intimer == 15)
        {
            tenna.bounce = true;
            var tetalk = stringsetloc("Welcome to KODAKODA SHRINE!", "obj_b2pantheonentrance_slash_Step_0_gml_19_0");
            scr_couchtalk(tetalk, "tenna", 2, 90);
        }
        if (kris.camera == true)
        {
            intimer = 0;
            with (obj_mainchara_board)
            {
                if (y < 80)
                    y = 80;
            }
            with (topexit1)
            {
                setxy(other.x + 128, other.y - 32);
                instance_create(x, y, obj_board_smokepuff);
            }
            with (topexit2)
            {
                setxy(other.x + 160, other.y - 32);
                instance_create(x, y, obj_board_smokepuff);
            }
            with (leftexit)
            {
                instance_create(x, y - 32, obj_board_smokepuff);
                setxy(room_width, room_height);
            }
            snd_play(snd_board_door_close);
            with (obj_board_smokepuff)
                depth = 900000;
            con++;
        }
    }
    if (con == 1 && obj_board_camera.con == 0)
    {
        var photocount = global.flag[1041] + global.flag[1042] + global.flag[1043] + global.flag[1227];
        if (photocount >= 3)
            made = 1;
        if (!made)
        {
            made = 1;
            shopwriter = instance_create(x, y, obj_board_shopwriter);
            shopwriter.yloc = board_tiley(2);
            shopwriter.shopstring = stringsetloc("TAKE 3 GRAND PHOTOS#TO REACH THE OCEAN.", "obj_b2pantheonentrance_slash_Step_0_gml_48_0");
        }
        if (photocount >= 3)
        {
            con = 2;
            snd_play(snd_board_door_close);
            var tetalk = stringsetloc("With 3 PHOTOS, a PATH OPENS...", "obj_b2pantheonentrance_slash_Step_0_gml_68_0");
            scr_couchtalk(tetalk, "tenna", 2, 90);
            raftwatch = 1;
            with (rightexit1)
            {
                instance_create(x, y, obj_board_smokepuff);
                setxy(room_width, room_height);
            }
            with (rightexit2)
            {
                instance_create(x, y, obj_board_smokepuff);
                setxy(room_width, room_height);
            }
            with (obj_board_smokepuff)
                depth = 900000;
        }
    }
    if (suwalk == 0 && obj_board_camera.con == 0)
    {
        suwalktimer++;
        if (suwalktimer == 1)
            ralsei.follow = true;
        if (suwalktimer == 15)
        {
            if (susie.y == 286)
                scr_pathfind_to_point("susie", 3, 6, 0);
            if (susie.y == 80 || susie.y == 64)
                scr_pathfind_to_point("susie", 1, 5, 0);
            if (susie.x == 128)
                scr_play_recording("susie", "0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0R0R0R0R0R0R0R0R0R0D0D0W0W");
            if (susie.x == 480)
                scr_pathfind_to_point("susie", 3, 6, 0);
            suwalk = 1;
        }
    }
}
else
{
    if (made == true)
    {
        made = false;
        safe_delete(shopwriter);
    }
    suwalktimer = 0;
    suwalk = 0;
}
if (flagtoset != 0)
{
    with (obj_board_b2_photopodium)
    {
        if (num == 1 && myflag == 0)
        {
            myflag = other.flagtoset;
            other.flagtoset = 0;
        }
        if (num == 2 && myflag == 0)
        {
            myflag = other.flagtoset;
            other.flagtoset = 0;
        }
        if (num == 3 && myflag == 0)
        {
            myflag = other.flagtoset;
            other.flagtoset = 0;
        }
    }
    flagtoset = 0;
}
if (scr_debug())
{
    if (keyboard_check_pressed(ord("1")) && keyboard_check(ord("W")))
    {
        global.flag[1041] = 1;
        global.flag[1042] = 1;
        global.flag[1043] = 1;
        global.flag[1227] = 1;
    }
}
if (raftwatch == 1)
{
    if (obj_board_camera.shift != "none")
    {
        raftwatch = 2;
        if (obj_board_camera.shift == "right")
        {
        }
        else
        {
            obj_b2raftget.textpat = 1;
            var tetalk = stringsetloc("Hey kids, wrong way!", "obj_b2pantheonentrance_slash_Step_0_gml_129_0");
            if (obj_board_camera.shift == "warp")
                tetalk = stringsetloc("Oh, go back! You missed the special prize!", "obj_b2pantheonentrance_slash_Step_0_gml_132_0");
            tenna.bounce = 1;
            scr_couchtalk(tetalk, "tenna", 2, 80);
        }
    }
}
