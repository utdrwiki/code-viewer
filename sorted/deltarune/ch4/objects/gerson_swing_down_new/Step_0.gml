timer++;
if (timer == 2)
    image_index = 1;
if (timer > 10)
    depth = -999999;
if (timer == (timetoswing - telegraphtime))
    eye_con = 1;
if (timer > timetoswing && sprite_index == spr_gerson_swing_down_new)
    image_index += 0.5;
if (i_ex(obj_sound_of_justice_enemy))
{
    if (timer == 5 || timer == 7 || timer == 9)
    {
        _ripple = instance_create(x + 0, y + 40, obj_church_old_man_ripple_effect);
        _ripple.type = 2;
        _ripple.color = merge_color(c_red, c_black, 0);
        _ripple.colorstart = 255;
        _ripple.version = 1;
        _ripple.depth = depth + 1;
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
if (sprite_index == spr_gerson_swing_down_new && image_index > 4.5)
{
    sprite_index = spr_gerson_swing_down_loop_new;
    image_index = 0;
    image_speed = 0;
}
if (sprite_index == spr_gerson_swing_down_new && image_index > 2.5 && con == 0)
{
    active = 1;
    con = 1;
    speed = 50;
    friction = 10;
    if (image_angle == 45 || image_angle == 135 || image_angle == 225 || image_angle == 315)
        friction = 6.5;
}
if (con == 1 && speed < 12)
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
