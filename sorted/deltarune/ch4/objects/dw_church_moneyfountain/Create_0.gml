layer_set_visible("DEBUG_ASSETS", 0);
global.flag[7] = 0;
if (scr_debug())
    scr_setparty(1, 1);
wafernpc = scr_makenpc("DEBUG_ASSETS", "dspr_room_dw_church_moneyfountain_wafernpc");
wafernpc.init = 0;
fountain = instance_create(2040, 850, obj_trigger_interact);
scr_size(13.75, 3.75, fountain);
fountain.strict = true;
fountain.numentry = 0;
jokenpc = scr_makenpc("DEBUG_ASSETS", "dspr_cupnpc");
with (jokenpc)
{
    if (global.flag[898] == 0)
        x += room_width;
    else
        x -= 40;
    issolid = false;
}
init = 0;
plack = scr_makenpc("DEBUG_ASSETS", "dspr_npc_plackard");
plack.issolid = false;
changedoor = 0;
if (global.flag[1503])
    changedoor = 1;
if (global.flag[1523])
    changedoor = 1;
if (global.plot >= 242)
{
    wafernpc.marker.sprite_index = spr_npc_organik_0_talk_differentrobe;
    wafernpc.marker.image_speed = 0;
    if (global.flag[1787] == 1)
        wafernpc.x = room_width * 2;
}
moneytext = 0;
with (obj_border_controller)
    show_border();
