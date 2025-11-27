con = -1;
customcon = 0;
burger_readable = -4;
nice_con = -1;
burger_after_image = false;
burger_after_image_timer = 0;
var petals_marker = scr_marker(190, 109, spr_npc_burgerpants_stand_rain_petals);
with (petals_marker)
    scr_depth();
burger_marker = scr_marker(190, 46, spr_npc_burgerpants_stand_rain_twitch);
bu_actor = -4;
burger_twitch = true;
burger_twitch_timer = 0;
burger_pause = false;
burger_pause_con = 0;
burger_collider = instance_create(burger_marker.x, burger_marker.y, obj_solidblockLight);
with (burger_collider)
{
    image_xscale = 2;
    image_yscale = 3;
}
nicecream_npc = -4;
if (scr_flag_get(777) > 0)
{
    burger_marker.sprite_index = spr_npc_burgerpants_stand_rain_empty;
    burger_marker.image_speed = 0;
    burger_marker.image_index = 0;
    burger_marker.x = 103;
    burger_marker.y = 86;
    nicecream_npc = instance_create(380, 75, obj_npc_room);
    nicecream_npc.sprite_index = spr_npc_nicecream_phone;
    nicecream_npc.normalanim = 4;
    with (nicecream_npc)
        scr_depth();
    burger_collider.x = burger_marker.x;
    burger_collider.y = burger_marker.y + 54;
    with (burger_collider)
        image_yscale = 0.6;
}
burger_readable = instance_create(burger_marker.x + 10, burger_marker.y + 40, obj_readable_room1);
burger_scoot = false;
burger_run = false;
burger_finish = false;
current_burger = -4;
if (global.plot >= 300)
{
    burger_marker.sprite_index = spr_npc_burgerpants_stand_rain_empty;
    with (nicecream_npc)
        instance_destroy();
}
with (burger_marker)
    scr_depth();
susie_marker = scr_marker(-100, -100, spr_susie_walk_down_lw);
with (susie_marker)
    visible = 0;
