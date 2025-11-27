con = 0;
timer = 0;
trash = scr_marker_ext(564, 160, spr_dw_ch3_b3bs_trashcan_fall, 2, 2, 0);
with (trash)
    scr_depth_alt();
ribbick = 0;
encounterflag = 593;
if (global.flag[encounterflag] == 1)
{
    safe_delete(trash);
    con = 9999;
}
scr_setparty(1, 1, 0);
light = instance_create(440, 480, obj_dw__backstagelight);
with (light)
{
    drawlamp = false;
    drawparts = true;
}
light = instance_create(600, 700, obj_dw__backstagelight);
with (light)
{
    drawlamp = false;
    drawparts = true;
}
