con = 0;
timer = 0;
init = 0;
cupboard = -4;
boardbib = -4;
bibliox = -4;
bibliox = instance_create(424, 204, obj_npc_room);
with (bibliox)
{
    extflag = "bibliox";
    sprite_index = spr_npc_bibliox_up;
    scr_darksize();
}
boardbib = instance_create(416, 160, obj_board_npc);
with (boardbib)
{
    extflag = "bibliox";
    sprite_index = spr_dw_ch3_board_npc_bibliox;
    scr_depth_board();
}
global.flag[1024] = 1;
if (global.flag[1092] == 1)
    boardbib.read = 1;
if (global.flag[1092] == 2)
{
    boardbib.extflag = "bibliox2";
    cupboard = instance_create(348, 132, obj_board_npc);
    cupboard.sprite_index = spr_board_cupboard;
    cupboard.extflag = "cupboard";
    with (cupboard)
        setxy_board(x, y);
    con = 2;
}
if (global.flag[1092] == 3)
{
    boardbib.extflag = "bibliox3";
    cupboard = instance_create(348, 132, obj_board_npc);
    cupboard.sprite_index = spr_board_cupboard;
    cupboard.extflag = "cupboard";
    with (cupboard)
        setxy_board(x, y);
    cupboard.read = 1;
    cupboard.image_index = 1;
}
if (global.flag[1092] == 4)
{
    boardbib.extflag = "bibliox3";
    boardbib.read = 1;
    with (obj_npc_room)
    {
        if (extflag == "bibliox")
            extflag = "bibliox_after";
    }
    cupboard = instance_create(348, 132, obj_board_npc);
    cupboard.sprite_index = spr_board_cupboard;
    cupboard.extflag = "cupboard";
    with (cupboard)
        setxy_board(x, y);
    cupboard.read = 1;
    cupboard.image_index = 1;
    con = 6;
}
endcon = 0;
if (global.flag[1055] >= 6)
{
    scr_marker_ext(128, 64, spr_pxwhite, 384, 160, undefined, undefined, c_black, 99801);
    endcon = 1;
    with (obj_npc_room)
        sprite_index = spr_npc_bibliox;
    var egg = false;
    if (global.flag[1092] == 6)
        egg = true;
    if (egg)
    {
        with (obj_npc_room)
            instance_destroy();
        with (instance_create(444, 248, obj_b3bs_console))
            scr_darksize();
    }
}
