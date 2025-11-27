if (con == 0)
{
    timer++;
    siner++;
    image_xscale = lerp(0, 2, timer / 10) + (sin(siner / 6) * 0.7);
    image_yscale = lerp(0, 2, timer / 10) + (sin(siner / 6) * 0.7);
    if (timer == 10)
    {
        timer = 0;
        con = 1;
    }
}
if (con == 1)
{
    timer++;
    siner++;
    image_xscale = 2 + (sin(siner / 6) * 0.7);
    image_yscale = 2 + (sin(siner / 6) * 0.7);
    if (timer == 23 || timer == 25 || timer == 27 || timer == 29)
    {
        if (image_index == 0)
            image_index = 1;
        else
            image_index = 0;
    }
    if (timer >= 30)
        laser_xscale = lerp(0, 2, (timer - 30) / 10);
    if (timer == 40)
    {
        timer = 0;
        con = 2;
        if (!audio_is_playing(snd_explosion_mmx3))
            snd_play(snd_explosion_mmx3);
        _angle = angle_position + obj_rotating_tower_controller.tower_angle;
        if (_angle > 360)
            _angle -= 360;
        if (_angle < 0)
            _angle += 360;
        if (_angle >= 0 && _angle < 180)
        {
        }
        else
        {
            hitboxcreated = true;
            hitbox = instance_create(320, (cameray() + cameraheight()) - 90 - obj_rotating_tower_controller.yoffset, obj_vertical_dark_shockwave_hurtbox);
            hitbox.image_xscale = 1;
            hitbox.image_yscale = 100;
            hitbox.angle_position = angle_position;
            hitbox.depth -= 9999999;
            hitbox.image_alpha = 0.5;
        }
    }
}
if (con == 2)
{
    timer++;
    siner += 4;
    image_xscale = 2 + (sin(siner / 6) * 0.7);
    image_yscale = 2 + (sin(siner / 6) * 0.7);
    if (timer == 4 && hitboxcreated == true)
    {
        with (hitbox)
            instance_destroy();
    }
    if (timer == 4)
        hitboxcreated = false;
    if (timer == 1)
    {
    }
    if (timer > 2 && timer < 6)
        laser_xscale = lerp(laser_xscale, 0, (timer - 3) / 5);
    if (timer > 4)
    {
        image_xscale = lerp(image_xscale, 0, (timer - 5) / 5);
        image_yscale = lerp(image_yscale, 0, (timer - 5) / 5);
    }
    if (timer == 10)
        instance_destroy();
}
event_inherited();
var _angle = angle_position + obj_rotating_tower_controller.tower_angle;
if (_angle > 360)
    _angle -= 360;
if (_angle < 0)
    _angle += 360;
var extra_xscale = 0;
if (_angle >= 30 && _angle < 150)
    extra_xscale = 0.8;
if (_angle >= 210 && _angle < 270)
    extra_xscale = lerp(1, 1.3, (_angle - 210) / 60);
else if (_angle >= 270 && _angle < 330)
    extra_xscale = lerp(1.3, 1, (_angle - 270) / 60);
else if (_angle >= 180 && _angle < 360)
    extra_xscale = 1;
if (_angle >= 0 && _angle < 30)
    extra_xscale = lerp(0.8, 1, _angle / 30);
if (_angle >= 150 && _angle < 180)
    extra_xscale = lerp(1, 0.8, (_angle - 150) / 30);
image_xscale *= extra_xscale;
image_yscale = image_xscale;
depth -= extra_xscale;
if (position == "above")
    y = cameray() + 20;
if (position == "below")
    y = (cameray() + cameraheight()) - 90;
