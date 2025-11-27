con = 0;
timer = 0;
init = 0;
siner = 0;
layer_set_visible("DEBUG_ASSETS", 0);
if (scr_debug())
{
    if (global.plot < 244)
        global.plot = 244;
    if (keyboard_check(ord("1")))
    {
        global.flag[1606] = 0;
        global.flag[931] = 1;
        debug_print("did get the egg");
    }
    if (keyboard_check(ord("2")))
    {
        global.flag[1606] = 0;
        global.flag[931] = 0;
        debug_print("did not get the egg");
    }
}
scr_setparty(1, 1);
battletimer = 0;
battlecon = 0;
domake = true;
plspeed[0] = 0;
encounterno = 189;
encounterflag = 1793;
if (global.flag[encounterflag] == 1)
    domake = false;
var spritesArray = layer_get_all_elements("DEBUG_ASSETS");
for (var i = 0; i < array_length(spritesArray); i++)
{
    if (layer_sprite_get_sprite(spritesArray[i]) == 2269)
        pillarnpc = scr_makenpc_fromasset(spritesArray[i]);
}
roomglow = instance_create(x, y, obj_roomglow);
with (roomglow)
    create_highlight(other.pillarnpc.marker, true, true, -18);
doorsolid = -4;
layer_set_visible("HIDDEN_DOOR", 0);
scr_script_delayed(event_user, 1, 1);
