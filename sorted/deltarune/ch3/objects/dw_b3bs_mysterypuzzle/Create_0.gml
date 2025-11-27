if (scr_debug())
    scr_setparty(1, 1, 0);
depth = 999998;
marksiner = 0;
tile[0] = instance_create(board_tilex(4), board_tiley(2), obj_b3bs_switchtile);
tile[1] = instance_create(board_tilex(5), board_tiley(2), obj_b3bs_switchtile);
tile[2] = instance_create(board_tilex(3), board_tiley(3), obj_b3bs_switchtile);
tile[3] = instance_create(board_tilex(4), board_tiley(3), obj_b3bs_switchtile);
tile[4] = instance_create(board_tilex(5), board_tiley(3), obj_b3bs_switchtile);
tile[5] = instance_create(board_tilex(6), board_tiley(3), obj_b3bs_switchtile);
tile[6] = instance_create(board_tilex(3), board_tiley(4), obj_b3bs_switchtile);
tile[7] = instance_create(board_tilex(4), board_tiley(4), obj_b3bs_switchtile);
tile[8] = instance_create(board_tilex(5), board_tiley(4), obj_b3bs_switchtile);
tile[9] = instance_create(board_tilex(6), board_tiley(4), obj_b3bs_switchtile);
tile[10] = instance_create(board_tilex(4), board_tiley(5), obj_b3bs_switchtile);
tile[11] = instance_create(board_tilex(5), board_tiley(5), obj_b3bs_switchtile);
tile[3].image_index = 1;
tile[8].image_index = 1;
con = 0;
update = 0;
timer = 0;
resettile = false;
resetcon = 0;
resettime = 0;
block = -4;
noreset = false;
global.flag[1018] = 1;
global.flag[1020] = 1;
if (global.flag[1111] > 0)
{
    block = instance_create(round(global.flag[1109] / 32) * 32, round(global.flag[1110] / 32) * 32, obj_pushableblock_board);
    with (obj_b3bs_switchtile)
        instance_destroy();
    con = 3;
    update = false;
}
spike[0] = scr_dark_marker(120, 320, spr_spiketile);
spike[1] = scr_dark_marker(160, 320, spr_spiketile);
spike[2] = scr_dark_marker(120, 360, spr_spiketile);
spike[3] = scr_dark_marker(160, 360, spr_spiketile);
for (var i = 0; i < 4; i++)
{
    spike[i].image_index = 0;
    if (global.flag[1111] == 2)
        spike[i].image_index = 1;
    spike[i].image_speed = 0;
    spike[i].depth = 1000000;
    spike[i].image_blend = merge_color(c_white, #371E0F, 0.5);
}
floorblock = -4;
floorblock = instance_create(120, 320, obj_solidblocksized);
scr_darksize(floorblock);
switchtile1 = instance_create(224, 96, obj_board_blocktrig);
switchtile2 = instance_create(320, 96, obj_board_blocktrig);
yend = -1;
if (global.flag[1111] == 2)
{
    con = 3;
    safe_delete(floorblock);
    with (switchtile1)
        used = true;
    with (switchtile2)
        used = true;
    for (var i = 0; i < 4; i++)
        spike[i].image_index = 1;
}
endcon = 0;
if (global.flag[1055] >= 6)
{
    scr_marker_ext(128, 64, spr_pxwhite, 352, 224, undefined, undefined, c_black, 99801);
    endcon = 1;
    con = 999;
    global.flag[1111] = 2;
    with (obj_pushableblock_board)
        visible = false;
}
