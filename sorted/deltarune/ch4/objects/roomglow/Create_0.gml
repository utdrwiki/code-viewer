glow = 0;
stretch = 3;
min_stretch = 0.5;
xoff = 0;
yoff = 2;
transition_length = 30;
tint = 16726314;
auto_color = false;
highlight_color = 16764994;
polarize = true;
depth = 700000;
shadow_kill = false;
init = false;
lerper = 1;
old_state = false;
strength = 0;
active = false;
stayactive = -1;
actind = 0;
lerpstrength = 0.125;
fall_timer = 0;
falling = false;
shadows = true;
tiles_only = false;
fadeparallax = true;

create_highlight = function(arg0, arg1 = true, arg2 = true, arg3 = 0)
{
    var daddy = id;
    with (arg0)
    {
        if (arg2)
        {
            var _shadow = instance_create(x, y, obj_floorshadow);
            _shadow.target = id;
            _shadow.yoff = arg3;
            if (object_index == obj_mainchara)
                _shadow.name = "kris";
            else if (object_index == obj_caterpillarchara || object_index == obj_actor)
                _shadow.name = name;
            with (_shadow)
            {
                stretch = daddy.actind * 2;
                image_alpha = daddy.actind;
            }
        }
        if (arg1)
        {
            var _highlight_col = -1;
            if (!other.auto_color)
                _highlight_col = other.highlight_color;
            var _highlight = scr_sprhighlight(id, _highlight_col);
            _highlight.darkness = 1;
            _highlight.image_alpha = daddy.actind;
        }
    }
    exit;
};

layerarray = layer_get_all();
shelvesinit = 0;
sprite_array_size = -1;
legendmarker = [];
var legendmarkerdepth = layer_get_depth("LEGEND_MARKERS");
if (layer_exists("LEGEND_MARKERS"))
{
    for (var i = 0; i < array_length(layerarray); i++)
    {
        if (layer_get_name(layerarray[i]) == "LEGEND_MARKERS")
        {
            elements = layer_get_all_elements(layerarray[i]);
            for (var j = 0; j < array_length(elements); j++)
            {
                if (layer_get_element_type(elements[j]) == 4)
                {
                    sprite_array_size++;
                    legendmarker[sprite_array_size] = instance_create(layer_sprite_get_x(elements[j]), layer_sprite_get_y(elements[j]), obj_marker);
                    legendmarker[sprite_array_size].sprite_index = layer_sprite_get_sprite(elements[j]);
                    legendmarker[sprite_array_size].image_xscale = layer_sprite_get_xscale(elements[j]);
                    legendmarker[sprite_array_size].image_yscale = layer_sprite_get_yscale(elements[j]);
                    with (legendmarker[sprite_array_size])
                    {
                        depth = legendmarkerdepth;
                        image_blend = c_black;
                        image_alpha = 0;
                    }
                    layer_sprite_destroy(elements[j]);
                }
            }
        }
        if (layer_get_name(layerarray[i]) == "LEGEND_MARKERS_FG")
        {
            elements = layer_get_all_elements(layerarray[i]);
            for (var j = 0; j < array_length(elements); j++)
            {
                if (layer_get_element_type(elements[j]) == 4)
                {
                    sprite_array_size++;
                    legendmarker[sprite_array_size] = instance_create(layer_sprite_get_x(elements[j]), layer_sprite_get_y(elements[j]), obj_marker);
                    legendmarker[sprite_array_size].sprite_index = layer_sprite_get_sprite(elements[j]);
                    legendmarker[sprite_array_size].image_xscale = layer_sprite_get_xscale(elements[j]);
                    legendmarker[sprite_array_size].image_yscale = layer_sprite_get_yscale(elements[j]);
                    with (legendmarker[sprite_array_size])
                    {
                        depth = 5000;
                        image_blend = c_black;
                        image_alpha = 0;
                    }
                    layer_sprite_destroy(elements[j]);
                }
            }
        }
    }
}
if (instance_exists(obj_dw_churchb_bellroom))
{
    targdepth = obj_dw_churchb_bellroom.depth - 1;
    var bgmark = scr_marker_ext(0, 0, spr_pxwhite, room_width, room_height, undefined, undefined, c_black, targdepth);
    array_push(legendmarker, bgmark);
}
if (tiles_only)
{
}
if (room == room_dw_churchc_superprophecies)
    shadows = false;
