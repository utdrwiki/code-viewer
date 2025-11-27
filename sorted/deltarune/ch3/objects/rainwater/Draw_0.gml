if (instance_exists(obj_growtangle))
{
    for (n = 0; n < sprite_width; n++)
    {
        var tempy = y + (sin(((n - (n % 2)) / 7) + (timer / 3)) * sin(timer / 10) * 2);
        draw_sprite_general(sprite_index, 0, 0, 0, 1, ((obj_growtangle.y + 73) - tempy) / image_yscale, (x - (sprite_width / 2)) + 1 + n, tempy, image_xscale, image_yscale, 0, c_white, c_white, c_white, c_white, 1);
    }
}
