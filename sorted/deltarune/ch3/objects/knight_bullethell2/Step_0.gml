if (!i_ex(obj_knight_lightorb))
    exit;
var _dir = dir + (sin(timer / 10) * 15);
if (obj_knight_lightorb.type == 1)
    _dir = dir;
timer++;
if (con == 0 && timer >= 0)
{
    repeat (3)
    {
        bul = instance_create(x, y, obj_knight_bullethell_bullet);
        bul.speed = spd;
        bul.direction = _dir + a + b;
        bul.image_angle = bul.direction;
        bul.x += lengthdir_x(4, _dir + a);
        bul.y += lengthdir_y(4, _dir + a);
        bul = instance_create(x, y, obj_knight_bullethell_bullet);
        bul.speed = spd;
        bul.direction = _dir + a + b + 180;
        bul.image_angle = bul.direction;
        bul.x += lengthdir_x(4, _dir + a);
        bul.y += lengthdir_y(4, _dir + a);
        a += (40 + c);
    }
    snd_stop(snd_heartshot_dr_b);
    snd_play_x(snd_heartshot_dr_b, 1, 0.8);
    a = 0;
    b -= 0.1;
}
if (i_ex(obj_knight_enemy) && global.turntimer < 1)
    instance_destroy();
if (timer > 70)
    instance_destroy();
