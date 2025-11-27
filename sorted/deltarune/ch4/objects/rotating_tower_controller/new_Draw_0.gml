var camy = cameray();
var render_ypos = round(camy / tile_height_fine);
var render_ypos_start = render_ypos - 1;
var render_ypos_end = render_ypos + 25;
if (render_ypos_start < 0)
    render_ypos_start = 0;
if (render_ypos_end > verticaltilecount)
    render_ypos_end = verticaltilecount;
tower_x += tower_xshake;
tower_y += tower_yshake;
if (scr_debug() && sunkus_kb_check_pressed(49))
{
    var cx = 0;
    var cy = 0;
    for (tmidx = 0; tmidx < tileset_count; tmidx++)
    {
        var exportsurface = surface_create(tile_width_fine * horizontaltilecount, tile_width_fine * verticaltilecount);
        surface_set_target(exportsurface);
        for (var ii = 0; ii < verticaltilecount; ii++)
        {
            for (i = 0; i < horizontaltilecount; i++)
            {
                var offset = 0;
                if (appearance == 1)
                    offset = 10;
                var xx = (tile_width_fine * i) + offset;
                var yy = (tile_width_fine * ii) + offset;
                var col = 16777215;
                var pos = xy(i, ii);
                if (tile_index[pos][tmidx] > 0)
                {
                    var t = tile_index[pos][tmidx];
                    var idx = tile_get_index(t);
                    var yflip = 1;
                    var rotation = 0;
                    var xscale = 1;
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
                    draw_sprite_ext(tile_sprite[pos][tmidx], idx, xx, yy, xscale, yflip, rotation, col, 1);
                }
            }
        }
        surface_save(exportsurface, string(tmidx) + "surfaceexport.png");
        surface_reset_target();
        surface_free(exportsurface);
    }
}
var indent;
if (appearance == 1)
{
    if (!surface_exists(tilesurface))
        tilesurface = surface_create(640, 480);
    surface_set_target(tilesurface);
    draw_clear_alpha(c_black, 0);
    var cx = camerax();
    var cy = camy;
    var len = array_length(backface_indices);
    var statictile = 4388;
    var statictilecount = 2;
    var staticyoffset = 760;
    if (i_ex(obj_dw_churchc_titanclimb2))
    {
        statictile = 1557;
        statictilecount = 3;
        staticyoffset = 320;
    }
    for (i = 0; i < len; i++)
    {
        var k = backface_indices[i];
        var xx = ((tower_x - tower_xshake) + tile_x[k] + (tile_xscale[k] * 0.5)) - cx;
        for (j = 0; j < statictilecount; j++)
        {
            if ((render_ypos_start * 20) <= (staticyoffset + (2560 * (j + 1))) && (render_ypos_end * 20) >= (staticyoffset + (2560 * j)))
                draw_sprite_ext(statictile, k + (44 * j), xx, (tower_ystart - cy) + staticyoffset + (2560 * j), (tile_xscale[k] / -tile_width_fine) * 2, 2, 0, c_dkgray, 1);
        }
    }
    len = array_length(valid_tile_indices);
    for (i = 0; i < array_length(len); i++)
    {
        var pos = valid_tile_indices[i];
        var k = pos % horizontaltilecount;
        var ii = floor(pos / horizontaltilecount);
        if (tile_vis[k] == 2 && ii >= render_ypos_start && ii <= render_ypos_end)
        {
            col = tile_color[k];
            var xx = (tower_x - tower_xshake) + tile_x[k] + (tile_xscale[k] * 0.5);
            var yy = (tile_height_fine * ii) + tower_ystart + 10;
            if (tile_index[pos][0] > 0)
                obj_rotating_tower_controller_new.draw_tilemap_tile(k, xx - cx, yy - cy, col, pos, 0);
        }
    }
    surface_reset_target();
    shader_set(shd_fakedepth);
    shader_set_uniform_f(u_extents, 0.21812);
    shader_set_uniform_f(u_centerx, 0.5 + (tower_xshake / 640));
    draw_surface(tilesurface, cx + tower_xshake, cy);
    shader_reset();
    indent = 0.98;
    shader_set(shd_fountaineffect);
    shader_set_uniform_f(u_iTime, current_time / 250);
    shader_set_uniform_f(u_iPosOffset, tower_angle / 360, camy / 480);
    shader_set_uniform_f(u_iResolution, tower_radius * 2 * indent, 480);
    shader_set_uniform_f(u_uvs, s_uvs[0], s_uvs[1], s_uvs[2] - s_uvs[0], s_uvs[3] - s_uvs[1]);
    var col = scr_make_color_hsv(current_time / 400, 50, (sin(current_time / 1600) * 10) + 70);
    draw_sprite_ext(bg_fountain1, 0, tower_x - (tower_radius * indent), camera_get_view_y(view_camera[0]), (tower_radius * 2 * indent) / sprite_get_width(bg_fountain1), 480 / sprite_get_height(bg_fountain1), 0, col, 1);
    shader_reset();
    obj_rotating_tower_controller_new.render_big_eye(625);
    obj_rotating_tower_controller_new.render_big_eye(1332);
    surface_set_target(tilesurface);
    draw_clear_alpha(c_black, 0);
    len = array_length(visible_indices);
    for (i = 0; i < len; i++)
    {
        var k = visible_indices[i];
        col = tile_color[k];
        var xx = ((tower_x - tower_xshake) + tile_x[k] + (tile_xscale[k] * 0.5)) - cx;
        for (j = 0; j < statictilecount; j++)
        {
            if ((render_ypos_start * 20) <= (staticyoffset + (2560 * (j + 1))) && (render_ypos_end * 20) >= (staticyoffset + (2560 * j)))
                draw_sprite_ext(statictile, k + (44 * j), xx, (tower_ystart - cy) + staticyoffset + (2560 * j), (tile_xscale[k] / -tile_width_fine) * 2, 2, 0, col, 1);
        }
    }
    len = array_length(valid_tile_indices);
    for (i = 0; i < len; i++)
    {
        var pos = valid_tile_indices[i];
        var k = pos % horizontaltilecount;
        var ii = floor(pos / horizontaltilecount);
        if (tile_vis[k] == 1 && ii >= render_ypos_start && ii <= render_ypos_end)
        {
            col = tile_color[k];
            var xx = (tower_x - tower_xshake) + tile_x[k] + (tile_xscale[k] * 0.5);
            var yy = (tile_height_fine * ii) + tower_ystart + 10;
            for (tmidx = 0; tmidx < tileset_count; tmidx++)
            {
                if (tile_index[pos][tmidx] > 0)
                    obj_rotating_tower_controller_new.draw_tilemap_tile(k, xx - cx, yy - cy, col, pos, tmidx);
            }
        }
    }
    surface_reset_target();
    shader_set(shd_fakedepth);
    shader_set_uniform_f(u_extents, 0.2148, 0.218);
    shader_set_uniform_f(u_centerx, 0.5 + (tower_xshake / 640));
    draw_surface(tilesurface, cx + tower_xshake, cy);
    shader_reset();
}
else if (use_tilesets)
{
    var cx = 0;
    var cy = 0;
    var statictile = -4;
    var statictilecount = 2;
    var staticyoffset = 760;
    if (i_ex(obj_dw_churchb_rotatingtower))
    {
        statictile = 1664;
        statictilecount = 2;
        staticyoffset = 0;
    }
    if (statictile != -4)
    {
        len = array_length(visible_indices);
        for (i = 0; i < len; i++)
        {
            var k = visible_indices[i];
            var col = tile_color[k];
            var xx = ((tower_x - tower_xshake) + tile_x[k] + (tile_xscale[k] * 0.5)) - cx;
            for (j = 0; j < statictilecount; j++)
            {
                if ((render_ypos_start * tile_width_fine) <= (staticyoffset + (2560 * (j + 1))) && (render_ypos_end * tile_height_fine) >= (staticyoffset + (2560 * j)))
                    draw_sprite_ext(statictile, k + (horizontaltilecount * j), xx, (tower_ystart - cy) + staticyoffset + (2560 * j), (tile_xscale[k] / -tile_width_fine) * 2, 2, 0, col, 1);
            }
        }
    }
    var len = array_length(valid_tile_indices);
    for (i = 0; i < len; i++)
    {
        var pos = valid_tile_indices[i];
        var k = pos % horizontaltilecount;
        var ii = floor(pos / horizontaltilecount);
        if (tile_vis[k] == 1 && ii >= render_ypos_start && ii <= render_ypos_end)
        {
            var col = tile_color[k];
            var xx = (tower_x - tower_xshake) + tile_x[k] + (tile_xscale[k] * 0.5);
            var yy = (tile_height_fine * ii) + tower_ystart + 10;
            for (tmidx = 0; tmidx < tileset_count; tmidx++)
            {
                if (tile_index[pos][tmidx] > 0)
                    obj_rotating_tower_controller_new.draw_tilemap_tile(k, xx - cx, yy - cy, col, pos, tmidx);
            }
        }
    }
}
else
{
    for (var ii = render_ypos_start; ii < render_ypos_end; ii++)
    {
        for (i = 0; i < horizontaltilecount; i++)
        {
            if (tile_vis[i] == 1 && (appearance != 2 || tile_sprite[xy(i, ii)][0] != spr_nothing))
            {
                var pos = xy(i, ii);
                draw_sprite_ext(tile_sprite[pos][0], tile_index[pos][0], tower_x + tile_x[i] + tile_xscale[i], (tile_height_fine * ii) + tower_ystart, tile_xscale[i] / -tile_width_fine, 1, 0, tile_color[i], 1);
                var xoffset = 0;
                if (tile_sprite[pos][1] != spr_nothing && tile_vis[i] == 1)
                    draw_sprite_ext(tile_sprite[pos][1], tile_index[pos][1], tower_x + tile_x[i] + tile_xscale[i], (tile_height_fine * ii) + tower_ystart, tile_xscale[i] / -tile_width_fine, 1, 0, tile_color[i], 1);
            }
        }
    }
}
var cull_top = render_ypos_start * other.tile_height_fine;
var cull_bottom = render_ypos_end * other.tile_height_fine;
var xscale_scaled = 1 / tile_width_fine;
with (obj_climb_obstacle)
{
    if ((y + sprite_height) < cull_top || y > cull_bottom)
        continue;
    if (object_index == obj_climb_water)
    {
        var _tilex = (scr_even(x + drawx) * xscale_scaled) + 1;
        if (_tilex > (other.horizontaltilecount - 1))
            _tilex -= (other.horizontaltilecount - 1);
        else if (_tilex < 0)
            _tilex += (other.horizontaltilecount - 1);
        if (other.tile_vis[_tilex] == 1)
            draw_sprite_ext(spr_pxteal_40, image_index, other.tower_x + other.tile_x[_tilex], scr_even(y + drawy), other.tile_xscale[_tilex] / other.tile_width_fine, height / 40, 0, other.tile_color[_tilex], 0.8);
    }
    else if (object_index == obj_climb_setpathenemy)
    {
        var adjustment = -260;
        if (other.appearance == 1)
            adjustment = -520;
        var __tile_angle = lerp(360, 0, (x + adjustment) / other.tower_circumference);
        var tile_angle1 = __tile_angle + other.tower_angle;
        while (tile_angle1 > 360)
            tile_angle1 -= 360;
        if (tile_angle1 < 0)
            tile_angle1 += 360;
        if (!(tile_angle1 > 350 || tile_angle1 <= 170))
            continue;
        var __tile_x = lengthdir_x(other.tower_radius, tile_angle1);
        var tile_angle2 = tile_angle1 + other.tile_angle_difference;
        if (tile_angle2 > 360)
            tile_angle2 -= 360;
        else if (tile_angle2 < 0)
            tile_angle2 += 360;
        var __tile_xscale = lengthdir_x(other.tower_radius, tile_angle2) - __tile_x;
        var __tile_yscale = other.tile_width_fine;
        if ((angle % 180) == 90)
        {
            __tile_yscale = __tile_xscale;
            __tile_xscale = other.tile_width_fine;
        }
        __tile_xscale /= other.tile_width_fine;
        __tile_yscale /= other.tile_width_fine;
        var __tile_color = merge_color(c_white, c_gray, abs(__tile_x + (__tile_xscale / 2)) / 190);
        draw_sprite_ext(sprite_index, current_time % 2, other.tower_x + shakex + __tile_x, y + 20, __tile_xscale, __tile_yscale, angle, __tile_color, image_alpha);
    }
    else if (object_index == obj_climb_enemy)
    {
        var _tilex = (x * xscale_scaled) + 1;
        if (_tilex > (other.horizontaltilecount - 1))
            _tilex -= (other.horizontaltilecount - 1);
        else if (_tilex < 0)
            _tilex += (other.horizontaltilecount - 1);
        if (other.tile_vis[_tilex] == 1)
            draw_sprite_ext(sprite_index, image_index, other.tower_x + shakex + other.tile_x[_tilex], y - 20, other.tile_xscale[_tilex] / other.tile_width_fine, 1, 0, other.tile_color[_tilex], 1);
    }
    else if (object_index == obj_climb_eyewaterenemy)
    {
        var adjustment = 1;
        if (other.appearance == 1)
            adjustment = 3;
        var xx = x;
        if (xx >= 830)
            xx -= 20;
        var _tilex = (xx * xscale_scaled) + adjustment;
        if (_tilex > (other.horizontaltilecount - 1))
            _tilex -= (other.horizontaltilecount - 1);
        else if (_tilex < 0)
            _tilex += (other.horizontaltilecount - 1);
        if (other.tile_vis[_tilex] == 1)
            draw_sprite_ext(sprite_index, image_index, other.tower_x + shakex + (other.tile_x[_tilex] * indent), y, (other.tile_xscale[_tilex] / other.tile_width_fine) * indent, 1, 0, other.tile_color[_tilex], 1);
    }
    else if (object_index == obj_climb_waterbucket)
    {
        var _tilex = (x * xscale_scaled) + 1;
        if (_tilex > (other.horizontaltilecount - 1))
            _tilex -= (other.horizontaltilecount - 1);
        else if (_tilex < 0)
            _tilex += (other.horizontaltilecount - 1);
        if (other.tile_vis[_tilex] == 1)
        {
            draw_sprite_ext(sprite_index, image_index, other.tower_x + other.tile_x[_tilex], y, (other.tile_xscale[_tilex] * 2) / other.tile_width_fine, 2.2, 0, other.tile_color[_tilex], 1);
            if (drawwater > 0)
            {
                var spr = 279;
                draw_sprite_ext(spr, sprite_get_number(spr) - (drawwater / 3), other.tower_x + other.tile_x[_tilex], y, (other.tile_xscale[_tilex] * 2) / other.tile_width_fine, 2.2, 0, other.tile_color[_tilex], 1);
            }
        }
    }
    else if (object_index == obj_climb_watergenerator)
    {
        var _tilex = (x * xscale_scaled) + 1;
        if (_tilex > (other.horizontaltilecount - 1))
            _tilex -= (other.horizontaltilecount - 1);
        else if (_tilex < 0)
            _tilex += (other.horizontaltilecount - 1);
        if (other.tile_vis[_tilex] == 1)
        {
            draw_sprite_ext(spr_climb_waterbucket, image_index, other.tower_x + other.tile_x[_tilex], y, (other.tile_xscale[_tilex] * 2) / other.tile_width_fine, -2, 0, other.tile_color[_tilex], 1);
            if (drawwater > 0)
            {
                var spr = 279;
                draw_sprite_ext(spr, sprite_get_number(spr) - (drawwater / 3), other.tower_x + other.tile_x[_tilex], y, (other.tile_xscale[_tilex] * 2) / other.tile_width_fine, 2.2, 0, other.tile_color[_tilex], 1);
            }
        }
    }
    else if (object_index != obj_climbstarter && object_index != obj_climb_immobileeye && object_index != obj_climb_mover && object_index != obj_climb_enemyspawner && object_index != obj_climb_enemykiller && object_index != obj_climb_susie && object_index != obj_climb_evilgrowth)
    {
        var adjustment = 1;
        if (other.appearance == 1)
            adjustment = 3;
        var _tilex = (x * xscale_scaled) + adjustment;
        if (_tilex > (other.horizontaltilecount - 1))
            _tilex -= (other.horizontaltilecount - 1);
        else if (_tilex < 0)
            _tilex += (other.horizontaltilecount - 1);
        if (other.tile_vis[_tilex] == 1)
            draw_sprite_ext(sprite_index, image_index, other.tower_x + other.tile_x[_tilex], y, other.tile_xscale[_tilex] / other.tile_width_fine, 1, 0, other.tile_color[_tilex], 1);
    }
}
with (obj_oflash_tower)
{
    var _tilex = (x * xscale_scaled) + 1;
    if (_tilex > (other.horizontaltilecount - 1))
        _tilex -= (other.horizontaltilecount - 1);
    else if (_tilex < 0)
        _tilex += (other.horizontaltilecount - 1);
    var _xoff = x % other.tile_width_fine;
    siner += flashspeed;
    if (other.tile_vis[_tilex] == 1)
    {
        d3d_set_fog(true, c_white, 0, 1);
        draw_sprite_ext(sprite_index, image_index, other.tower_x + other.tile_x[_tilex] + _xoff, y, other.tile_xscale[_tilex] / other.tile_width_fine, 1, 0, other.tile_color[_tilex], sin(siner / 3));
        d3d_set_fog(false, c_black, 0, 0);
    }
}
with (obj_afterimage_cut_half_tower)
{
    var _tilex = (x * xscale_scaled) + 1;
    if (_tilex > (other.horizontaltilecount - 1))
        _tilex -= (other.horizontaltilecount - 1);
    else if (_tilex < 0)
        _tilex += (other.horizontaltilecount - 1);
    siner++;
    if (other.tile_vis[_tilex] == 1)
    {
        var _x = (other.tower_x + other.tile_x[_tilex]) - 20;
        if (flash)
        {
            d3d_set_fog(true, c_white, 0, 1);
            d3d_set_fog(false, c_black, 0, 0);
            flash = false;
            exit;
        }
        var _xscale = 1;
        var _yscale = 1;
        var hw = width / 2;
        var hh = height / 2;
        var m = lerp_ease_out(0, sprite_height / 2, (siner + 2) / 10, 1);
        image_alpha -= faderate;
        draw_sprite_part_ext(sprite_index, image_index, 0, 0, hw * 2, hh, _x - (width / 2), y - m - ((yo * _yscale) / 2), _xscale, image_yscale, image_blend, image_alpha);
        draw_sprite_part_ext(sprite_index, image_index, 0, hh, hw * 2, hh, _x - (width / 2), (y + m) - ((yo * _yscale) / 2), _xscale, image_yscale, image_blend, image_alpha);
    }
    if (image_alpha < 0)
        instance_destroy();
}
with (obj_rotating_bullet_new)
    enabled = (y + sprite_height) >= cull_top && y <= cull_bottom;
with (obj_climb_setpathenemy)
{
    if (tower_cull_y == -4)
        enabled = (camy + 480 + 100) < y;
    else
        enabled = (camy + 480 + 100) < tower_cull_y;
}
if (appearance == 0)
{
    draw_sprite_ext(spr_whitegradientdown_40, 0, (tower_x - tower_radius) + tile_width, tower_y + 400, -verticaltilecount, 1, 270, c_black, 0.6 * col_blend);
    draw_sprite_ext(spr_whitegradientdown_40, 0, (tower_x + tower_radius) - tile_width, tower_y + 400, verticaltilecount, 1, 90, c_black, 0.6 * col_blend);
}
tower_x -= tower_xshake;
tower_y -= tower_yshake;
