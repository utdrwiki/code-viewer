depth = -5;
global.flag[7] = 0;
if (global.plot < 125)
    global.plot = 125;
layer_set_visible("debug_assets", 0);
if (scr_debug())
{
    if (keyboard_check(ord("1")))
        global.plot = 125;
    if (global.tempflag[90] == 1 || keyboard_check(ord("2")))
    {
        global.plot = 126;
        global.facing = 1;
        global.tempflag[90] = 0;
        setxy(2936, 860, 1049);
        scr_setparty(1, 1);
    }
    if (keyboard_check(vk_shift))
    {
        debug_print("Did not listen to prophecy");
        global.flag[203] = 1;
    }
    scr_setparty(1, 1);
}
prophecyactive = false;
roomglow = instance_create(0, 0, obj_roomglow);
prophecy = [];
encounterflag = 1795;
encounterno = 150;
if (global.flag[encounterflag] != 1)
{
    guei = instance_create(x, y, obj_encounter_guei_alt);
    guei.trig = "guei";
    guei.encounterflag = encounterflag;
    guei.encounterno = encounterno;
}
scr_walkntalk_create();
cutscene = 0;
if (global.plot == 126)
{
    cutscene = 2;
    debug_print("got the last one");
}
if (global.plot > 126)
    cutscene = 999;
roomloop = false;
npccon = -1;
init = 0;
makesolid = false;
loccheck = false;
if (global.plot >= 151)
{
    npccon = 0;
    if (scr_debug())
        loccheck = true;
    makesolid = true;
    var spritesArray = layer_get_all_elements("debug_assets");
    for (var i = 0; i < array_length(spritesArray); i++)
    {
        if (layer_sprite_get_sprite(spritesArray[i]) == 385)
            bibliox = scr_makenpc_fromasset(spritesArray[i]);
        if (layer_sprite_get_sprite(spritesArray[i]) == 5585)
            cup = scr_makenpc_fromasset(spritesArray[i]);
    }
}
ncon = 0;
actreminder = 0;
if (global.flag[1639] == 1)
    actreminder = 99;
