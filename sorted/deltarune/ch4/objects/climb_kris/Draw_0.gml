var tempalpha = 1;
if (global.inv > 0)
    tempalpha = 0.5;
if (scr_debug())
{
    if (keyboard_check_pressed(ord("V")))
        dodraw = !dodraw;
    if (i_ex(obj_rotating_tower_controller_new))
        dodraw = obj_rotating_tower_controller_new.dodraw;
}
var found = 0;
var _alph;
if (!onrotatingtower && jumpchargecon)
{
    var count = 1;
    if (jumpchargetimer >= chargetime1)
        count = 2;
    if (jumpchargetimer >= chargetime2)
        count = 3;
    var px = x;
    var py = y;
    for (var i = 1; i < (count + 1); i++)
    {
        with (instance_place(px, py, obj_climbstarter))
        {
            if ((other.dir == 2 && e_up) || (other.dir == 0 && e_down) || (other.dir == 3 && e_left) || (other.dir == 1 && e_right))
            {
                found = i;
                break;
            }
        }
        if (dir == 0)
            py = y + (40 * i);
        if (dir == 1)
            px = x + (40 * i);
        if (dir == 2)
            py = y - (40 * i);
        if (dir == 3)
            px = x - (40 * i);
        if (place_meeting(px, py, obj_climb_climbable))
            found = i;
    }
    _alph = clamp(jumpchargetimer / 14, 0.1, 0.8);
    var angle = 0;
    var xoff = 0;
    var yoff = 0;
    if (dir == 0)
    {
        angle = 0;
        xoff = -22;
        yoff = 18;
    }
    if (dir == 1)
    {
        angle = 90;
        xoff = 18;
        yoff = 22;
    }
    if (dir == 2)
    {
        angle = 180;
        xoff = 22;
        yoff = -18;
    }
    if (dir == 3)
    {
        angle = 270;
        xoff = -18;
        yoff = -22;
    }
    var col = reticle_hint_col_inactive;
    if (found)
        col = reticle_hint_col_active;
    draw_sprite_general(spr_climb_reticle_hint, floor(current_time * 0.5) % 4, 0, 0, 22, (jumpchargetimer / chargetime2) * 62, x + xoff, y + yoff, 2, 2, angle, col, col, col, col, 0.85);
}
if (dodraw)
    draw_sprite_ext(sprite_index, image_index, x + drawx, y + drawy + drawoffsety, image_xscale, image_yscale, image_angle, image_blend, tempalpha * image_alpha);
if (scr_debug())
{
    var count = 0;
    var space = 10;
    var border = 8;
}
var drawreticle = true;
if (drawreticle)
{
    if (jumpchargecon)
    {
        if (!onrotatingtower)
        {
            if (found)
            {
                var px = x - 20;
                var py = y - 20;
                if (dir == 0)
                    py += (40 * found);
                if (dir == 1)
                    px += (40 * found);
                if (dir == 2)
                    py -= (40 * found);
                if (dir == 3)
                    px -= (40 * found);
                var col = merge_color(c_yellow, c_white, 0.4 + (sin(jumpchargetimer / 3) * 0.4));
                if (dodraw)
                    draw_sprite_ext(spr_climb_reticle, 0, px + 0, py + 0, 2, 2, 0, col, _alph);
            }
        }
    }
}
