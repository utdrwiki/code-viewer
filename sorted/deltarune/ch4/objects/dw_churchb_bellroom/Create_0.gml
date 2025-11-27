scr_musicer("second_church.ogg");
if (!instance_exists(obj_hsv_shifter))
    instance_create(0, 0, obj_hsv_shifter);
timer = 0;
con = 0;
init = 0;
fog = instance_create(x, y, obj_dw_church_fog);
fog.depth = 10000;
econ = 0;
etimer = 0;
encounterflag = 1788;
encounterno = 190;
enemarker = -4;
makeenemy = true;
if (global.flag[encounterflag] == 1)
{
    makeenemy = false;
    econ = -999;
}
layer_set_visible("DEBUG_ASSETS", 0);
layer_set_visible("BELL_ENEMYBELL", 0);
if (scr_debug())
    scr_setparty(0);
layarray = [];
array_push(layarray, layer_get_id("TILES_UPSIDEDOWN"));
array_push(layarray, layer_get_id("ASSETS_1"));
layx = 0;
layer_set_visible("TILES_UPSIDEDOWN", 1);
layer_set_visible("ASSETS_1", 1);
depth = layer_get_depth("BELL_FLOOR_ALT_FRONTROW") + 20;
var graddepth = layer_get_depth("ASSETS_1") - 10;
graddepth = 0;
scr_marker_ext(0, 0, spr_whitegradientdown_40, room_width, room_height, undefined, undefined, undefined, graddepth);
chaseloc = [];
fakebellbit = -4;
fakebelloverlay = -4;
blacklay = -4;
cutscene = 0;
roomglow = instance_create(x, y, obj_roomglow);
if (global.flag[1572])
    cutscene = -1;
stepped = false;
susie = -4;
