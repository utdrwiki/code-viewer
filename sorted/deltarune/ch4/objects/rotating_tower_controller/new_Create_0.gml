depth = 1000100;
tower_falls_apart_i = 0;
tower_falls_apart_con = 0;
tower_falls_apart_timer = 0;
tower_angle_add = 0;
tower_falls_apart_i_dog = 0;
tower_falls_apart_timer_dog = 0;
fall_speed = 0;
fall_speed_dog = 0;
fall_limit_min = 0;
valid_tile_indices = [];
instance_create_depth(0, 0, depth - 5, obj_rotating_kris_controller_new);
u_iTime = shader_get_uniform(shd_fountaineffect, "iTime");
u_iPosOffset = shader_get_uniform(shd_fountaineffect, "iPosOffset");
u_iResolution = shader_get_uniform(shd_fountaineffect, "iResolution");
u_uvs = shader_get_uniform(shd_fountaineffect, "uvs");
s_uvs = sprite_get_uvs(bg_fountain1, 0);
u_extents = shader_get_uniform(shd_fakedepth, "iExtents");
u_centerx = shader_get_uniform(shd_fakedepth, "iCenterX");
tilesurface = surface_create(640, 480);
endclimb = false;
endclimbtimer = 0;
tower_x = 320;
tower_y = 0;
player_starting_y = 320;
destroy_climbstarter = true;
turnobjectsintotilevariants = true;
tiledefaultclimbable = false;
cull_objects = false;
tile_dark_color = 8421504;
if (appearance == 1)
    tile_dark_color = make_color_rgb(5, 5, 5);
if (appearance == 1)
{
    scr_losechar();
    bgsiner = 0;
    siner = 100;
    colcol = 0;
    hscroll = 0;
    eyebody = 1;
    nowcolor = c_lime;
}
if (room == room_rotating_tower_new_test)
    tiledefaultclimbable = true;
if (room == room_dw_churchb_rotatingtower || instance_exists(obj_dw_churchb_rotatingtower))
{
    tower_x = 780;
    verticaltilecount = 93;
}
if (room == room_dw_churchb_rotatingtower2 || instance_exists(obj_dw_churchb_rotatingtower2))
{
    tower_x = 1600;
    verticaltilecount = 191;
}
if (room == room_dw_church_dogclimb || instance_exists(obj_tower_dog_controller))
    verticaltilecount = 215;
col_blend = 1;
visible_indices = [];
backface_indices = [];
tower_xshake = 0;
tower_yshake = 0;
tower_angle_prev = -1;
tower_angle_prev2 = -1;
tile_width = 40;
tile_height = 40;
tile_width_fine = tile_width;
tile_height_fine = tile_height;
if (appearance == 1)
{
    tile_width_fine = tile_width * 0.5;
    tile_height_fine = tile_height * 0.5;
}
tower_height = verticaltilecount * tile_height_fine;
tower_radius = tower_width / 2;
tower_circumference = (2 * pi) * tower_radius;
tower_ystart = tower_y;
tower_y_prev = tower_y;
maincharayprevious = obj_mainchara.y;
towertype = 0;
timer = 0;
angle_extra = 0;
checkdamagefloor = 0;
krisx = 0;
krisy = 0;
kristilex = 1;
kristiley = 1;
px = 0;
py = 0;
reticle_i = 0;
found = 0;
i = 0;
ii = 0;
dodraw = false;

obj_rotating_tower_controller_new.xy = function(arg0, arg1)
{
    return (arg1 * horizontaltilecount) + arg0;
};

tower_circumference = round(tower_circumference);
if ((tower_circumference % tile_width_fine) != 0)
{
    repeat (tile_width_fine)
    {
        tower_circumference++;
        if ((tower_circumference % tile_width_fine) == 0)
            break;
    }
    tower_radius = tower_circumference / (2 * pi);
    tower_width = tower_radius * 2;
}
horizontaltilecount = tower_circumference / tile_width_fine;
tile_angle_difference = 360 / horizontaltilecount;
var default_tile = 5180;
if (tiledefaultclimbable)
    default_tile = 2715;
if (appearance == 2)
    default_tile = 4168;
var a = 16;
var _index = 0;
var _b = 0;
if (appearance == 1)
{
    use_background_map = true;
    use_collision_map = true;
    use_tilesets = true;
}
if (use_tilesets)
{
    for (tmidx = 0; tmidx < tileset_count; tmidx++)
    {
        var layer_id = layer_get_id(tileset_name + string(tmidx + 1));
        layer_set_visible(layer_id, false);
        tm_tileset[tmidx] = scr_layer_tilemap_get_id_fixed(layer_id);
    }
}
if (use_collision_map)
{
    var collision_id = layer_get_id(collision_name);
    layer_set_visible(collision_id, false);
    tm_collision = scr_layer_tilemap_get_id_fixed(collision_id);
}
var tileset = 3604;
if (appearance == 1)
    tileset = 5101;
for (ii = 0; ii < verticaltilecount; ii++)
{
    if (use_collision_map)
    {
        for (i = 0; i <= 22; i++)
        {
            var idx = tilemap_get_at_pixel(tm_collision, (i * tile_width) + 1, (ii * tile_height) + 1);
            if (idx > 0)
                instance_create((i - 1) * tile_width, ii * tile_height, obj_climb_climbable);
        }
    }
    for (i = a; i < (horizontaltilecount + a + 1); i++)
    {
        tile_x[i - a] = 0;
        tile_angle[i - a] = 360 - (i * (360 / horizontaltilecount));
        tile_xscale[i - a] = 1;
        tile_color[i - a] = 16777215;
        if (use_tilesets == 1)
        {
            for (tmidx = 0; tmidx < tileset_count; tmidx++)
            {
                tile_sprite[xy(i - a, ii)][tmidx] = tileset;
                var __index = tilemap_get_at_pixel(tm_tileset[tmidx], ((i - a) * tile_width_fine) + 1, (ii * tile_height_fine) + 1);
                if (__index <= 0)
                {
                    __index = 0;
                    tile_sprite[xy(i - a, ii)][tmidx] = spr_nothing;
                }
                tile_index[xy(i - a, ii)][tmidx] = __index;
                if (__index != 0 && (array_length(valid_tile_indices) == 0 || valid_tile_indices[array_length(valid_tile_indices) - 1] != xy(i - a, ii)))
                    array_push(valid_tile_indices, xy(i - a, ii));
            }
            if (tileset_count == 1)
            {
                tile_sprite[xy(i - a, ii)][1] = spr_nothing;
                tile_index[xy(i - a, ii)][1] = 0;
            }
        }
        else if (appearance != 2)
        {
            if (_b == 0)
                tile_sprite[xy(i - a, ii)][0] = spr_bookshelves_climb1_a2;
            if (_b == 1)
                tile_sprite[xy(i - a, ii)][0] = spr_bookshelves_climb1_b2;
            if (_b == 2)
                tile_sprite[xy(i - a, ii)][0] = spr_bookshelves_climb1_c2;
            if (_b == 3)
                tile_sprite[xy(i - a, ii)][0] = spr_bookshelves_climb1_d2;
            var __index = _index;
            if (__index == 0)
                __index = 2;
            else if (__index == 2)
                __index = 0;
            tile_index[xy(i - a, ii)][0] = __index;
            _index++;
            if (_index == 3)
                _index = 0;
            tile_sprite[xy(i - a, ii)][1] = spr_nothing;
            tile_index[xy(i - a, ii)][1] = 0;
        }
        else
        {
            tile_sprite[xy(i - a, ii)][0] = spr_nothing;
            tile_index[xy(i - a, ii)][0] = 0;
            tile_sprite[xy(i - a, ii)][1] = spr_nothing;
            tile_index[xy(i - a, ii)][1] = 0;
        }
    }
    _index = 0;
    _b++;
    if (_b == 4)
        _b = 0;
}
default_tile = 4084;
if (appearance == 1)
    default_tile = 5408;
if (appearance == 2)
    default_tile = 5546;
eye_sprite_width = sprite_get_width(spr_climb_eyeenemy_noeye);
eye_sprite_height = sprite_get_height(spr_climb_eyeenemy_noeye);

obj_rotating_tower_controller_new.render_big_eye = function(arg0)
{
    var indent = 0.98;
    with (arg0)
    {
        var alpha = 0.12 * image_alpha;
        if (object_index == obj_climb_evilgrowth)
            alpha = 0.75 * image_alpha;
        var camy = cameray();
        if ((y + 400) < camy || (y - 300) > (camy + cameraheight()))
            continue;
        var h = other.eye_sprite_height;
        var adjustment = 0;
        if (other.appearance == 1)
            adjustment = 2;
        var xx = other.eye_sprite_width - 20;
        var w = 20;
        for (i = 0; i < 20; i++)
        {
            var adj = adjustment + i;
            _tilex = (x / other.tile_width_fine) + adj;
            if (_tilex > (other.horizontaltilecount - 1))
                _tilex -= (other.horizontaltilecount - 1);
            if (_tilex < 0)
                _tilex += (other.horizontaltilecount - 1);
            if (other.tile_vis[_tilex] == 1)
                draw_sprite_part_ext(sprite_index, image_index, xx, 0, w, h, other.tower_x + (other.tile_x[_tilex] * indent), y, (other.tile_xscale[_tilex] / other.tile_width_fine) * indent, 1, other.tile_color[_tilex], alpha);
            xx -= 20;
        }
        if (eyetimer == 0)
        {
            adjustment = 0;
            if (other.appearance == 1)
                adjustment = 2;
            var kris = 27;
            var goback = 0;
            if (i_ex(kris))
            {
                if (point_distance(x + (0.5 * h), y + (0.5 * h), kris.x, kris.y) > 640)
                {
                    goback = 1;
                }
                else
                {
                    var dirtokris = point_direction(x + (0.5 * h), y + (0.5 * h), kris.x, kris.y);
                    eyex = lerp(eyex, lengthdir_x(70, dirtokris), 0.25);
                    eyey = lerp(eyey, lengthdir_y(20, dirtokris), 0.25);
                }
            }
            else
            {
                goback = 1;
            }
            if (goback == 1)
            {
                eyex = lerp(eyex, 0, 0.1);
                eyey = lerp(eyey, 0, 0.1);
            }
        }
        var _tilex = (((x + (other.eye_sprite_width * 0.5)) / other.tile_width_fine) + adjustment) - 4;
        if (_tilex > (other.horizontaltilecount - 1))
            _tilex -= (other.horizontaltilecount - 1);
        else if (_tilex < 0)
            _tilex += (other.horizontaltilecount - 1);
        var tile_angle1 = other.tile_angle[_tilex] + (other.tile_angle_difference * (-eyex / other.tile_width_fine)) + other.tower_angle;
        while (tile_angle1 < 0)
            tile_angle1 += 360;
        while (tile_angle1 > 360)
            tile_angle1 -= 360;
        if (tile_angle1 < 207 && tile_angle1 >= 25)
        {
            var x1 = lengthdir_x(other.tower_radius, tile_angle1);
            _tilex = ((x + (other.eye_sprite_width * 0.5)) / other.tile_width_fine) + adjustment + 2;
            if (_tilex > (other.horizontaltilecount - 1))
                _tilex -= (other.horizontaltilecount - 1);
            else if (_tilex < 0)
                _tilex += (other.horizontaltilecount - 1);
            var tile_angle2 = other.tile_angle[_tilex] + (other.tile_angle_difference * (-eyex / other.tile_width_fine)) + other.tower_angle;
            while (tile_angle2 < 0)
                tile_angle2 += 360;
            while (tile_angle2 > 360)
                tile_angle2 -= 360;
            var xscale = lengthdir_x(other.tower_radius, tile_angle2) - x1;
            var xxscale = abs(xscale);
            var color = merge_color(c_white, other.tile_dark_color, other.col_blend * clamp(abs(x1 + (0.5 * xxscale)) / 190, 0, 1));
            var yscale = 1;
            draw_sprite_ext(spr_climb_eyeenemy_eye, 0, other.tower_x + (x1 * 1.05), ((y + (0.5 * h)) - 70) + (eyey * yscale) + 4, xxscale / (6 * other.tile_width_fine), yscale, 0, color, alpha);
        }
    }
};

obj_rotating_tower_controller_new.draw_tilemap_tile = function(arg0, arg1, arg2, arg3, arg4, arg5)
{
    var t = tile_index[arg4][arg5];
    var idx = tile_get_index(t);
    var yflip = 1;
    var rotation = 0;
    var xscale = -tile_xscale[arg0] / tile_width_fine;
    if (tile_get_mirror(t))
        xscale = -xscale;
    if (tile_get_flip(t))
        yflip = -1;
    if (tile_get_rotate(t))
    {
        rotation = -90;
        var yf = yflip;
        yflip *= abs(xscale);
        xscale = sign(xscale);
    }
    draw_sprite_ext(tile_sprite[arg4][arg5], idx, arg1, arg2, xscale, yflip, rotation, arg3, 1);
};

obj_rotating_tower_controller_new.copy_tilemap_image_index = function(arg0, arg1, arg2, arg3)
{
    var changed = 0;
    for (i = 0; i < 2; i++)
    {
        for (ii = 0; ii < 2; ii++)
        {
            var tilex = (arg2 / tile_width_fine) + i;
            var tiley = (arg3 / tile_height_fine) + ii;
            for (tmidx = 0; tmidx < tileset_count; tmidx++)
            {
                var idx = xy(tilex, tiley);
                var ti = tile_index[idx][tmidx];
                tile_index[idx][tmidx] = tilemap_get_at_pixel(tm_tileset[tmidx], arg0 + (tile_width_fine * (i + 2)), arg1 + (tile_height_fine * ii));
                if (tile_index[idx][tmidx] != ti)
                    changed = changed | (i + 1 + (ii * 4));
                if (tile_index[idx][tmidx] < 0)
                {
                    tile_index[idx][tmidx] = 0;
                    tile_sprite[idx][tmidx] = spr_nothing;
                }
                else
                {
                    tile_sprite[idx][tmidx] = spr_rotating_tower_tileset_sliced;
                }
            }
        }
    }
    return changed;
};

obj_rotating_tower_controller_new.set_tilemap_sprite = function(arg0)
{
    var tilex = arg0.x / tile_width_fine;
    var tiley = arg0.y / tile_height_fine;
    for (tmidx = 0; tmidx < tileset_count; tmidx++)
    {
        tile_index[xy(tilex, tiley)][tmidx] = tilemap_get_at_pixel(tm_tileset[tmidx], arg0.x, arg0.y);
        if (tile_index[xy(tilex, tiley)][tmidx] < 0)
        {
            tile_index[xy(tilex, tiley)][tmidx] = 0;
            tile_sprite[xy(tilex, tiley)][tmidx] = spr_nothing;
        }
        else
        {
            tile_sprite[xy(tilex, tiley)][tmidx] = spr_rotating_tower_tileset_sliced;
        }
    }
};

obj_rotating_tower_controller_new.set_tile_sprite = function(arg0, arg1)
{
    if (appearance == 1)
        return set_tilemap_sprite(arg0);
    var tilex = arg0.x / tile_width_fine;
    var tiley = arg0.y / tile_height_fine;
    tile_sprite[xy(tilex, tiley)][0] = arg1;
};

obj_rotating_tower_controller_new.set_tilemap_sprite_ext = function(arg0)
{
    var tilex = arg0.x / tile_width_fine;
    var tiley = arg0.y / tile_height_fine;
    tilex++;
    var xx = 0;
    var yy = 0;
    for (iii = 0; iii < round(arg0.image_yscale); iii++)
    {
        for (iiii = 0; iiii < round(arg0.image_xscale); iiii++)
        {
            var _tilex = tilex + xx;
            var _tiley = tiley + yy;
            if (_tilex > horizontaltilecount)
                _tilex -= horizontaltilecount;
            if (_tilex < 0)
                _tilex += horizontaltilecount;
            for (tmidx = 0; tmidx < tileset_count; tmidx++)
            {
                tile_sprite[xy(_tilex, _tiley)][tmidx] = spr_rotating_tower_tileset_sliced;
                tile_index[xy(_tilex, _tiley)][tmidx] = tilemap_get_at_pixel(tm_tileset[tmidx], _tilex * tile_width_fine, _tiley * tile_height_fine);
                xx++;
                if (tile_index[xy(_tilex, _tiley)][tmidx] == -1)
                {
                    tile_index[xy(_tilex, _tiley)][tmidx] = 0;
                    tile_sprite[xy(_tilex, _tiley)][tmidx] = spr_nothing;
                }
            }
        }
        xx = 0;
        yy++;
    }
};

obj_rotating_tower_controller_new.set_tile_sprite_ext = function(arg0, arg1, arg2)
{
    if (arg2)
        arg0.x -= 40;
    if (use_tilesets && arg2)
        return set_tilemap_sprite_ext(arg0);
    var tilex = arg0.x / tile_width_fine;
    tilex++;
    var tiley = arg0.y / tile_height_fine;
    var xx = 0;
    var yy = 0;
    for (iii = 0; iii < round(arg0.image_yscale); iii++)
    {
        for (iiii = 0; iiii < round(arg0.image_xscale); iiii++)
        {
            var _tilex = tilex + xx;
            var _tiley = tiley + yy;
            if (_tilex > horizontaltilecount)
                _tilex -= horizontaltilecount;
            if (_tilex < 0)
                _tilex += horizontaltilecount;
            tile_sprite[xy(_tilex, _tiley)][0] = arg1;
            if (appearance == 2)
                tile_index[xy(_tilex, _tiley)][0] = 4;
            xx++;
        }
        xx = 0;
        yy++;
    }
};

if (turnobjectsintotilevariants == true)
{
    with (obj_climb_wall)
    {
        var item = self;
        with (obj_rotating_tower_controller_new)
            set_tile_sprite(item, default_tile);
        instance_destroy();
    }
    with (obj_climb_spiketile)
    {
        var item = self;
        with (obj_rotating_tower_controller_new)
            set_tile_sprite(item, spr_climb_spike_2scale);
        instance_destroy();
    }
}
if (appearance == 0)
    default_tile = 2715;
if (appearance == 1)
    default_tile = 5408;
if (appearance != 1)
{
    if (tiledefaultclimbable == false)
    {
        with (obj_climb_climbable)
        {
            x -= 40;
            var item = self;
            with (obj_rotating_tower_controller_new)
                set_tile_sprite_ext(item, default_tile);
            x += 40;
        }
    }
    if (tiledefaultclimbable == true)
    {
        climbable_obj = instance_create(0, 0, obj_climb_climbable);
        climbable_obj.image_xscale = horizontaltilecount;
        climbable_obj.image_yscale = verticaltilecount;
    }
}
climbstarter_obj = instance_create((tower_x + (tower_radius * 0.5)) - (3.5 * tile_width_fine), (tower_y + tower_height) - player_starting_y, obj_climbstarter);
climbstarter_obj.exitmarkerflag = "towerstart";
climbstarter_obj.visible = false;
tower_y = tower_height - player_starting_y;
for (iii = 0; iii < 75; iii += 1)
{
    tower_angle_record[iii] = tower_angle;
    yoffset_record[iii] = tower_y;
}
using_rotating_caterpillars = false;
