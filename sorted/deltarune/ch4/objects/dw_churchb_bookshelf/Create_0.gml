con = 0;
timer = 0;
init = 0;
siner = 0;
layer_set_visible("DEBUG_ASSETS", 0);
if (scr_debug())
{
    if (keyboard_check(ord("P")))
    {
    }
}
scr_setparty(0);
if (global.plot >= 242)
    scr_setparty(1, 1);
npc = -4;
var spritesArray = layer_get_all_elements("DEBUG_ASSETS");
for (var i = 0; i < array_length(spritesArray); i++)
{
    if (layer_sprite_get_sprite(spritesArray[i]) == 1021)
        npc = scr_makenpc_fromasset(spritesArray[i]);
    if (layer_sprite_get_sprite(spritesArray[i]) == 1614)
        npc2 = scr_makenpc_fromasset(spritesArray[i]);
}
scr_sizeexact(64, 64, npc);
npc.marker.visible = false;
roomglow = instance_create(x, y, obj_roomglow);
prop = -4;
scr_musicer("sadchord2.ogg", 0.7, undefined, 30);
