helpnpc = 0;
npctext = 0;
helpnpctalked = 0;
with (instance_create(448, 634, obj_trigger_interact))
{
    other.helpnpc = id;
    scr_darksize();
    sprite_index = spr_npc_rgdragon_juice;
    image_speed = 0;
    strict = true;
    visible = true;
    issolid = true;
    scr_depth();
}
