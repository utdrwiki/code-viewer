if (i_ex(obj_climb_kris) && i_ex(obj_rotating_tower_controller_new))
{
    if (obj_climb_kris.visible == 0)
        exit;
    depth = startdepth;
    with (obj_climb_mover)
    {
        if (con == 2)
        {
            other.depth = 1000;
            var tower = 1010;
            var adjustment = 0;
            var _tilex = (x / tower.tile_width_fine) + adjustment;
            if (_tilex > (tower.horizontaltilecount - 1))
                _tilex -= (tower.horizontaltilecount - 1);
            if (_tilex < 0)
                _tilex += (tower.horizontaltilecount - 1);
            var xoff = x % tower.tile_width_fine;
            if (tower.tile_vis[_tilex] == 1)
                draw_sprite_ext(sprite_index, image_index, tower.tower_x + xoff + tower.tile_x[_tilex], y, (tower.tile_xscale[_tilex] / tower.tile_width_fine) * image_xscale, image_yscale, 0, tower.tile_color[_tilex], 1);
            break;
        }
    }
    with (obj_rotating_tower_controller_new)
    {
        var _alph;
        if (obj_climb_kris.jumpchargecon)
        {
            var count = obj_climb_kris.jumpchargeamount;
            px = obj_climb_kris.x;
            py = obj_climb_kris.y;
            found = 0;
            for (reticle_i = 1; reticle_i < (count + 1); reticle_i++)
            {
                if (obj_climb_kris.dir == 0)
                    py = obj_climb_kris.y + (40 * reticle_i);
                if (obj_climb_kris.dir == 1)
                    px = obj_climb_kris.x + (40 * reticle_i);
                if (obj_climb_kris.dir == 2)
                    py = obj_climb_kris.y - (40 * reticle_i);
                if (obj_climb_kris.dir == 3)
                    px = obj_climb_kris.x - (40 * reticle_i);
                if (px < 0)
                    px += tower_circumference;
                if (px >= tower_circumference)
                    px -= tower_circumference;
                with (obj_climb_kris)
                {
                    if (place_meeting(other.px, other.py, obj_climb_climbable))
                        other.found = other.reticle_i;
                }
            }
            _alph = clamp(obj_climb_kris.jumpchargetimer / 14, 0.1, 0.8);
            px = obj_climb_kris.x;
            if (appearance == 1)
                px += 40;
            py = obj_climb_kris.y - 20;
            var _tilex = px / tile_width_fine;
            var _tiley = py / tile_height_fine;
            if (_tilex >= horizontaltilecount)
                _tilex -= horizontaltilecount;
            if (_tilex < 0)
                _tilex += horizontaltilecount;
            var angle = 0;
            var xoff = 0;
            var yoff = 0;
            var shiftX = 0;
            var shiftY = 0;
            if (obj_climb_kris.dir == 0)
            {
                angle = 0;
                xoff = -22;
                yoff = 18;
                shiftY = 1;
            }
            if (obj_climb_kris.dir == 1)
            {
                angle = 90;
                xoff = 18;
                yoff = 22;
                shiftX = 1;
            }
            if (obj_climb_kris.dir == 2)
            {
                angle = 180;
                xoff = 22;
                yoff = -18;
                shiftY = -1;
            }
            if (obj_climb_kris.dir == 3)
            {
                angle = 270;
                xoff = -18;
                yoff = -22;
                shiftX = -1;
            }
            var col = 8388736;
            var startArray = [0, 21, 41];
            var widthArray = [21, 20, 21];
            var totalStartX = (tower_x + tile_x[_tilex] + xoff) - 20;
            var totalWidth = (obj_climb_kris.jumpchargetimer / obj_climb_kris.chargetime2) * 62;
            count = 3;
            var divisor = 120;
            if (obj_rotating_tower_controller_new.appearance == 1)
            {
                count = 6;
                startArray = [0, 11, 21, 31, 41, 51];
                widthArray = [11, 10, 10, 10, 10, 11];
            }
            for (subsection = 0; subsection < count; subsection++)
            {
                var tilex = _tilex + ((subsection + 1) * shiftX);
                var tiley = _tiley + ((subsection + 1) * shiftY);
                if (tilex >= horizontaltilecount)
                    tilex -= horizontaltilecount;
                if (tilex < 0)
                    tilex += horizontaltilecount;
                if (tile_vis[tilex] == 0)
                    continue;
                var scaleMultiplier = tile_xscale[tilex] / tile_width_fine;
                var sourceX = startArray[subsection];
                var sourceWidth = widthArray[subsection];
                col = obj_climb_kris.reticle_hint_col_inactive;
                if (found)
                    col = obj_climb_kris.reticle_hint_col_active;
                var jankfix = 0;
                if (subsection == (count - 1) && tile_width_fine != tile_width && shiftX == -1)
                    jankfix = (6 * (shiftX - 1)) / 2;
                draw_sprite_general(spr_climb_reticle_hint, floor(current_time * 0.5) % 4, 0, sourceX, 22, clamp(totalWidth - sourceX, 0, sourceWidth), totalStartX - jankfix, py + yoff + 20 + (subsection * shiftY * (divisor / count)), 2, scaleMultiplier * -2, angle, col, col, col, col, _alph * 0.85);
                totalStartX += (scaleMultiplier * shiftX * sourceWidth * -2);
            }
        }
        var tempalpha = 1;
        if (global.inv > 0)
            tempalpha = 0.5;
        draw_sprite_ext(obj_climb_kris.sprite_index, obj_climb_kris.image_index, krisx - camerax(), krisy, obj_climb_kris.image_xscale, obj_climb_kris.image_yscale, obj_climb_kris.image_angle, obj_climb_kris.image_blend, tempalpha);
        if (obj_climb_kris.flashcon == 1)
        {
            obj_climb_kris.flashsiner += obj_climb_kris.flashspeed;
            d3d_set_fog(true, c_white, 0, 1);
            draw_sprite_ext(obj_climb_kris.sprite_index, obj_climb_kris.image_index, krisx - camerax(), krisy, obj_climb_kris.image_xscale, obj_climb_kris.image_yscale, obj_climb_kris.image_angle, obj_climb_kris.image_blend, tempalpha);
            d3d_set_fog(false, c_black, 0, 0);
            if (obj_climb_kris.flashsiner > 4 && sin(obj_climb_kris.flashsiner / 3) < 0)
            {
                obj_climb_kris.flashcon = 0;
                obj_climb_kris.flashsiner = 0;
            }
        }
        if (obj_climb_kris.jumpchargecon && found > 0)
        {
            px = obj_climb_kris.x;
            if (appearance == 1)
                px += 40;
            py = obj_climb_kris.y - 20;
            if (obj_climb_kris.dir == 0)
                py += (tile_height * found);
            if (obj_climb_kris.dir == 1)
                px += (tile_width * found);
            if (obj_climb_kris.dir == 2)
                py -= (tile_height * found);
            if (obj_climb_kris.dir == 3)
                px -= (tile_width * found);
            var _tilex = px / tile_width_fine;
            var _tiley = py / tile_height_fine;
            if (_tilex >= horizontaltilecount)
                _tilex -= horizontaltilecount;
            if (_tilex < 0)
                _tilex += horizontaltilecount;
            var col = merge_color(c_yellow, c_white, 0.4 + (sin(obj_climb_kris.jumpchargetimer / 3) * 0.4));
            if (tile_vis[_tilex] == 1)
                draw_sprite_ext(spr_climb_reticle, 0, tower_x + tile_x[_tilex], py, (tile_xscale[_tilex] / tile_width_fine) * 2, 2, 0, col, _alph);
        }
    }
}
with (obj_rotating_tower_controller_new)
{
    with (obj_bell_small_playable)
    {
        var _tilex = x / other.tile_width_fine;
        if (_tilex > (other.horizontaltilecount - 1))
            _tilex -= (other.horizontaltilecount - 1);
        if (_tilex < 0)
            _tilex += (other.horizontaltilecount - 1);
        var xscale = 2;
        var xx = other.tower_x + (other.tile_x[_tilex] * 1.25);
        var col = other.tile_color[_tilex];
        if (other.tile_vis[_tilex] == 1)
        {
            draw_sprite_ext(spr_pxwhite, 0, xx, y, xscale, -bellcordlength, 0, #B4D6CA, 1);
            draw_sprite_ext(spr_whitegradientdown_40, 0, xx, y - bellcordlength - (40 * bellcordfadelength), xscale / 40, bellcordfadelength, 0, #B4D6CA, 1);
            draw_sprite_ext(sprite_index, image_index, xx, y, xscale, 2, 0, col, 1);
        }
    }
}
