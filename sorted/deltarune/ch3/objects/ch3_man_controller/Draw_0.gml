var xx = camerax();
var yy = cameray();
if (movestep == 90)
{
    if (camtimer == 1)
    {
        scr_lerpvar("curtain1y", 0, 242, 14);
        scr_lerpvar("curtain2y", 480, 238, 14);
    }
    if (camtimer == 20)
    {
        scr_lerpvar("curtain1y", 242, 0, 14);
        scr_lerpvar("curtain2y", 238, 480, 14);
    }
    draw_set_color(curtaincolor);
    ossafe_fill_rectangle(xx, yy, xx + 640, yy + curtain1y, 0);
    ossafe_fill_rectangle(xx, yy + curtain2y, xx + 640, yy + 480, 0);
    draw_set_color(c_white);
}
if (binocon == 2)
{
    draw_set_color(c_black);
    ossafe_fill_rectangle(xx - 20, yy - 20, xx + 640 + 20, yy + 480 + 20, 0);
    draw_set_color(c_white);
    draw_sprite_ext(spr_man_grass, 0, (xx + 320) - sprite_get_width(spr_man_grass), (yy + 240) - sprite_get_height(spr_man_grass), 2, 2, 0, c_white, 1);
}
