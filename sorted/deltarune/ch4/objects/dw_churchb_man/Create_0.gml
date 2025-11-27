scr_musicer("man_2.ogg", 0.7);
depth = 4000;
con = 0;
timer = 0;
init = 0;
siner = 0;
lastopen = 0;
gotegg = false;
altdiag = 0;
layer_set_visible("OFFICE_UPPER", 0);
layer_set_visible("DEBUG_ASSETS", 0);
scr_setparty();
if (scr_debug())
{
    if (keyboard_check(ord("P")))
    {
    }
}
treedoor = -4;
var spritesArray = layer_get_all_elements("OFFICE_UPPER");
for (var i = 0; i < array_length(spritesArray); i++)
{
    var marker = scr_marker_fromasset(spritesArray[i]);
    scr_depth(marker);
    if (layer_sprite_get_sprite(spritesArray[i]) == 4778)
        treedoor = marker;
}
spritesArray = layer_get_all_elements("DEBUG_ASSETS");
for (var i = 0; i < array_length(spritesArray); i++)
{
    if (layer_sprite_get_sprite(spritesArray[i]) == 2325)
    {
        npc = scr_makenpc_fromasset(spritesArray[i]);
        npc.mask_index = spr_dw_churchb_man_npcmask;
    }
}
man = -4;
tree = -4;
canvas = -4;
canvas2 = -4;
sink = -4;
artclubperson = -4;
occucon = 0;
blackout = -4;
