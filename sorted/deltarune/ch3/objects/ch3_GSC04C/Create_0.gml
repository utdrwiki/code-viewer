con = -1;
customcon = 0;
if (global.plot < 215)
{
    con = 0;
    rouxls = scr_dark_marker(266, 80, spr_rouxls_chef);
    with (rouxls)
    {
        scr_depth();
        visible = 0;
    }
    release_rouxls = false;
    rouxls_appear = -4;
    rouxls_appear_timer = 0;
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_blend = c_black;
    blackall.image_alpha = 0;
}
else
{
    var elnina_npc = instance_create(325, 95, obj_npc_room);
    with (elnina_npc)
    {
        extflag = "elnina";
        sprite_index = spr_npc_elnina_blush_talk;
        scr_flip("x");
        scr_depth();
    }
    var lanino_npc = instance_create(418, 97, obj_npc_room);
    with (lanino_npc)
    {
        extflag = "lanino";
        sprite_index = spr_npc_lanino_blush_talk;
        scr_depth();
    }
    instance_destroy();
}
