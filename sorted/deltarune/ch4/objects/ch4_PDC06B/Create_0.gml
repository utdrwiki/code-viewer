con = -1;
customcon = 0;
scr_setparty(1, 1, 0);
if (scr_flag_get(394) == 1)
{
    icee_npc = instance_create(283, 270, obj_npc_room);
    icee_npc.sprite_index = spr_dw_icee_cushion;
    icee_npc.depth = 97000;
}
else
{
    trash_npc = instance_create(304, 282, obj_npc_room);
    trash_npc.sprite_index = bg_dw_castle_trash;
    trash_npc.depth = 97000;
}
if (scr_flag_get(710) == 1)
{
    con = 0;
    snd_free_all();
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = -110;
    blackall.image_blend = c_black;
    if (scr_flag_get(394) == 1)
        icee_npc.visible = 0;
    else
        trash_npc.visible = 0;
}
else
{
    instance_destroy();
}
