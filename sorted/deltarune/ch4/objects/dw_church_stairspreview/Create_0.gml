layer_set_visible("DEBUG_SPRITES", 0);
if (scr_debug())
    scr_setparty(1, 1);
global.flag[7] = 0;
npc = scr_makenpc("DEBUG_SPRITES", "dspr_fireextinguisher");
npc.siner = 0;
npc2 = scr_makenpc("DEBUG_SPRITES", "dspr_wafernpc1");
init = 0;
roomglow = instance_create(0, 0, obj_roomglow);
prophecy = -4;
var spritesArray = layer_get_all_elements("DEBUG_SPRITES");
for (var i = 0; i < array_length(spritesArray); i++)
{
    if (layer_sprite_get_sprite(spritesArray[i]) == 5035)
    {
        var info = scr_assetgetinfo(spritesArray[i]);
        prophecy = instance_create(info[2] + sprite_get_width(info[0]), info[3] + sprite_get_height(info[0]), obj_dw_church_prophecy);
        with (prophecy)
        {
            extflag = "boss1";
            fade_edges = true;
        }
    }
}
