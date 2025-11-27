count++;
if (con == 1 && type > 0)
{
    if ((count % 4) < 3)
        myimage = 5;
    else
        myimage = 6;
    timer++;
    if (timer >= 12)
    {
        con = 2;
        timer = 0;
        if (type == 1)
            myimage = 1;
        if (type == 2)
            myimage = 4;
    }
}
if (con == 2)
{
    timer++;
    if (timer >= 15)
    {
        myimage = 5;
        con = 10;
        timer = statictimer;
    }
}
if (con == 10)
{
    timer++;
    if (timer > statictimer)
    {
        if ((count % 4) < 3)
            myimage = 5;
        else
            myimage = 6;
        if (timer >= (12 + statictimer))
        {
            con = 0;
            timer = 0;
            myimage = 9;
        }
    }
}
if (con == 11)
{
    timer++;
    if (timer > 25)
    {
        con = 0;
        timer = 0;
        myimage = 9;
    }
}
if (con == 20)
{
    con = 21;
    timer = 0;
}
if (myimage == 1 || myimage == 2)
    smiling = 1;
else
    smiling = 0;
draw_sprite_ext(sprite_index, 9, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(sprite_index, myimage, x + round(random_range(-1, 1)), y + round(random_range(-1, 1)), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (con == 21)
{
    timer++;
    draw_sprite_ext_flash(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, c_white, timer / 16);
    draw_sprite_ext_flash(sprite_index, 9, x, y, image_xscale, image_yscale, image_angle, c_white, timer / 16);
    if (timer >= 16)
        instance_destroy();
    if ((count % 4) < 3)
        myimage = 2;
    else
        myimage = 1;
}
