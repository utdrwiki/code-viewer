con = 0;
timer = 0;
init = 0;
siner = 0;
layer_set_visible("DEBUG_ASSETS", 0);
if (scr_debug())
{
    if (keyboard_check(ord("P")))
    {
        if (global.flag[1573] == 0)
        {
            global.flag[1573] = 7;
            debug_print("Next entrance will go to man");
        }
        else
        {
            global.flag[1573] = 0;
            debug_print("Reset man entrance");
            debug_print();
        }
    }
}
scr_setparty(0);
if (global.plot >= 242)
    scr_setparty(1, 1);
shadowinit = 0;
loopactive = 1;
loopcount = 0;
leftx = 99;
rightx = 99;
goback1 = -1;
goback2 = -1;
door1 = 0;
door2 = 0;
if (global.entrance == 9)
    loopactive = 3;
roomstart = 15;
var spritesArray = layer_get_all_elements("DEBUG_ASSETS");
for (var i = 0; i < array_length(spritesArray); i++)
{
    if (layer_sprite_get_sprite(spritesArray[i]) == 2269)
        npc[0] = scr_makenpc_fromasset(spritesArray[i]);
    if (layer_sprite_get_sprite(spritesArray[i]) == 2094)
        npc[1] = scr_makenpc_fromasset(spritesArray[i]);
    if (layer_sprite_get_sprite(spritesArray[i]) == 3020)
        npc[2] = scr_makenpc_fromasset(spritesArray[i]);
    if (layer_sprite_get_sprite(spritesArray[i]) == 1614)
        npc[3] = scr_makenpc_fromasset(spritesArray[i]);
    if (layer_sprite_get_sprite(spritesArray[i]) == 1510)
        moss = scr_makenpc_fromasset(spritesArray[i]);
}
for (var i = 0; i < array_length(npc); i++)
{
    with (npc[i])
    {
        dontreset = false;
        issolid = false;
        xstart = x;
        ystart = y;
        y = -200;
        mystring = i;
    }
}
with (moss)
{
    init = 0;
    issolid = false;
    marker.depth = 190000;
    if (global.flag[1592] == 1)
        setxy(room_width * 4, room_height);
}
