if (scr_debug())
{
    var xx = 0;
    var yy = 0;
    draw_set_colour(c_white);
    draw_set_font(fnt_main);
    with (obj_mike_combo)
    {
    }
    if (action > 0 && !display_hits && phase >= 1 && action < 16)
    {
    }
    if (display_hits)
    {
        ii = 1;
        for (i = 1; i < 15; i++)
        {
            if (name[i] != "")
            {
                if (action == i)
                    draw_set_color(c_yellow);
                else
                    draw_set_color(c_gray);
                draw_text(camerax() + 160 + xx, 8 + yy, string(i) + ".  " + string(name[i]) + ": " + string(hits[i]));
                yy += 12;
                ii += 1;
            }
        }
    }
}
if (phase == 0 && global.use_mic && !global.right_click_mic)
{
    var mx = 100;
    var my = 0;
    var mwidth = 440;
    var mheight = 100;
    draw_set_halign(fa_center);
    draw_set_colour(c_white);
    draw_set_font(scr_84_get_font("main"));
    draw_text(camerax() + mx + (mwidth / 2), cameray() + my + 30, stringsetloc("Adjust Sensitivity", "obj_micmenu_slash_Draw_0_gml_213_0"));
    var ly = cameray() + my + (mheight / 2) + 32;
    var lw = point_distance(camerax() + mx + 96, 0, (camerax() + mx + mwidth) - 96, 0);
    var lx = camerax() + mx + 96 + (lw * (global.mic_sensitivity / 4));
    draw_set_colour(c_dkgray);
    d_triangle(camerax() + mx + 86, ly, (camerax() + mx + mwidth) - 96, ly, (camerax() + mx + mwidth) - 96, ly - 16, 0);
    var _str = "";
    draw_set_colour(c_white);
    ossafe_fill_rectangle(lx - 2, ly - 24, lx + 2, ly + 8, 0);
}
draw_sprite_ext(spr_dog_dance, dog_ind, camerax() + dog_x, cameray() + 32, dog_xs, 1, 0, c_white, 1);
dog_ind += 0.5;
dog_t += 1;
if (dog_t > 120)
{
    dog_xs = -dog_xs;
    dog_t = 0;
}
if (action > 14)
    dog_x = scr_approach(dog_x, -100, 2);
counter -= 1;
if (counter > 0)
{
    if (instance_number(obj_mike_combo) == 1)
    {
        draw_set_alpha(0.5);
        draw_set_colour(merge_colour(c_red, c_black, counter / 60));
        var sz = 90;
        if (obj_mike_combo.phase == 1)
            sz = 60;
        if (flash)
            ossafe_fill_rectangle(x - sz, 0, x + sz, cameray() + cameraheight(), 0);
    }
    else
    {
        draw_set_alpha(0.5);
        draw_set_colour(merge_colour(c_red, c_black, counter / paw_reload));
        var w = obj_mike_controller.line_width;
        if (pawtype == 1)
        {
            if (flash)
            {
                ossafe_fill_rectangle(x - w, 0, x - 30, cameray() + cameraheight(), 0);
                ossafe_fill_rectangle(x + w, 0, x + 30, cameray() + cameraheight(), 0);
            }
        }
        else if (instance_number(obj_mike_combo) == 1)
        {
            if (flash)
                ossafe_fill_rectangle(x - 90, 0, x + 90, cameray() + cameraheight(), 0);
        }
        else if (flash)
        {
            ossafe_fill_rectangle(x - 60, 0, x + 60, cameray() + cameraheight(), 0);
        }
    }
    draw_set_alpha(1);
}
