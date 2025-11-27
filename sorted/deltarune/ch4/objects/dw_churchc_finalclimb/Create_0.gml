con = -1;
customcon = 0;
timer = 0;
init = 0;
siner = 0;
wobble = 0;
kris_down_face = true;
layer_set_visible("DEBUG_ASSETS", 0);
if (scr_debug())
{
    scr_setparty(1, 1, 0);
    if (keyboard_check(ord("P")))
    {
    }
}
glassrows = [];
glasslayers = [];
glassshakerows = [];
with (obj_border_controller)
    show_border();
if (global.plot < 245)
{
    con = 0;
    camera_y_pos = 0;
    camera_y_target = 2000;
    camera_y_cache = 0;
    glasslayer = layer_get_id("TOWER");
    glassrows_unsorted = layer_get_all_elements(layer_get_id("TOWER"));
    array_sort(glassrows_unsorted, function(arg0, arg1)
    {
        return -(layer_sprite_get_y(arg0) - layer_sprite_get_y(arg1));
    });
    var _glasstiles = array_length(glassrows_unsorted);
    var _column = 0;
    var _tile = 0;
    for (var i = 0; i < 14; i++)
    {
        glassrows[i] = [];
        glassheights[i] = layer_sprite_get_y(glassrows_unsorted[_tile]);
        glasslayers[i] = layer_create(layer_get_depth(glasslayer) + 1);
        var _cols = (i > 8) ? 6 : 5;
        for (var j = 0; j < _cols; j++)
        {
            array_push(glassrows[i], glassrows_unsorted[_tile++]);
            layer_element_move(glassrows[i][j], glasslayers[i]);
        }
        array_sort(glassrows[i], function(arg0, arg1)
        {
            return layer_sprite_get_x(arg0) - layer_sprite_get_x(arg1);
        });
    }
    glasscrackedrows = array_create(array_length(glassrows), 0);
    
    glass_row_crack = function(arg0)
    {
        if (glasscrackedrows[arg0] == 0)
        {
            glasscrackedrows[arg0] = 1;
            var _cols = (arg0 > 8) ? 6 : 5;
            for (var i = 0; i < _cols; i++)
            {
                var _glass = glassrows[arg0][i];
                var _shift = sprite_get_number(layer_sprite_get_sprite(_glass)) / 2;
                layer_sprite_index(_glass, layer_sprite_get_index(_glass) + _shift);
            }
        }
    };
    
    glass_row_shatter = function(arg0, arg1 = true, arg2 = 20)
    {
        var _cols = (arg0 > 8) ? 6 : 5;
        for (var i = 0; i < _cols; i++)
        {
            var _glass = glassrows[arg0][i];
            if (layer_sprite_exists(glasslayers[arg0], _glass))
                glass_tile_shatter(_glass, false, arg2);
        }
        if (arg1)
        {
            var snd = snd_play_complex(0, 0, undefined);
            snd_add_complex(snd, 0, 236, 0.6, 0.7, 1, -1, 0);
            snd_add_complex(snd, 3, 269, 0.7, 0.95, -1, -1, 0);
        }
    };
    
    glass_row_shake = function(arg0)
    {
        array_push(glassshakerows, arg0);
    };
    
    glass_tile_shatter = function(arg0, arg1 = true, arg2 = 20)
    {
        if (arg1)
        {
            var snd = snd_play_complex(0, 0, undefined);
            snd_add_complex(snd, 0, 236, 0.6, 0.7, 1, -1, 0);
            snd_add_complex(snd, 3, 269, 0.7, 0.95, -1, -1, 0);
        }
        var _glassx = layer_sprite_get_x(arg0);
        var _glassy = layer_sprite_get_y(arg0);
        var _glass_sprite = layer_sprite_get_sprite(arg0);
        var _glass_index = layer_sprite_get_index(arg0);
        var _glass_depth = layer_get_depth(layer_get_element_layer(arg0));
        var _shatter_sprite = -1;
        if (_glass_sprite == 2781)
        {
            switch (_glass_index)
            {
                case 0:
                case 5:
                default:
                    _shatter_sprite = 5306;
                    break;
                case 1:
                case 6:
                    _shatter_sprite = 1684;
                    break;
                case 2:
                case 7:
                    _shatter_sprite = 4499;
                    break;
                case 3:
                case 8:
                    _shatter_sprite = 4899;
                    break;
                case 4:
                case 9:
                    _shatter_sprite = 4155;
                    break;
            }
        }
        if (_glass_sprite == 4987)
        {
            switch (_glass_index)
            {
                case 0:
                case 6:
                default:
                    _shatter_sprite = 586;
                    break;
                case 1:
                case 7:
                    _shatter_sprite = 4274;
                    break;
                case 2:
                case 8:
                    _shatter_sprite = 5386;
                    break;
                case 3:
                case 9:
                    _shatter_sprite = 2968;
                    break;
                case 4:
                case 10:
                    _shatter_sprite = 2348;
                    break;
                case 5:
                case 11:
                    _shatter_sprite = 1738;
                    break;
            }
        }
        var _fragments = sprite_get_number(_shatter_sprite);
        for (var i = 0; i < _fragments; i++)
        {
            with (instance_create_depth(_glassx + choose(2, -2), _glassy + choose(2, -2), _glass_depth, obj_marker_fancy))
            {
                sprite_index = _shatter_sprite;
                image_index = i;
                image_xscale = 2;
                image_yscale = 2;
                direction = random(360);
                image_speed = 0;
                timer = 0;
                mydelay = arg2;
                
                step_func = function()
                {
                    timer++;
                    if (timer == mydelay)
                    {
                        gravity = 0.5 + random(0.1);
                        friction = 0;
                        speed = 2;
                    }
                    if (y > (ystart + 480) || timer >= 120)
                        instance_destroy();
                };
            }
        }
        layer_sprite_destroy(arg0);
    };
    
    wall_cover = scr_dark_marker(236, 2200, spr_blank_tile_black);
    with (wall_cover)
    {
        image_xscale = 4.2;
        image_yscale = 3;
        depth = 999990;
        visible = 0;
    }
    jackenstein = instance_create(210, 2600, obj_ch4_DCC00_jackenstein);
    with (jackenstein)
    {
        scr_depth();
        visible = 0;
        sprite_index = spr_jackenstein_walk_up;
    }
    sword_controller = instance_create(0, 0, obj_ch4_DCC00_sword);
    sword_controller_b = instance_create(0, 0, obj_ch4_DCC00_sword);
    sword_controller_c = instance_create(0, 0, obj_ch4_DCC00_sword);
    recruit_version = scr_get_total_recruits(4) > 0 && scr_flag_get(1580) == 0;
    cup_stack = -4;
    cup_top_y_pos = 0;
    cup_bottom_y_pos = 0;
    if (recruit_version)
    {
        cup_stack = instance_create(290, 2360, obj_ch4_DCC00_cupstack);
        with (cup_stack)
            visible = 0;
        cup_top_y_pos = cup_stack.y - cup_stack.get_total_height();
        cup_bottom_y_pos = 2000;
    }
}
else
{
    var tower_block = instance_create(240, 2240, obj_solidblockDark);
    with (tower_block)
        image_xscale = 4;
    var tower_cover = scr_dark_marker(200, 1960, spr_blank_tile_black);
    with (tower_cover)
    {
        depth = 999990;
        image_yscale = 8;
        image_xscale = 6;
    }
    recruit_version = scr_get_total_recruits(4) > 0 && scr_flag_get(1580) == 0;
    cup_stack = -4;
    cup_top_y_pos = 0;
    cup_bottom_y_pos = 0;
    if (recruit_version)
    {
        var base_y = 1920;
        cup_stack = instance_create(290, base_y + 360, obj_ch4_DCC00_cupstack);
        cup_stack.cutscene_mode = false;
        cup_top_y_pos = cup_stack.y - cup_stack.get_total_height();
        cup_bottom_y_pos = 2000;
        var cup_readable = instance_create(280, base_y + 360, obj_readable_room1);
        with (cup_readable)
        {
            extflag = "cup_stack";
            image_xscale = 4;
        }
        var cup_block = instance_create(240, base_y + 340, obj_solidblockDark);
        with (cup_block)
            image_xscale = 4;
    }
}
