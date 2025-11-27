con = -1;
var dozer_marker = instance_create(940, 47, obj_npc_room);
dozer_marker.sprite_index = spr_dogdozer;
with (dozer_marker)
    scr_depth();
var dozer_collider = instance_create(dozer_marker.x, dozer_marker.y + 60, obj_solidblockDark);
with (dozer_collider)
    image_xscale = 4;
tasque_npc = -4;
tasque_alt = 0;
tasque_target = 0;
maus_npc = -4;
maus_alt = 0;
maus_target = 0;
poppup_npc = -4;
poppup_alt = 0;
poppup_target = 0;
lancer_npc = instance_create(793, 92, obj_npc_room);
with (lancer_npc)
{
    scr_depth();
    sprite_index = spr_npc_lancer_construction;
}
elegant_npc = instance_create(869, 92, obj_npc_room);
with (elegant_npc)
{
    scr_depth();
    sprite_index = spr_npc_mr_elegance_construction;
}
if (global.flag[611] == 1)
{
    ponman_npc = instance_create(665, 268, obj_npc_room_animated);
    with (ponman_npc)
    {
        scr_depth();
        sprite_index = spr_ponman_idle;
    }
}
if (global.flag[632] == 1)
{
    tasque_npc = scr_dark_marker(890, 348, spr_tasque_idle_overworld);
    with (tasque_npc)
    {
        depth = 96500;
        image_speed = 0.2;
    }
    tasque_target = tasque_npc.xstart;
    tasque_readable = instance_create(tasque_npc.x - 120, tasque_npc.y - 40, obj_readable_room1);
    with (tasque_readable)
    {
        image_xscale = 3;
        image_yscale = 2;
    }
}
if (global.flag[634] == 1)
{
    maus_npc = scr_dark_marker(880, 188, spr_npc_maus_idle_overworld);
    with (maus_npc)
    {
        depth = 98060;
        image_speed = 0.2;
    }
    maus_target = maus_npc.xstart;
    maus_readable = instance_create(maus_npc.x - 120, maus_npc.y - 20, obj_readable_room1);
    with (maus_readable)
        image_xscale = 2;
}
if (global.flag[631] == 1)
{
    poppup_npc = scr_dark_marker(924, 297, spr_npc_poppup_idle_overworld);
    with (poppup_npc)
    {
        depth = 97000;
        image_speed = 0.2;
    }
    poppup_target = poppup_npc.xstart;
    poppup_readable = instance_create(poppup_npc.x - 120, poppup_npc.y - 80, obj_readable_room1);
    with (poppup_readable)
    {
        image_xscale = 3;
        image_yscale = 3;
    }
}
if (scr_flag_get(357) > 0)
{
    hacker_npc = instance_create(740, 254, obj_npc_room_animated);
    with (hacker_npc)
    {
        scr_depth();
        sprite_index = spr_npc_hacker_grass;
        image_speed = 0.1;
    }
}
if (global.flag[636] == 1)
{
    swatchling_npc = instance_create(656, 26, obj_npc_room_animated);
    with (swatchling_npc)
    {
        scr_depth();
        sprite_index = spr_npc_swatchling_peck;
    }
}
