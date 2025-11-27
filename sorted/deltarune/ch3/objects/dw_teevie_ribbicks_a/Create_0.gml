con = 0;
timer = 0;
trash = scr_marker_ext(744, 194, spr_dw_ch3_b3bs_trashcan_fall, 2, 2, 0);
with (trash)
    scr_depth_alt();
ribbick = 0;
encounterflag = 591;
if (global.flag[encounterflag] == 1)
{
    safe_delete(trash);
    con = 9999;
}
scr_setparty(1, 1, 0);
