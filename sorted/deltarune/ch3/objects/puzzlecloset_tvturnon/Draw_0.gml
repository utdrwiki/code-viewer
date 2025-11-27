if (view_current == 0)
{
    if (turnon == 1)
    {
        turnon = 2;
        con = 1;
        scr_lerpvar("timer", 1, 0, 30, -1, "out");
        scr_doom(id, 40);
    }
    draw_sprite_ext(spr_pxwhite, 0, x, y, width, height, 0, merge_color(c_white, c_black, timer), timer);
    draw_sprite_ext(spr_pxwhite, 0, x, y, width, (height / 2) * timer, 0, c_black, timer * 2);
    draw_sprite_ext(spr_pxwhite, 0, x, y + height, width, -(height / 2) * timer, 0, c_black, timer * 2);
    draw_sprite_ext(spr_pxwhite, 0, x, y + ((height / 2) * timer), width, 2, 0, c_white, timer / 4);
    draw_sprite_ext(spr_pxwhite, 0, x, (y + height) - ((height / 2) * timer), width, 2, 0, c_white, timer / 4);
    if (turnon == 0)
        draw_sprite_ext(spr_pxwhite, 0, x, y, width, height, 0, merge_color(c_white, c_black, timer), timer);
}
