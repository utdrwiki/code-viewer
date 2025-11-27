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
    global.flag[23] = 1;
}
roomglow = instance_create(0, 0, obj_roomglow);
lasttouch = "loc1_fall";
triginit = 0;
wallswitch = -4;
destructableblockpos = [];
climbcon = 0;
climbtimer = 0;
water = [];
var spritesArray = layer_get_all_elements("DEBUG_ASSETS");
for (var i = 0; i < array_length(spritesArray); i++)
{
    if (layer_sprite_get_sprite(spritesArray[i]) == 1959)
        npc = scr_makenpc_fromasset(spritesArray[i]);
}

function compare_by_x(arg0, arg1)
{
    return arg0.x - arg1.x;
}
