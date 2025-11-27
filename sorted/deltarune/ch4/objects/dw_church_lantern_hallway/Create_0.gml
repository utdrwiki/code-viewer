global.flag[7] = 0;
layer_set_visible("GERSON_LOCS", 0);
layer_set_visible("debug_assets", 0);
if (scr_debug())
{
    scr_setparty(1, 1);
    scr_plotforce(145);
}
if (global.plot < 145)
    global.plot = 145;
scr_walkntalk_create();
con = 0;
gerson = 0;
auto_talk = false;
convo_index = 0;
current_line_index = 0;
global.flag[7] = 0;
roomloop = false;
loopwatch = 0;
nogobackplz = 0;
init = 0;
roomglow = instance_create(0, 0, obj_roomglow);
roomglowactive = 0;
loopcount = 0;
memloopcount = 0;
walkgerson = instance_create(0, 0, obj_dw_church_gerson_follow);
with (roomglow)
    create_highlight(other.walkgerson);
fakeblock = instance_create(1280, 1160, obj_solidblocksized);
scr_size(4, 1, fakeblock);
depth = 0;
visible = true;
curcount = 0;
layer_set_visible("TILES_2", 0);
layer_set_visible("HIDDEN_DOOR", 0);
if (global.plot > 145)
{
    layer_set_visible("TILES_2", 1);
    layer_set_visible("HIDDEN_DOOR", 1);
    safe_delete(fakeblock);
    con = 999;
    safe_delete(walkgerson);
    with (scr_marker_ext(1492, 1208, spr_firework_shine))
    {
        image_index = 3.15;
        image_xscale = 2;
        image_yscale = 2;
        image_speed = 0;
        depth = 999990;
    }
    with (scr_marker_ext(1174, 1208, spr_firework_shine))
    {
        image_index = 1.03;
        image_xscale = 2;
        image_yscale = 2;
        image_speed = 0;
        depth = 999990;
    }
    with (scr_marker_ext(1476, 1212, spr_firework_shine))
    {
        image_index = 3.87;
        image_xscale = 2;
        image_yscale = 2;
        image_speed = 0;
        depth = 999990;
    }
    with (scr_marker_ext(1198, 1210, spr_firework_shine))
    {
        image_index = 3.22;
        image_xscale = 2;
        image_yscale = 2;
        image_speed = 0;
        depth = 999990;
    }
    with (scr_marker_ext(1122, 1214, spr_firework_shine))
    {
        image_index = 0.38;
        image_xscale = 2;
        image_yscale = 2;
        image_speed = 0;
        depth = 999990;
    }
    with (scr_marker_ext(1260, 1210, spr_firework_shine))
    {
        image_index = 1.13;
        image_xscale = 2;
        image_yscale = 2;
        image_speed = 0;
        depth = 999990;
    }
    with (scr_marker_ext(1490, 1212, spr_firework_shine))
    {
        image_index = 2.25;
        image_xscale = 2;
        image_yscale = 2;
        image_speed = 0;
        depth = 999990;
    }
    with (scr_marker_ext(1260, 1222, spr_firework_shine))
    {
        image_index = 0.04;
        image_xscale = 2;
        image_yscale = 2;
        image_speed = 0;
        depth = 999990;
    }
    with (scr_marker_ext(1306, 1208, spr_firework_shine))
    {
        image_index = 0.95;
        image_xscale = 2;
        image_yscale = 2;
        image_speed = 0;
        depth = 999990;
    }
    with (scr_marker_ext(1434, 1208, spr_firework_shine))
    {
        image_index = 0.75;
        image_xscale = 2;
        image_yscale = 2;
        image_speed = 0;
        depth = 999990;
    }
    with (scr_marker_ext(1544, 1208, spr_firework_shine))
    {
        image_index = 3.09;
        image_xscale = 2;
        image_yscale = 2;
        image_speed = 0;
        depth = 999990;
    }
    with (scr_marker_ext(1158, 1222, spr_firework_shine))
    {
        image_index = 1.21;
        image_xscale = 2;
        image_yscale = 2;
        image_speed = 0;
        depth = 999990;
    }
    with (scr_marker_ext(1422, 1216, spr_firework_shine))
    {
        image_index = 1.39;
        image_xscale = 2;
        image_yscale = 2;
        image_speed = 0;
        depth = 999990;
    }
    with (scr_marker_ext(1224, 1216, spr_firework_shine))
    {
        image_index = 1.63;
        image_xscale = 2;
        image_yscale = 2;
        image_speed = 0;
        depth = 999990;
    }
    with (scr_marker_ext(1318, 1212, spr_firework_shine))
    {
        image_index = 0.32;
        image_xscale = 2;
        image_yscale = 2;
        image_speed = 0;
        depth = 999990;
    }
    with (scr_marker_ext(1440, 1210, spr_firework_shine))
    {
        image_index = 1.68;
        image_xscale = 2;
        image_yscale = 2;
        image_speed = 0;
        depth = 999990;
    }
    with (scr_marker_ext(1530, 1208, spr_firework_shine))
    {
        image_index = 2.65;
        image_xscale = 2;
        image_yscale = 2;
        image_speed = 0;
        depth = 999990;
    }
    with (scr_marker_ext(1312, 1210, spr_firework_shine))
    {
        image_index = 1.93;
        image_xscale = 2;
        image_yscale = 2;
        image_speed = 0;
        depth = 999990;
    }
    with (scr_marker_ext(1440, 1214, spr_firework_shine))
    {
        image_index = 1.3;
        image_xscale = 2;
        image_yscale = 2;
        image_speed = 0;
        depth = 999990;
    }
    with (scr_marker_ext(1220, 1218, spr_firework_shine))
    {
        image_index = 2.21;
        image_xscale = 2;
        image_yscale = 2;
        image_speed = 0;
        depth = 999990;
    }
    with (scr_marker_ext(1274, 1214, spr_firework_shine))
    {
        image_index = 0.1;
        image_xscale = 2;
        image_yscale = 2;
        image_speed = 0;
        depth = 999990;
    }
    with (scr_marker_ext(1182, 1214, spr_firework_shine))
    {
        image_index = 2.01;
        image_xscale = 2;
        image_yscale = 2;
        image_speed = 0;
        depth = 999990;
    }
    with (scr_marker_ext(1282, 1210, spr_firework_shine))
    {
        image_index = 1.2;
        image_xscale = 2;
        image_yscale = 2;
        image_speed = 0;
        depth = 999990;
    }
    with (scr_marker_ext(1346, 1210, spr_firework_shine))
    {
        image_index = 0.45;
        image_xscale = 2;
        image_yscale = 2;
        image_speed = 0;
        depth = 999990;
    }
    with (scr_marker_ext(1348, 1212, spr_firework_shine))
    {
        image_index = 1.09;
        image_xscale = 2;
        image_yscale = 2;
        image_speed = 0;
        depth = 999990;
    }
    with (scr_marker_ext(1408, 1218, spr_firework_shine))
    {
        image_index = 2.04;
        image_xscale = 2;
        image_yscale = 2;
        image_speed = 0;
        depth = 999990;
    }
    with (scr_marker_ext(1498, 1210, spr_firework_shine))
    {
        image_index = 1.82;
        image_xscale = 2;
        image_yscale = 2;
        image_speed = 0;
        depth = 999990;
    }
    with (scr_marker_ext(1264, 1216, spr_firework_shine))
    {
        image_index = 0.54;
        image_xscale = 2;
        image_yscale = 2;
        image_speed = 0;
        depth = 999990;
    }
    with (scr_marker_ext(1328, 1228, spr_firework_shine))
    {
        image_index = 0.62;
        image_xscale = 2;
        image_yscale = 2;
        image_speed = 0;
        depth = 999990;
    }
    with (scr_marker_ext(1432, 1208, spr_firework_shine))
    {
        image_index = 0.79;
        image_xscale = 2;
        image_yscale = 2;
        image_speed = 0;
        depth = 999990;
    }
}
hidecater = false;
cutscene_master = 0;
showloopprophecies = 0;
noleave = 0;
if (global.plot <= 146)
    noleave = 1;
wafernpc = -4;
bellstatue = -4;
var spritesArray = layer_get_all_elements("DEBUG_ASSETS");
for (var i = 0; i < array_length(spritesArray); i++)
{
    if (layer_sprite_get_sprite(spritesArray[i]) == 4619)
    {
        bellstatue = scr_makenpc_fromasset(spritesArray[i]);
        bellstatue.timer = 0;
    }
    if (layer_sprite_get_sprite(spritesArray[i]) == 2043)
        wafernpc = scr_makenpc_fromasset(spritesArray[i]);
}
bellmarker = -4;
if (global.plot >= 242)
{
    bellstatue.marker.visible = false;
    bellmarker = scr_marker_ext(bellstatue.marker.x, bellstatue.marker.y, spr_bell_enemy, 2, 2, undefined, undefined, undefined, undefined, 1);
    bellmarker.siner = 0;
}
