if (global.chapter == 3)
{
    if (room == room_board_2)
    {
        if (con == 1)
        {
            rhx = 132;
            rhy = 142;
            rspr = 1;
            con = 2;
        }
        if (con == 2)
        {
            rhx = lerp(rhx, 130, 0.25);
            rhy = lerp(rhy, 84, 0.25);
        }
        if (con == 3)
        {
            rhx = lerp(rhx, 124, 0.25);
            rhy = lerp(rhy, 44, 0.25);
        }
        if (con == 10)
        {
            rhx = 82;
            rhy = 90;
            rspr = 5;
            con = 11;
        }
        if (con == 11)
            rhy = lerp(rhy, 106, 0.25);
        if (con == 15)
        {
            rhx = 140;
            rhy = 84;
            rspr = 7;
            lhx = 24;
            lhy = 84;
            lspr = 6;
        }
        if (con == 20)
        {
            rhx = lerp(rhx, 120, 0.25);
            lhx = lerp(lhx, 44, 0.25);
            rhy = lerp(rhy, 94, 0.25);
            lhy = lerp(lhy, 94, 0.25);
        }
        if (con == 25)
        {
            lhx = 999;
            rhx = 82;
            rhy = 94;
            rspr = 5;
        }
        if (con == 30)
            rhy = lerp(rhy, 114, 0.25);
        if (con == 35)
        {
            lhx = 68;
            lhy = 114;
            lspr = 0;
            rhx = 92;
            rspr = 4;
            con = 36;
        }
        if (con == 36)
        {
            rhx = lerp(rhx, 130, 0.25);
            rhy = lerp(rhy, 84, 0.25);
            lhx = lerp(lhx, 38, 0.25);
            lhy = lerp(lhy, 84, 0.25);
        }
        if (con == 40)
        {
            lspr = 2;
            rhx = lerp(rhx, 136, 0.25);
            rhy = lerp(rhy, 74, 0.25);
            lhx = lerp(lhx, 32, 0.25);
            lhy = lerp(lhy, 74, 0.25);
        }
        if (con == 45)
        {
            lspr = 6;
            rspr = 7;
            rhx = lerp(rhx, 148, 0.25);
            rhy = lerp(rhy, 94, 0.25);
            lhx = lerp(lhx, 20, 0.25);
            lhy = lerp(lhy, 94, 0.25);
        }
        if (con == 50)
        {
            timer++;
            rhx = lerp(rhx, 104, 0.25);
            rhy = lerp(rhy, 104, 0.25);
            lhx = lerp(lhx, 64, 0.25);
            lhy = lerp(lhy, 104, 0.25);
            if (timer == 6)
            {
                con = 51;
                timer = 0;
            }
        }
        if (con == 51)
        {
            lhx = 999;
            rhx = 82;
            rhy = 106;
            rspr = 5;
        }
        if (con == 55)
        {
            lhx = 999;
            rhx = 999;
        }
        if (con == 60)
        {
            rhx = 82;
            rhy = 106;
            rspr = 5;
            con = 61;
        }
        if (con == 70)
            rhy = lerp(rhy, 116, 0.25);
        if (con == 80)
            instance_destroy();
    }
}
if (i_ex(obj_face) && global.fc == 18)
{
    var _left = 44;
    var _top = 22;
    var _width = 200;
    var _height = 126;
    if (!surface_exists(clip_surface))
        clip_surface = surface_create(_width, _height);
    surface_set_target(clip_surface);
    draw_clear_alpha(c_black, 0);
    draw_sprite_ext(spr_rouxls_facehands, rspr, scr_even(rhx) - _left, scr_even(rhy) - _top, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_rouxls_facehands, lspr, scr_even(lhx) - _left, scr_even(lhy) - _top, 2, 2, 0, c_white, 1);
    surface_reset_target();
    draw_surface(clip_surface, _left, _top);
}
