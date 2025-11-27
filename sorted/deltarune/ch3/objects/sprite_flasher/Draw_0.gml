if (!init)
{
    if (fade_in == 0)
    {
        con = 1;
        image_alpha = 1;
    }
    init = true;
}
if (con == 0)
{
    image_alpha = timer / fade_in;
    timer++;
    if (timer >= fade_in)
    {
        timer = 0;
        con++;
    }
}
else if (con == 1)
{
    image_alpha = 1;
    if (timer >= lifetime)
    {
        if (fade_out == 0)
        {
            con = 3;
        }
        else
        {
            timer = fade_out;
            con++;
        }
    }
}
else if (con == 2)
{
    image_alpha = timer / fade_out;
    timer--;
    if (timer <= 0)
        con = 3;
}
else if (con == 3)
{
    instance_destroy();
}
if (target != -4 && i_ex(target))
{
    d3d_set_fog(true, color, 0, 1);
    with (target)
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, other.image_alpha);
    d3d_set_fog(false, c_black, 0, 0);
}
