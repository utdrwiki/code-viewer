if (myinteract == 3)
{
    sprite_index = spr_npc_zapper_jump;
    image_speed = 0.2;
}
event_inherited();
if (myinteract == 0)
{
    sprite_index = spr_npc_zapper;
    image_speed = 0;
    image_index = 0;
}
