image_alpha += 0.1;
if (dir == 1)
{
    if (con == 2)
        angle_position += 2;
    else
        angle_position += 4;
}
else if (con == 2)
{
    angle_position -= 2;
}
else
{
    angle_position -= 4;
}
if (con == 1)
{
    timer++;
    siner++;
    if (timer == 20 || timer == 26 || timer == 23 || timer == 29)
    {
        if (image_index == 0)
            image_index = 1;
        else
            image_index = 0;
    }
    if (timer == 30)
    {
        timer = 0;
        con = 2;
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
            hitbox.depth -= 9999999;
            hitbox.image_alpha = 0.5;
            hitbox.parenttarget = id;
        }
    }
}
if (con == 2)
{
    timer++;
    siner += 4;
    laser_xscale = 1.7 + (sin(siner / 6) * 0.7);
    xoffset = -2 + random(4);
    yoffset = -2 + random(4);
    _angle = angle_position + obj_rotating_tower_controller.tower_angle;
    if (_angle > 360)
        _angle -= 360;
    if (_angle < 0)
        _angle += 360;
    if (_angle >= 0 && _angle < 180)
    {
        if (hitboxcreated == true)
        {
            hitboxcreated = false;
            with (hitbox)
                instance_destroy();
        }
    }
    else if (hitboxcreated == false)
    {
        hitboxcreated = true;
        hitbox = instance_create(320, (cameray() + cameraheight()) - 90 - obj_rotating_tower_controller.yoffset, obj_vertical_dark_shockwave_hurtbox);
        hitbox.image_xscale = 1;
        hitbox.image_yscale = 100;
        hitbox.depth -= 9999999;
        hitbox.image_alpha = 0.5;
        hitbox.parenttarget = id;
    }
    if (!audio_is_playing(snd_sneo_overpower))
        snd_play_pitch(snd_sneo_overpower, 1.4);
    if (timer == 30)
    {
        con = 3;
        timer = 0;
    }
}
if (con == 3)
{
    image_xscale -= 0.2;
    image_yscale -= 0.2;
    if (image_xscale < 0)
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
if (position == "above")
    y = cameray() + 20;
if (position == "below")
    y = (cameray() + cameraheight()) - 90;
afterimage_timer++;
if ((afterimage_timer == 3 && con != 2 && con != 3) || (afterimage_timer == 3 && con == 2 && con != 3))
{
    afterimage_timer = 0;
    var yyy = 0;
    repeat (2)
    {
        afterimage = instance_create(x, y + yyy, obj_rotating_tower_afterimage);
        afterimage.xstart = xstart;
        afterimage.ystart = ystart;
        afterimage.image_xscale = image_xscale;
        afterimage.image_yscale = image_yscale;
        afterimage.image_alpha = 1;
        afterimage.sprite_index = sprite_index;
        afterimage.image_speed = image_speed;
        afterimage.image_index = image_index;
        afterimage.darken_alpha = darken_alpha;
        afterimage.angle_position = angle_position;
        afterimage.parenttarget_x = x;
        afterimage.parenttarget_y = y + yyy;
        afterimage.parenttarget_xscale = image_xscale - 0.3;
        afterimage.parenttarget_yscale = image_yscale - 0.3;
        if (depth == (obj_rotating_tower_controller.depth + 50))
            afterimage.depth = depth - 10;
        else
            afterimage.depth = depth + 10;
        yyy = -360;
    }
}
