con = 0;
disable_npcs = false;
enable_npcs = false;
rudy_turn_con = 0;
noelle_sing_talk = 0;
noelle_key_talk = 0;
noelle_talked = 0;
susie_ready = false;
facing_temp = 0;
actor_talker = -4;
no_actor = -4;
noelle_npc = scr_marker(235, 405, spr_noelle_juice_walk_left);
with (noelle_npc)
{
    image_speed = 0;
    scr_depth();
}
noelle_readable = instance_create(noelle_npc.x, noelle_npc.y, obj_readable_room1);
with (noelle_readable)
{
    extflag = "noelle";
    image_yscale = 2;
}
noelle_collider = instance_create(noelle_npc.x, noelle_npc.y, obj_solidblock);
with (noelle_collider)
    image_yscale = 2;
rudy_npc = instance_create(176, 400, obj_npc_room);
with (rudy_npc)
{
    extflag = "rudy";
    normalanim = 4;
    sprite_index = spr_rudy_juice_walk_left;
    scr_depth();
}
toriel_npc = instance_create(140, 400, obj_npc_facing);
with (toriel_npc)
{
    extflag = "toriel";
    facing = 1;
    dfacing = 1;
    dtsprite = spr_toriel_juice_talk_down;
    ltsprite = spr_toriel_juice_talk_left;
    utsprite = spr_toriel_talk_up_church;
    rtsprite = spr_toriel_juice_talk_right;
}
