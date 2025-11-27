timer = 0;
con = 0;
bgAssets = [];
glass = [];
var bgassetlayer = layer_get_id("BG_ASSETS");
layer_set_visible(bgassetlayer, 0);
var elements = layer_get_all_elements(bgassetlayer);
for (var i = 0; i < array_length(elements); i++)
{
    if (layer_get_element_type(elements[i]) == 4)
    {
        var sprite = layer_sprite_get_sprite(elements[i]);
        var xloc = scr_even(layer_sprite_get_x(elements[i]));
        var yloc = scr_even(layer_sprite_get_y(elements[i]));
        var xscale = layer_sprite_get_xscale(elements[i]);
        var yscale = layer_sprite_get_yscale(elements[i]);
        var angle = layer_sprite_get_angle(elements[i]);
        var mark = scr_marker_ext(xloc, yloc, sprite, xscale, yscale, 0.2, 0, undefined, 999990);
        mark.image_angle = angle;
        array_push(bgAssets, mark);
        with (mark)
        {
            if (sprite_index == spr_dw_church_magical_glass)
            {
                image_alpha = 0.2;
                scr_depth(undefined, -10000);
                array_push(other.glass, id);
            }
            if (sprite_index == spr_dw_church_hall_door_nobg)
                depth += 10;
            if (sprite_index == spr_cc_fountainbg)
                depth += 10;
        }
    }
}
if (scr_debug())
{
    if (keyboard_check(ord("1")))
    {
        debug_print("intro");
        global.plot = 0;
    }
    if (keyboard_check(ord("2")))
    {
        debug_print("coming back for the end");
        global.plot = 242;
        with (obj_mainchara)
            setxy(40, 212);
        with (obj_caterpillarchara)
            setxy(obj_mainchara.x, obj_mainchara.y);
        scr_caterpillar_interpolate("all");
    }
}
var fadetime = 0;
if (global.plot < 231)
    fadetime = 60;
if (global.plot < 231)
{
    global.plot = 231;
    scr_setparty(1);
    con = 9;
    scr_delay_var("con", 10, 2);
    global.facing = 0;
    with (scr_marker_ext(camerax() - 20, cameray() - 20, spr_pxwhite, 660, 500, undefined, undefined, c_black, 0))
    {
        scr_lerpvar("image_alpha", 1.2, 0, fadetime, 2, "out");
        scr_doom(id, fadetime + 1);
    }
    with (obj_persistentfadein)
        instance_destroy();
}
doorchange = false;
if (global.plot >= 234)
    doorchange = true;
scr_musicer("alt_church_lobby.ogg", undefined, undefined, undefined, fadetime);
if (global.plot >= 240)
{
    con = 40;
    scr_setparty(1, 1);
    if (scr_debug())
    {
    }
    for (var i = 0; i < array_length(glass); i++)
    {
        with (glass[i])
        {
            if (x > 400 || y > 240)
            {
                var block = instance_create(x, y, obj_solidblocksized);
                scr_sizeexact(sprite_width, sprite_height, block);
                instance_destroy();
            }
        }
    }
    with (obj_savepoint)
        instance_destroy();
}
