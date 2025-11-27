if (con == 0)
{
    image_yscale += 0.1;
    if (image_yscale >= 1)
        con = 1;
}
if (con == 1)
{
    if (dir == 1 && bulletspeed < 5)
        bulletspeed += 0.4;
    if (dir == -1 && bulletspeed > -5)
        bulletspeed -= 0.4;
    angle_position += bulletspeed;
    timer++;
    if (timer >= 105)
    {
        image_alpha = 0.1;
        active = 0;
    }
    if (timer == 115)
        instance_destroy();
}
if (image_alpha == 1 && image_yscale == 1)
{
    afterimage = instance_create(x, y, obj_rotating_tower_afterimage);
    afterimage.xstart = xstart;
    afterimage.ystart = ystart;
    afterimage.image_xscale = image_xscale;
    afterimage.image_yscale = image_yscale;
    afterimage.image_alpha = image_alpha;
    afterimage.sprite_index = sprite_index;
    afterimage.darken_alpha = darken_alpha;
    afterimage.angle_position = angle_position;
    if (depth == (obj_rotating_tower_controller.depth + 50))
        afterimage.depth = depth - 10;
    else
        afterimage.depth = depth + 10;
}
event_inherited();
var _angle = angle_position + obj_rotating_tower_controller.tower_angle;
if (_angle > 360)
    _angle -= 360;
if (_angle < 0)
    _angle += 360;
if (_angle >= 30 && _angle < 150)
    image_xscale = 0.8;
if (_angle >= 210 && _angle < 270)
    image_xscale = lerp(1, 1.3, (_angle - 210) / 60);
else if (_angle >= 270 && _angle < 330)
    image_xscale = lerp(1.3, 1, (_angle - 270) / 60);
else if (_angle >= 180 && _angle < 360)
    image_xscale = 1;
if (_angle >= 0 && _angle < 30)
    image_xscale = lerp(0.8, 1, _angle / 30);
if (_angle >= 150 && _angle < 180)
    image_xscale = lerp(1, 0.8, (_angle - 150) / 30);
