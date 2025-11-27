var adjustment = 0;
if (i_ex(obj_rotating_tower_controller_new) && obj_rotating_tower_controller_new.appearance == 1)
    adjustment = 40;
var xx = x + adjustment;
var yy = y;
var xscale = 2;
var yscale = 2;
if (i_ex(obj_rotating_tower_controller_new))
{
    with (obj_rotating_tower_controller_new)
    {
        var _tilex = (xx / tile_width_fine) + 1;
        if (_tilex > (horizontaltilecount - 1))
            _tilex -= horizontaltilecount;
        if (_tilex < 0)
            _tilex += horizontaltilecount;
        var _tiley = other.y / tile_width_fine;
        xx = tower_x + tile_x[_tilex];
        xscale = (tile_xscale[_tilex] * 2) / tile_width_fine;
        if (tile_vis[_tilex] != 1)
            exit;
    }
}
if (watertype == 2)
{
    var topy = clamp(yy + drawy, ystart, endy);
    var boty = clamp((yy - 40) + (image_yscale * 40) + drawy, ystart, endy);
    var maxalpha = 1;
    if (boty >= endy)
    {
        var extratimer = (totaltimer - ((tilelimit + 2) * moverate)) * 2;
        boty += extratimer;
        maxalpha -= clamp(extratimer * 0.025, 0, 1);
    }
    var blend = clamp((boty - topy) / 50, 0, maxalpha);
    var merge = merge_color(c_black, c_white, blend);
    var mergeA = lerp(0, 1, blend);
    draw_sprite_ext(spr_climb_eyewater_new_loop, 0, xx, topy, xscale * 0.5, (boty - topy) / 200, 0, merge, mergeA);
    draw_sprite_ext(spr_climb_eyewater_new_end, 0, xx, boty, xscale * 0.5, 1, 0, merge, mergeA);
    var drawcollision = true;
    if (drawcollision)
    {
    }
}
else if (watertype == 1)
{
    var watcol = 15317774;
    var topy = clamp(yy + drawy, ystart + 10, endy);
    var boty = clamp((yy - 40) + (image_yscale * 40) + drawy, ystart + 20, endy);
    var alph = clamp(animindex + (sin(animindex * 4) * 0.25), 0, 0.8);
    animindex += 0.25;
    col[0] = 15313408;
    col[1] = 15313408;
    col[2] = 15317774;
    col[3] = 15313408;
    col[4] = 15381248;
    var colindex = floor(animindex) % 4;
    watcol = col[colindex];
    var offset = -8;
    if (ending)
    {
        offset = 0;
        alph *= clamp((boty - topy) / 20, 0, 1);
    }
    draw_set_blend_mode(bm_add);
    draw_sprite_ext(spr_dw_church_watertile_top, colindex, xx, topy, xscale, 2, 0, c_white, alph);
    draw_sprite_ext(spr_pxwhite, 0, xx, topy, 20 * xscale, (boty - topy) + offset, 0, watcol, alph);
    if (!ending)
        draw_sprite_ext(spr_dw_church_watertile_top, colindex, xx, boty - 8, xscale, -2, 0, c_white, alph);
    draw_set_blend_mode(bm_normal);
    var drawcollision = false;
    if (drawcollision)
    {
        if (abs(boty - topy) > 20)
            ossafe_fill_rectangle(xx + 8, topy + 8, (xx + 40) - 8, boty - 8, 1);
    }
}
