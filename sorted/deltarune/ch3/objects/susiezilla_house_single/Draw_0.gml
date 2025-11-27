var shakeamt = 0;
if (drawshake == 4)
    shakeamt = 4;
if (drawshake == 3)
    shakeamt = -4;
if (drawshake == 2)
    shakeamt = 2;
if (drawshake == 1)
    shakeamt = -2;
drawshake--;
if (myhealth <= 0)
{
    image_blend = c_white;
    smoketimer++;
    if ((smoketimer % 240) == 0)
    {
    }
}
else
{
    image_blend = merge_color(#7D3E46, c_white, myhealth / startinghealth);
}
draw_sprite_ext(sprite_index, image_index, x + shakeamt, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
tenna_index++;
if (i_ex(obj_susiezilla_house_timer))
{
    if (obj_susiezilla_house_timer.timer > 95)
    {
        minitenna_scale += 1;
        minitenna1_x += 20;
        minitenna1_y += 20;
        minitenna2_x -= 20;
        minitenna2_y += 20;
        minitenna3_y += 20;
    }
}
