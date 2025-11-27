_speed += _gravity;
if (_speed > _maxspeed)
    _speed = _maxspeed;
var _xadd = lengthdir_x(1, mydirection);
var _yadd = lengthdir_y(1, mydirection);
if (con == 1)
{
    timer++;
    var c = 10;
    if (timer == 1)
    {
        _gravity = 0;
        telegraph = 1;
    }
    if (timer < (10 + (c / 2)))
    {
        anglespeed = lerp(8, 0, timer / (10 + (c / 2)));
        image_angle += scr_anglechange(image_angle, point_direction(x, y, obj_heart.x + 10 + randx, obj_heart.y + 10 + randy), anglespeed);
        targetangle += anglespeed;
        show_debug_message(targetangle);
    }
    direction = image_angle;
    if (timer < (10 + c))
        _speed = lerp(_speed, 0, timer / 10);
    if (timer >= (11 + c) && timer < (15 + c))
    {
        if (!audio_is_playing(snd_knight_jump))
            snd_play_x(snd_knight_jump, 1, 0.8);
        _speed = 2;
        _xadd = lengthdir_x(2, image_angle + 180);
        _yadd = lengthdir_y(2, image_angle + 180);
    }
    if (timer >= (15 + c) && timer < (20 + c))
    {
        _xadd = 0;
        _yadd = 0;
    }
    if (timer == (20 + c))
    {
        inst = scr_afterimage_grow();
        inst.xrate = 0.4;
        inst.yrate = 0.4;
        inst.fade = 0.2;
    }
    if (timer >= (20 + c))
    {
        if (!audio_is_playing(snd_knight_cut))
            snd_play_x(snd_knight_cut, 1, 0.8);
        telegraph = 0;
        damage = 160;
        _speed = 80;
        _xadd = lengthdir_x(1, image_angle);
        _yadd = lengthdir_y(1, image_angle);
    }
}
image_blend = c_white;
if (x > (obj_heart.x - 80) && x < (obj_heart.x + 80))
{
    if (y < (obj_heart.y + 80) && y > (obj_heart.y - 80))
    {
        image_blend = c_red;
        var remx = x;
        var remy = y;
        repeat (max(floor(_speed / 8), 1))
        {
            x += (_xadd * 8);
            y += (_yadd * 8);
            active = 1;
            if (con == 1 && _speed == 80 && create_2nd_hitbox == false)
            {
                hitbox = instance_create_depth(x, y, depth - 1, obj_sword_tunnel_hitbox);
                hitbox.image_angle = image_angle;
                hitbox.image_yscale = 0.4;
                hitbox.image_xscale = 999;
                with (obj_heart)
                    mask_index = spr_dodgeheart_smallmask;
                create_2nd_hitbox = true;
            }
            else if (create_2nd_hitbox == false && collision_line(x, y, x + lengthdir_x(37, image_angle), y + lengthdir_y(37, image_angle), obj_heart, 0, false))
            {
                event_user(5);
            }
            active = 0;
        }
        x = remx;
        y = remy;
    }
}
x += (_xadd * _speed);
y += (_yadd * _speed);
var afterimage = scr_afterimage();
afterimage.image_alpha = 0.4;
afterimage.x = (x + xprevious) / 2;
afterimage.y = (y + yprevious) / 2;
if (con > 0)
    afterimage.image_blend = c_white;
if (x <= (camerax() - 100))
    instance_destroy();
if (x >= (camerax() + 740))
    instance_destroy();
if (y >= (cameray() + 600))
    instance_destroy();
if (y <= (cameray() - 250))
    instance_destroy();
if (con == 0)
    image_yscale = lerp(image_yscale, _speed / 20, 0.1);
