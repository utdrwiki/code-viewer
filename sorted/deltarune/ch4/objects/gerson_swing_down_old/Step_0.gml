timer++;
if (timer > 3 && sprite_index == spr_gerson_swing_down)
    image_index += 0.5;
if (timer == 5)
    snd_play(motor_upper_quick_mid);
if (timer == 7)
    snd_play(motor_swing_down);
if (sprite_index == spr_gerson_swing_down && image_index > 3.5)
{
    sprite_index = spr_gerson_swing_down_loop;
    image_index = 0;
    image_speed = 0;
}
if (sprite_index == spr_gerson_swing_down && image_index > 1.5 && con == 0)
{
    con = 1;
    y += 40;
    vspeed = 45;
    friction = 7;
}
if (con == 1 && vspeed < 12)
{
    friction = 2;
    image_alpha -= 0.2;
    if (image_alpha < 0)
        instance_destroy();
}
if (y > (cameray() + cameraheight()))
    instance_destroy();
if (fakeout == 1 && sprite_index == spr_gerson_swing_down && image_index >= 2.5)
{
    gers = instance_create(x + 56, y + 108, obj_gerson_teleport);
    instance_destroy();
}
