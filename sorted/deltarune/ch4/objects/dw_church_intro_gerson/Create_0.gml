layer_set_visible("DEBUG_ASSETS", 0);
if (global.plot >= 127)
    global.flag[874] = 1;
if (scr_debug())
{
    scr_setparty(1, 1, 0);
    if (keyboard_check(ord("P")))
        global.flag[874] = 0;
}
global.flag[7] = 0;
con = 0;
timer = 0;
darkness = 0;
slight = 0;
klight = 0;
rlight = 0;
darkinit = 0;
gerson = scr_marker_ext(1988, 800, spr_gerson_outfit_walk_cane_right, 2, 2, undefined, 0, c_black, undefined, 1);
gcon = 0;
gtime = 0;
if (global.flag[874] == 1)
{
    gcon = 2;
    safe_delete(gerson);
}
npc = -4;
tres = -4;
var spritesArray = layer_get_all_elements("DEBUG_ASSETS");
for (var i = 0; i < array_length(spritesArray); i++)
{
    if (layer_sprite_get_sprite(spritesArray[i]) == 2043)
        npc = scr_makenpc_fromasset(spritesArray[i]);
    if (layer_sprite_get_sprite(spritesArray[i]) == 783)
        tres = scr_makenpc_fromasset(spritesArray[i]);
}
