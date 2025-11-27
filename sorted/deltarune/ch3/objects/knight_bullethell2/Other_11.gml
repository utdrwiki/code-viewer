if (!i_ex(obj_knight_lightorb))
    exit;
var _dir = dir + (sin(timer / 10) * 15);
if (obj_knight_lightorb.type == 1)
    _dir = dir;
timer++;
if (con == 0 && timer >= 0)
{
    bul = instance_create(x, y, obj_knight_bullethell_bullet);
    bul.speed = spd;
    bul.direction = (_dir - 58) + c;
    bul.image_angle = bul.direction;
    bul.x += lengthdir_x(4, _dir + a);
    bul.y += lengthdir_y(4, _dir + a);
    bul = instance_create(x, y, obj_knight_bullethell_bullet);
    bul.speed = spd;
    bul.direction = ((_dir + 180) - 58) + c;
    bul.image_angle = bul.direction;
    bul.x += lengthdir_x(4, _dir + a);
    bul.y += lengthdir_y(4, _dir + a);
    bul = instance_create(x, y, obj_knight_bullethell_bullet);
    bul.speed = spd;
    bul.direction = _dir;
    bul.image_angle = bul.direction;
    bul.x += lengthdir_x(4, _dir + a);
    bul.y += lengthdir_y(4, _dir + a);
    bul = instance_create(x, y, obj_knight_bullethell_bullet);
    bul.speed = spd;
    bul.direction = _dir + 180;
    bul.image_angle = bul.direction;
    bul.x += lengthdir_x(4, _dir + a);
    bul.y += lengthdir_y(4, _dir + a);
    bul = instance_create(x, y, obj_knight_bullethell_bullet);
    bul.speed = spd;
    bul.direction = (_dir + 58) - c;
    bul.image_angle = bul.direction;
    bul.x += lengthdir_x(4, _dir + a);
    bul.y += lengthdir_y(4, _dir + a);
    bul = instance_create(x, y, obj_knight_bullethell_bullet);
    bul.speed = spd;
    bul.direction = (_dir + 180 + 58) - c;
    bul.image_angle = bul.direction;
    bul.x += lengthdir_x(4, _dir + a);
    bul.y += lengthdir_y(4, _dir + a);
    snd_stop(snd_heartshot_dr_b);
    snd_play_x(snd_heartshot_dr_b, 1, 0.8);
    a = 0;
    c += 0.26;
}
if (i_ex(obj_knight_enemy) && global.turntimer < 1)
    instance_destroy();
if (timer > 70)
    instance_destroy();
