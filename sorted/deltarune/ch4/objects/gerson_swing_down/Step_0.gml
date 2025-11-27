timer++;
if (timer > 10)
    depth = -999999;
if (timer == (timetoswing - 12) || (swingdowntype == 0 && timer == (timetoswing - 2)) || (swingdowntype == 1 && timer == (timetoswing - 2)))
    eye_con = 1;
if (timer > timetoswing && sprite_index == spr_gerson_swing_down)
    image_index += 0.5;
if (swingdowntype == -3 && eye_con == 0)
{
    if (timer == 34)
    {
        with (obj_gerson_swing_down)
        {
            eye_con = 1;
            timer = timetoswing - 2;
        }
    }
}
if (swingdowntype == -4)
{
    if (timer == 12)
    {
        with (obj_gerson_swing_down)
        {
        }
    }
    if (timer == 50)
    {
        if (image_xscale > 0)
            instance_create(x + 52, y + 120, obj_gerson_teleport);
        else
            instance_create(x - 52, y + 120, obj_gerson_teleport);
        instance_destroy();
    }
}
if (timer == (timetoswing + 2))
{
    snd_stop(motor_upper_quick_mid);
    snd_play(motor_upper_quick_mid);
}
if (timer == (timetoswing + 5))
{
    snd_stop(motor_swing_down);
    snd_play(motor_swing_down);
}
if (sprite_index == spr_gerson_swing_down && image_index > 3.5)
{
    sprite_index = spr_gerson_swing_down_loop;
    image_index = 0;
    image_speed = 0;
}
if (sprite_index == spr_gerson_swing_down && image_index > 1.5 && con == 0)
{
    active = 1;
    con = 1;
    x += lengthdir_x(30, direction);
    y += lengthdir_y(30, direction);
    speed = 45;
    if (image_angle != 0)
        speed = 30;
    friction = 10;
}
if (con == 1 && vspeed < 12)
{
    friction = 4;
    if (speed < 5)
        speed = 5;
    image_alpha -= 0.2;
    if (image_alpha == 1.2)
    {
        snd_stop(snd_impact);
        snd_play(snd_impact);
    }
    if (image_alpha <= 0.8)
    {
        mask_index = spr_nothing;
        active = 0;
    }
    if (image_alpha < 0)
        instance_destroy();
}
if (swingdowntype == -3 && sprite_index == spr_gerson_swing_down && image_index >= 2)
{
    gers = instance_create(x + lengthdir_x(110, image_angle + 290), y + lengthdir_y(110, image_angle + 290), obj_gerson_teleport);
    gers.image_angle = image_angle;
    instance_destroy();
}
