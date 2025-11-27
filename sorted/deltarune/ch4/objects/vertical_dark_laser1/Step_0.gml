if (con == 0)
{
    timer++;
    siner++;
    if (timer == 4)
        snd_play(snd_spearrise);
    var _size;
    if (timer < 31)
        _size = lerp(0.1, 0.6, timer / 30);
    else
        _size = 0.6;
    image_xscale = _size + (sin(siner / 3) * 0.1);
    image_yscale = _size + (sin(siner / 3) * 0.1);
    if (position == "above")
        ystart += spd;
    else
        ystart -= spd;
    if (timer < (lifetime - 6) && (timer % 5) == 0)
    {
    }
    if (timer == lifetime)
    {
        timer = 0;
        con = 1;
    }
}
if (con == 1)
{
    timer++;
    siner++;
    image_xscale = lerp(image_xscale, 0, timer / 30);
    if (timer == 1)
    {
        snd_play(snd_spearappear);
        laser = instance_create(x, y, obj_vertical_dark_laser2);
        laser.angle_position = angle_position;
        laser.xstart = xstart;
        laser.ystart = ystart;
    }
    if (timer == 30)
        instance_destroy();
}
if (init == 0)
{
    init = 1;
    if (position == "above")
    {
        y = cameray() - 30 - obj_rotating_tower_controller.yoffset;
        ystart = cameray() - 30 - obj_rotating_tower_controller.yoffset;
    }
    if (position == "below")
    {
        y = (cameray() + cameraheight()) - 50 - obj_rotating_tower_controller.yoffset;
        ystart = (cameray() + cameraheight()) - 50 - obj_rotating_tower_controller.yoffset;
    }
}
event_inherited();
var _angle = angle_position + obj_rotating_tower_controller.tower_angle;
if (_angle > 360)
    _angle -= 360;
if (_angle < 0)
    _angle += 360;
