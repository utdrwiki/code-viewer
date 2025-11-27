if (rising == 1)
{
    timer++;
    if ((timer % 12) == 0)
    {
        if (!finishrising)
        {
            barcount++;
            if (barcount == 52)
                snd_play(snd_bell);
            debug_message("barcount=" + string(barcount));
            if (barcount < 50)
            {
                var bgbar = scr_board_marker(board_tilex(0), board_tiley(-8), spr_pxwhite);
                with (bgbar)
                {
                    depth = other.depth;
                    image_xscale = 384;
                    image_yscale = 32;
                    image_blend = #161616;
                    vspeed = other.myspeed;
                    extflag = "bar";
                }
                scr_doom(bgbar, doomtime);
            }
        }
        if (finishrising == 1)
        {
            finishrising = 2;
            rising = 10;
            timer = 0;
        }
    }
}
if (rising > 0)
    draw_sprite_ext(spr_pxwhite, 0, x - 8, board_tiley(0), 208, 256, 0, c_black, 1);
draw_self_board();
if (drawlight)
{
    var lx = (x + 150) - 2;
    var ly = (y + 84) - 2;
    lx += ((max(0, 49) % 5) * 4);
    ly -= (floor(max(49, 0) / 5) * 4);
    var amt = abs(sin(timer / 15) * 0.5);
    draw_sprite_ext(spr_pxwhite, 0, lx + 0, ly + 0, 2, 2, 0, c_yellow, 1);
    draw_sprite_ext(spr_pxwhite, 0, lx - 2, ly + 0, 2, 2, 0, c_yellow, amt);
    draw_sprite_ext(spr_pxwhite, 0, lx + 2, ly + 0, 2, 2, 0, c_yellow, amt);
    draw_sprite_ext(spr_pxwhite, 0, lx + 0, ly + 2, 2, 2, 0, c_yellow, amt);
    draw_sprite_ext(spr_pxwhite, 0, lx + 0, ly - 2, 2, 2, 0, c_yellow, amt);
    lx = (x + 150) - 2;
    ly = (y + 84) - 2;
    lx += ((max(0, barcount - 3) % 5) * 4);
    ly -= (floor(max(barcount - 3, 0) / 5) * 4);
    amt = abs(sin(timer / 15) * 0.5);
    draw_sprite_ext(spr_pxwhite, 0, lx + 0, ly + 0, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_pxwhite, 0, lx - 2, ly + 0, 2, 2, 0, c_white, amt);
    draw_sprite_ext(spr_pxwhite, 0, lx + 2, ly + 0, 2, 2, 0, c_white, amt);
    draw_sprite_ext(spr_pxwhite, 0, lx + 0, ly + 2, 2, 2, 0, c_white, amt);
    draw_sprite_ext(spr_pxwhite, 0, lx + 0, ly - 2, 2, 2, 0, c_white, amt);
}
if (open)
{
    var linecolor = #6C6C6C;
    draw_sprite_ext(spr_pxwhite, 0, x + 64, (y + 160) - 4, 64, 68, 0, linecolor, 1);
    draw_sprite_ext(spr_pxwhite, 0, x + 64 + 4, (y + 160) - 4, 56, 68, 0, c_black, 1);
}
