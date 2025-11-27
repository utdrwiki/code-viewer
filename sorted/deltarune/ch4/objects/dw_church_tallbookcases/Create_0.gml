global.flag[7] = 0;
layer_set_visible("DEBUG_ASSETS", false);
if (scr_debug())
{
    scr_setparty(1, 1);
    if (keyboard_check(ord("P")))
    {
        global.flag[851] = !global.flag[851];
        debug_print("global.flag[851]=" + string(global.flag[851]));
        global.plot = 242;
    }
}
con = 0;
timer = 0;
siner = 0;
animindex = 0;
dontdraw = -1;
depth = 95960;
chaser = 0;
difficulty = 0;
difficulty = 1;
encounterno = 158;
encounterflag = 1797;
gueitoskip = -1;
gueicheck = true;
if (global.flag[encounterflag] == 1)
{
    con = 999;
    alpha = 0;
    dontdraw = true;
}
if (global.flag[encounterflag] != 0)
    difficulty = 1;
movespeed = 18;
if (difficulty == 1)
    movespeed = 26;
doorinit = 0;
if (global.flag[891] == 0)
    doorinit = 1;
cup = -4;
if (global.plot >= 242)
{
    var spritesArray = layer_get_all_elements("DEBUG_ASSETS");
    for (var i = 0; i < array_length(spritesArray); i++)
    {
        if (layer_sprite_get_sprite(spritesArray[i]) == 5585)
        {
            cup = scr_makenpc_fromasset(spritesArray[i]);
            cup.strict = true;
        }
    }
}
