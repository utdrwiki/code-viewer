con = -1;
battle_ready = scr_flag_get(1188) == 0;
cleanup = 0;
watercon = 0;
watertimer = 0;
zapper_npc_left = instance_create(182, 117, obj_npc_room);
with (zapper_npc_left)
{
    sprite_index = spr_npc_zapper_talk_water;
    extflag = "zapper_left";
    scr_flip("x");
}
zapper_npc_right = instance_create(376, 117, obj_npc_room);
with (zapper_npc_right)
{
    sprite_index = spr_npc_zapper_talk_water;
    extflag = "zapper_right";
}

create_crater = function()
{
    var crater = scr_dark_marker(300, 240, spr_dw_crater);
    with (crater)
        depth = 999999;
    var crater_readable = instance_create(crater.x, crater.y, obj_readable_room1);
    with (crater_readable)
    {
        image_xscale = 2;
        image_yscale = 2;
        extflag = "crater";
    }
    with (zapper_npc_left)
        extflag = "zapper_left_crater";
    with (zapper_npc_right)
        extflag = "zapper_right_crater";
};

if (battle_ready)
{
    watercooler = instance_create(300, 173, obj_trigger_interact);
    watercooler.sprite_index = spr_watercooler;
    watercooler.visible = true;
    watercooler.extflag = "watercooler";
    scr_darksize(watercooler);
    scr_depth(watercooler);
}
else
{
    create_crater();
}
