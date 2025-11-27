con = -1;
tenna_npc = -4;
rouxls_npc = -4;
lamp_on = false;
lamp_switch_timer = 0;
tenna_con = -1;
if (scr_flag_get(779) < 2)
{
    tenna_npc = instance_create(412, 237, obj_npc_room_animated);
    with (tenna_npc)
    {
        scr_depth();
        sprite_index = spr_tenna_dance_cabbage_smol;
        image_speed = 1;
    }
    var podium_marker = instance_create(483, 150, obj_npc_room);
    with (podium_marker)
    {
        scr_depth();
        sprite_index = spr_dw_gameshow_podium;
    }
}
var lanino_npc = instance_create(193, 114, obj_npc_room);
with (lanino_npc)
{
    extflag = "lanino";
    sprite_index = spr_npc_lanino_talk;
    scr_depth();
}
var elnina_npc = instance_create(178, 113, obj_npc_room);
with (elnina_npc)
{
    extflag = "elnina";
    sprite_index = spr_npc_elnina_talk;
    scr_flip("x");
    x = 178;
    scr_depth();
}
var hatguy_npc = instance_create(390, 87, obj_npc_room);
with (hatguy_npc)
{
    extflag = "hatguy";
    sprite_index = spr_npc_jackperson_hats;
    scr_depth();
}
rouxls_npc = scr_dark_marker(96, 267, spr_npc_rouxls_lamp);
with (rouxls_npc)
    scr_depth();
rouxls_readable = instance_create(135, 309, obj_readable_room1);
with (rouxls_readable)
{
    image_yscale = 4;
    image_xscale = 4;
}
rouxls_collider = instance_create(100, 306, obj_solidblockDark);
with (rouxls_collider)
{
    image_xscale = 2;
    image_yscale = 2;
}
