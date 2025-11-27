if (scr_debug())
    scr_setparty(1);
init = 0;
timer = 0;
con = 0;
shelfinit = 0;
global.flag[7] = 0;
scr_walkntalk_create();
layer_set_visible("DEBUG_ASSETS", 0);
if (scr_debug())
{
    if (keyboard_check(ord("P")))
        global.plot = 238;
    if (keyboard_check(ord("1")))
    {
        global.plot = 238;
        global.tempflag[90] = 1;
    }
    if (keyboard_check(ord("2")))
    {
        global.plot = 238.2;
        global.tempflag[90] = 2;
    }
}
loopy = 0;
econ = 0;
etimer = 0;
var spritesArray = layer_get_all_elements("DEBUG_ASSETS");
npc1 = -4;
npc2 = -4;
npc3 = -4;
npc4 = -4;
for (var i = 0; i < array_length(spritesArray); i++)
{
    if (layer_sprite_get_sprite(spritesArray[i]) == 3299)
    {
        if (layer_sprite_get_blend(spritesArray[i]) == 16711935)
        {
            layer_sprite_blend(spritesArray[i], 16777215);
            npc1 = scr_makenpc_fromasset(spritesArray[i]);
        }
        if (layer_sprite_get_blend(spritesArray[i]) == 65535)
        {
            layer_sprite_blend(spritesArray[i], 16777215);
            npc3 = scr_makenpc_fromasset(spritesArray[i]);
        }
        if (layer_sprite_get_blend(spritesArray[i]) == 11184810)
        {
            layer_sprite_blend(spritesArray[i], 16777215);
            npc4 = scr_makenpc_fromasset(spritesArray[i]);
        }
    }
    if (layer_sprite_get_sprite(spritesArray[i]) == 4929)
        npc2 = scr_marker_fromasset(spritesArray[i], undefined, 1);
    if (layer_sprite_get_sprite(spritesArray[i]) == 1614)
        npc_wing = scr_makenpc_fromasset(spritesArray[i], undefined, 1);
}
encounterflag = 1785;
encounterno = 156;
if (scr_debug() && keyboard_check(ord("E")))
    global.flag[encounterflag] = 0;
if (global.flag[encounterflag] == 1)
{
    safe_delete(npc1.marker);
    safe_delete(npc1);
    safe_delete(npc2);
    safe_delete(npc3.marker);
    safe_delete(npc3);
    safe_delete(npc4.marker);
    safe_delete(npc4);
    safe_delete(npc_wing.marker);
    safe_delete(npc_wing);
    econ = -99;
}
if (global.plot < 238)
    global.plot = 238;
cutscene = 0;
if (global.plot == 238.1)
    cutscene = 3;
if (global.plot == 238.2)
    cutscene = 6;
if (global.plot > 238.2)
    cutscene = 99;
ccon = 0;
talked = 0;
didfight = false;
