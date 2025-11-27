scr_musicer("alt_church_lobby.ogg");
timer = 0;
con = 0;
roomloop = 0;
roomloop2 = 0;
leftx = 0;
lefty = 0;
rightx = 0;
righty = 0;
leftx2 = 0;
lefty2 = 0;
rightx2 = 0;
righty2 = 0;
init = 0;
dbreaker = 0;
blockblock = -4;
noreturnblock = -4;
layer_set_visible("DEBUG_ASSETS", 0);
churchswitch = 0;
bgAssets = [];
glass = [];
layer_set_visible("NPC", false);
var bgassetlayer = layer_get_id("DEBUG_ASSETS");
var dadepth = layer_get_depth("TILES_BG") + 100000;
layer_set_visible(bgassetlayer, 0);
var elements = layer_get_all_elements(bgassetlayer);
for (var i = 0; i < array_length(elements); i++)
{
    var sprite = layer_sprite_get_sprite(elements[i]);
    var xloc = scr_even(layer_sprite_get_x(elements[i]));
    var yloc = scr_even(layer_sprite_get_y(elements[i]));
    var xscale = layer_sprite_get_xscale(elements[i]);
    var yscale = layer_sprite_get_yscale(elements[i]);
    var angle = layer_sprite_get_angle(elements[i]);
    var blend = layer_sprite_get_blend(elements[i]);
    if (sprite == spr_dw_church_magical_glass)
    {
        var mark = scr_marker_fromasset(elements[i]);
        with (mark)
        {
            image_alpha = 0.2;
            depth = dadepth - y;
            array_push(other.glass, id);
        }
    }
    if (sprite == spr_dw_church_switch)
    {
        churchswitch = scr_makenpc_fromasset(elements[i]);
        churchswitch.marker.image_index = 1;
    }
    if (sprite == spr_dw_church_fireextinguisher)
    {
        extinguisher = scr_makenpc_fromasset(elements[i]);
        extinguisher.xstart = extinguisher.x;
        extinguisher.x = room_width;
        extinguisher.siner = 0;
        extinguisher.marker.siner = 0;
    }
}
var spritesArray = layer_get_all_elements("NPC");
for (var i = 0; i < array_length(spritesArray); i++)
{
    if (layer_sprite_get_sprite(spritesArray[i]) == 3102)
    {
        chicknpc = scr_makenpc_fromasset(spritesArray[i]);
        chicknpc.siner = 0;
    }
}
showglass = false;
if (global.entrance == 7)
{
    showglass = true;
    for (var i = 0; i < array_length(glass); i++)
    {
        with (glass[i])
        {
            image_alpha = 0.2;
            if (y >= 824)
            {
                var block = instance_create(x, y, obj_solidblocksized);
                scr_sizeexact(sprite_width, sprite_height, block);
                instance_destroy();
            }
        }
    }
}
if (global.plot < 240 && global.plot > 238.6)
    global.plot = 240;
if (scr_debug())
{
    if (keyboard_check(ord("P")))
        global.plot = 240;
    scr_setparty(1);
    if (global.plot >= 240)
        scr_setparty(1, 1);
}
if (global.plot == 241)
    con = 2;
if (global.plot == 242)
    con = 3;
if (global.plot > 242)
    con = 4;
scr_walkntalk_create();
blockit = false;
unblock = false;
