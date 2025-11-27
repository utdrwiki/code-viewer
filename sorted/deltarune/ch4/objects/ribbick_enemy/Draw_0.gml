xoff = 0;
animsiner += 1;
if (blown == 1)
    image_xscale = 2;
if (image_xscale < 2)
    xoff = (originalwidth - sprite_width) / 2;
blowanimtimer--;
if (blowanimtimer > 6)
{
    if (onoff == 2)
        onoff = 0;
    if (onoff == 1.5)
        onoff = 2;
    if (onoff == 0.5)
        onoff = 1;
    if (onoff == 0)
    {
        ashake = -shakeamt;
        onoff = 0.5;
    }
    if (onoff == 1)
    {
        ashake = shakeamt;
        if (shakeamt > 0)
            shakeamt -= 1;
        onoff = 1.5;
    }
    if (blown)
    {
        if (amirabbick)
        {
            if (image_xscale > 1.5)
                draw_sprite_ext(spr_rabbick_enemy_spared, 0, x + xoff + ashake, y, image_xscale, image_yscale, 0, c_white, 1);
            else
                draw_sprite_ext(spr_rabbick_enemy_spared, 1, (x + xoff + ashake) - 8, y, image_xscale + 0.5, image_yscale, 0, c_white, 1);
        }
        else if (image_xscale > 1.5)
        {
            draw_sprite_ext(spr_ribbick_small, 0, x + xoff + ashake, y, image_xscale, image_yscale, 0, c_white, 1);
        }
        else
        {
            draw_sprite_ext(spr_ribbick_small, 1, (x + xoff + ashake) - 8, y, image_xscale + 0.5, image_yscale, 0, c_white, 1);
        }
    }
    else if (image_xscale > 1.5)
    {
        draw_sprite_ext(spr_ribbick_hurt2, 0, x + xoff + ashake, y, image_xscale, image_yscale, 0, c_white, 1);
    }
    else
    {
        draw_sprite_ext(spr_ribbick_hurt2, 1, (x + xoff + ashake) - 8, y, image_xscale + 0.5, image_yscale, 0, c_white, 1);
    }
}
else
{
    scr_enemy_drawhurt_generic();
    scr_enemy_drawidle_generic(0.1);
    if (becomeflash == 0)
        flash = 0;
    becomeflash = 0;
}
if (acting == 101)
{
    clocktimer++;
    if (clocktimer > 11)
        clocktimer = 11;
    draw_circle_pie(camerax() + 330, cameray() + 160, 100, 100, 8421504, 40, 1);
    draw_circle_pie(camerax() + 330, cameray() + 160, 1 - ((clocktimer - 1) / 10), 1, merge_color(c_white, c_gray, 0.3), 40, 1);
    if (1.1 == (clocktimer / 10))
    {
        draw_set_font(fnt_mainbig);
        draw_set_halign(fa_center);
        draw_text_transformed_color(camerax() + 330, cameray() + 142, "PRESS", 1, 1, 0, c_black, c_black, c_black, c_black, 1);
        draw_set_font(fnt_main);
        draw_set_halign(fa_left);
    }
}
