if (global.turntimer < 1)
{
    instance_destroy();
    exit;
}
var _attack_happens = false;
var _attack_tried = false;
life_time++;
switch (life_time)
{
    case 1:
        _attack_happens = true;
        _attack_tried = true;
        break;
    case 4:
        if (scr_monsterpop() <= 2)
            _attack_happens = true;
        _attack_tried = true;
        break;
    case 7:
        if (scr_monsterpop() <= 1)
            _attack_happens = true;
        _attack_tried = true;
        break;
}
if (_attack_happens)
{
    var i = 0;
    var _dir = -(bullet_dir_add * ((bullet_number - 1) / 2)) + bullet_dir;
    var _shootdir = floor(0.5 + (point_direction(splash_x, splash_y, scr_get_box(4), scr_get_box(5)) / 45)) * 45;
    snd_stop(snd_churchbell_short);
    snd_play(snd_churchbell_short);
    repeat (bullet_number)
    {
        var _bullet = scr_fire_bullet(splash_x, splash_y, obj_bullet_bellwave, _shootdir + _dir, bullet_speed);
        _bullet.image_index = 0;
        _bullet.image_speed = 1;
        _bullet.image_angle = _bullet.direction;
        _bullet.image_xscale = 1.5;
        _bullet.image_yscale = 1.5;
        _bullet.visible = false;
        _dir += bullet_dir_add;
        i++;
    }
    bullet_dir += (bullet_dir_add / 3);
    if (bullet_dir > (bullet_dir_add / 2))
        bullet_dir -= bullet_dir_add;
}
if (_attack_tried)
    bullet_speed -= 0.8;
if (life_time <= 2)
    splash_size += 16;
else
    splash_size = max(0, (splash_size * 0.96) - 3);
shake_dir += shake_speed;
if (shake_dir)
    shake--;
if (shake <= 0 && !i_ex(obj_bullet_bellwave))
{
    if (instance_number(obj_growtanglebellshake) > 1)
    {
        with (obj_growtanglebellshake)
        {
            if (id != other.id)
            {
                visible = 1;
                break;
            }
        }
    }
    else
    {
        with (obj_growtangle)
            visible = true;
    }
    instance_destroy();
}
