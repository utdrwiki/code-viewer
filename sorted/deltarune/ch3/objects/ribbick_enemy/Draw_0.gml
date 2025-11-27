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
    draw_rectangle_color(camerax() + 240, cameray() + 290, (camerax() + 240 + 180) - (blowtimer * 1.8), cameray() + 300, c_aqua, c_aqua, c_aqua, c_aqua, 0);
    draw_sprite_ext(spr_poppup_hourglass, 0, camerax() + 240, cameray() + 295, 2, 2, 0, c_white, image_alpha);
    d3d_set_fog(true, c_white, 0, 0);
    if (button3_p() == 1)
        draw_sprite_ext(spr_poppup_hourglass, floor((clocktimer / 10) * 7), camerax() + 240, cameray() + 295, 2, 2, 0, c_white, 0.4);
    d3d_set_fog(false, c_white, 0, 0);
}
