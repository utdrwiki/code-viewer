image_alpha = 0;
if (init == 0)
{
    init = 1;
    if (global.flag[1006] >= 4)
    {
        var tx = choose(4, 5);
        var ty = choose(2, 3);
        instance_create(x + (tx * 32), y + (ty * 32), obj_board_swordroute_icekey);
    }
}
if (obj_board_camera.con == 0 && global.flag[1006] < 4)
{
    if (place_meeting(x, y, obj_mainchara_board))
    {
        global.flag[1006]++;
        helper = instance_create(x, y, obj_board_swordroute_treehelper);
        helper.swordlv = obj_mainchara_board.swordlv;
        helper.myhealth = obj_mainchara_board.myhealth;
        helper.maxhealth = obj_mainchara_board.maxhealth;
        helper.xp = obj_mainchara_board.xp;
        helper.xptolevel = obj_mainchara_board.xptolevel;
        helper.facing = obj_mainchara_board.facing;
        debug_message("before x:" + string(obj_mainchara_board.x));
        debug_message("before y:" + string(obj_mainchara_board.y));
        var plx = obj_mainchara_board.x - 128;
        var ply = obj_mainchara_board.y - 64;
        scr_board_instawarp(1280, 1088, 1280 + plx, 1088 + ply, "none", 138);
    }
}
