var _cx = camerax();
var _cy = cameray();
if (placed == false || cameratrack_x == true)
    x = _cx + xpos;
if (placed == false || cameratrack_y == true)
    y = _cy + ypos;
placed = true;
if (image_alpha < 1)
{
    MoveSword(-1);
    image_alpha += 0.1;
}
if ((timer < 18 && obj_mainchara.x < 360) || vanish)
{
    vanish = true;
    image_alpha -= 0.25;
    if (image_alpha <= 0)
        instance_destroy();
    exit;
}
timer += 1;
if (timer == 1)
{
    snd_stop(snd_knight_jump_quick);
    snd_play_x(snd_knight_jump_quick, 0.5, 1.3);
}
if (timer >= 10 && timer < (10 + spring_length))
{
    if (!alwaystrack_x)
        cameratrack_x = false;
    image_blend = merge_color(c_white, c_red, max(0, (timer - 10 - (spring_length - 18)) / 18));
    var ypos_spring = ystart - lengthdir_y(52, direction);
    var xpos_spring = xstart - lengthdir_x(52, direction);
    ypos = lerp(ypos, ypos_spring, (timer - 10) / spring_length);
    xpos = lerp(xpos, xpos_spring, (timer - 10) / spring_length);
}
if (timer == (10 + spring_length))
{
    con = y;
    MoveSword(600);
    snd_stop(snd_knight_cut2);
    snd_play_x(snd_knight_cut2, 0.5, 1.3);
}
if (timer == (10 + spring_length + 2))
{
    var _xp = lengthdir_x(24, direction + 90);
    var _yp = lengthdir_y(24, direction + 90);
    var _x1 = x - _xp;
    var _y1 = y - _yp;
    var _x2 = ((cameratrack_x == true) ? _cx : x) + _xp;
    var _y2 = ((cameratrack_y == true) ? _cy : y) + _yp;
    if (murder || (global.inv < 0 && i_ex(obj_mainchara) && point_in_rectangle(charaHeartX(), charaHeartY(), (_x1 < _x2) ? _x1 : _x2, (_y1 < _y2) ? _y1 : _y2, (_x1 > _x2) ? _x1 : _x2, (_y1 > _y2) ? _y1 : _y2)))
    {
        event_user(5);
        with (obj_dw_churchc_darkswords)
        {
            if (kris.x > darkness_super_endx)
            {
                darkness_hits++;
                wound = true;
                wound_heavy = other.heavy;
            }
        }
    }
}
if (timer == (10 + spring_length + 2))
    instance_destroy();
image_angle = direction;
