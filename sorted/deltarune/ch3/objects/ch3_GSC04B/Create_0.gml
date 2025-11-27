con = -1;
customcon = 0;
rouxls_npc = instance_create(238, 150, obj_npc_room);
with (rouxls_npc)
{
    extflag = "rouxls";
    normalanim = 5;
    sprite_index = spr_npc_rouxls_chef_up;
    depth = 98000;
}
elnina_npc = instance_create(337, 140, obj_npc_room_animated);
with (elnina_npc)
{
    extflag = "elnina";
    sprite_index = spr_npc_elnina_gaming_up;
    scr_depth();
    image_speed = 0.1;
}
lanino_npc = instance_create(428, 136, obj_npc_room_animated);
with (lanino_npc)
{
    extflag = "lanino";
    sprite_index = spr_npc_lanino_gaming_up;
    scr_depth();
    image_speed = 0.15;
}
shadow_npc = scr_dark_marker(475, 276, spr_shadowman_sax_a);
with (shadow_npc)
    scr_depth();
shadow_readable = instance_create(shadow_npc.x + 30, shadow_npc.y + 40, obj_readable_room1);
shadow_solid = instance_create(shadow_npc.x + 25, shadow_npc.y + 40, obj_soliddark);
with (shadow_solid)
{
    image_xscale = 1.5;
    image_yscale = 2;
}
with (shadow_readable)
{
    extflag = "shadow";
    image_xscale = 3;
    image_yscale = 4;
}
shadow_play = false;
shadow_play_con = 0;
shadow_play_times = 0;
controller_shine = -4;
remove_sparkle = false;
if (global.plot < 210)
{
    con = 0;
}
else if (scr_flag_get(1059) > 0)
{
    with (rouxls_npc)
        instance_destroy();
    with (elnina_npc)
        instance_destroy();
    with (lanino_npc)
        instance_destroy();
    with (shadow_npc)
        instance_destroy();
    with (shadow_readable)
        instance_destroy();
    with (shadow_solid)
        instance_destroy();
    if (scr_flag_get(1060) == 0)
    {
        controller_shine = instance_create(344, 222, obj_npc_room_animated);
        with (controller_shine)
        {
            extflag = "controller";
            sprite_index = spr_shine;
            scr_depth();
            image_speed = 0.1;
        }
    }
}
else
{
}
