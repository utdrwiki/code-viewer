con = 0;
timer = 0;
init = 0;
siner = 0;
shelvesinit = false;
sprite_array_size = 0;
layersprite = [];
elements = -4;
roomglow = instance_create(x, y, obj_roomglow);
roomglow.active = true;
roomglow.actind = 1;
roomglow.tiles_only = true;
roomglow.fadeparallax = false;
roomglow.shadow_kill = true;
scr_setparty(1, 1);
encounterflag = 1791;
encounterno = 161;
layer_set_visible("DEBUG_ASSETS", 0);
layer_set_visible("TILES_BATTLEBORDER", 0);
if (scr_debug())
{
    if (keyboard_check(ord("P")))
    {
    }
}
bellcount = 0;
if (global.plot >= 244)
    bellcount = 200;
