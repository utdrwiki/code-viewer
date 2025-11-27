timer = 0;
con = 0;
active = 0;
frozen = false;
camsolid = instance_create(416, 128, obj_board_camsolid);
bell1 = instance_create(224, 64, obj_board_marker);
b1[0] = instance_create(224, 64, obj_board_trigger);
b1[1] = instance_create(240, 64, obj_board_trigger);
bell2 = instance_create(272, 64, obj_board_marker);
b2[0] = instance_create(272, 64, obj_board_trigger);
b2[1] = instance_create(288, 64, obj_board_trigger);
bell3 = instance_create(320, 64, obj_board_marker);
b3[0] = instance_create(320, 64, obj_board_trigger);
b3[1] = instance_create(336, 64, obj_board_trigger);
bell4 = instance_create(368, 64, obj_board_marker);
b4[0] = instance_create(368, 64, obj_board_trigger);
b4[1] = instance_create(384, 64, obj_board_trigger);
bsin = 0;
block = instance_create(160, 128, obj_pushableblock_board);
btrig = instance_create(160, 96, obj_trigger_interact);
with (obj_board_marker)
{
    sprite_index = spr_board_krisresetbell;
    visible = 1;
    scr_depth_board();
    scr_darksize();
}
with (obj_board_trigger)
    image_yscale = 2;
light = 0;
makelight = false;
if (global.flag[1142])
{
    con = 10;
    makelight = true;
    safe_delete(block);
    safe_delete(btrig);
    safe_delete(bell1);
    safe_delete(b1[0]);
    safe_delete(b1[1]);
    safe_delete(bell2);
    safe_delete(b2[0]);
    safe_delete(b2[1]);
    safe_delete(bell3);
    safe_delete(b3[0]);
    safe_delete(b3[1]);
    safe_delete(bell4);
    safe_delete(b4[0]);
    safe_delete(b4[1]);
    safe_delete(block);
    safe_delete(btrig);
    var targcolor = 4858411;
    if (global.flag[1142] == 2)
        targcolor = 2377478;
    with (obj_dw_ch3_b3bs_zapperhead)
        scr_lerp_imageblend(id, c_black, targcolor, 5, 2, "in");
}
