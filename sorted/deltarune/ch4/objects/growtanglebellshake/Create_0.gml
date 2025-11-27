with (obj_growtanglebellshake)
{
    if (id != other.id)
        visible = false;
    else
        visible = true;
}
image_speed = 0;
image_blend = merge_color(c_green, c_lime, 0.5);
shake = 90;
shake_dir = 90;
shake_speed = 75;
splash_x = 0;
splash_y = 0;
splash_alpha = 1;
splash_size = 16;
life_time = 0;
bullet_speed = 2.8 - (clamp(scr_monsterpop() - 1, 0, 2) * 0.6);
if (scr_monsterpop() != 2)
{
    bullet_dir_add = 42;
    bullet_dir = bullet_dir_add * (-0.5 + random(1));
    bullet_number = 4;
}
else
{
    bullet_dir_add = 48;
    bullet_dir = bullet_dir_add * (-0.5 + random(1));
    bullet_number = 3;
}
surface_effect = -1;
