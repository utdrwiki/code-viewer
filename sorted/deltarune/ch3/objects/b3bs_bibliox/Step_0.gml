if (!init)
    init = 1;
obj_mainchara.cutscene = true;
with (obj_mainchara_board)
{
    nocamtransition = false;
    freeroam = false;
}
if (con == 0)
{
    if (boardbib.read >= 15 && obj_board_camera.con != 0)
        con = 1;
}
if (con == 1 && obj_board_camera.con == 0)
{
    cupboard = instance_create(348, 132, obj_board_npc);
    cupboard.sprite_index = spr_board_cupboard;
    cupboard.extflag = "cupboard";
    with (cupboard)
        setxy_board(x, y);
    global.flag[1092] = 2;
    with (obj_board_npc)
    {
        if (extflag == "bibliox")
            extflag = "bibliox2";
    }
    con = 2;
}
if (con == 5 && !bw_ex())
{
    with (obj_npc_room)
    {
        if (extflag == "bibliox")
            extflag = "bibliox_after";
    }
    snd_play(snd_egg);
    global.flag[1092] = 4;
    scr_keyitemget(18);
    con = 6;
}
if (endcon == 1)
{
    var trig = false;
    with (obj_b3bs_console)
    {
        if (swordinteract == 1)
            trig = true;
    }
    if (trig)
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
    with (obj_b3bs_console)
        swordinteract = 0;
    global.interact = 0;
}
