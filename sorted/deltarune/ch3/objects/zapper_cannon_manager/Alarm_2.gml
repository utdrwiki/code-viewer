aim_y = obj_growtangle.y + irandom_range(-40, 40);
aim_angle = point_direction(x + 40, y + 82, aim_x, aim_y);
snd_play_x(snd_explosion_firework, 1, 1.2);
snd_play(snd_wing);
var t_speed, t_off;
if (i_ex(obj_shutta_enemy))
{
    t_speed = 4.2;
    t_off = t_speed * 0.75;
}
else
{
    t_speed = 5.5;
    t_off = t_speed * 0.5;
}
var circ_depth = 6;
if (i_ex(obj_volumeup))
{
    t_speed = 5.5;
    t_off = 3;
    if (i_ex(obj_zapper_laser_manager))
        circ_depth--;
}
with (scr_fire_bullet(x + 40, y + 82, obj_regular_cannon_bullet, aim_angle, t_speed * 2.5, spr_diamondbullet))
{
    depth = other.depth - 9999;
    damage = other.damage;
    target = other.target;
}
for (a = 0; a < circ_depth; a++)
{
    var t_aim = aim_angle;
    var t_hspeed = (lengthdir_x(t_speed, t_aim) - lengthdir_x(t_off, t_aim + (60 * a) + 60)) * 2.5;
    var t_vspeed = (lengthdir_y(t_speed, t_aim) - lengthdir_y(t_off, t_aim + (60 * a) + 60)) * 2.5;
    with (scr_fire_bullet(x + 40, y + 82, obj_regular_cannon_bullet, 0, 0, spr_diamondbullet))
    {
        depth = other.depth - 9999;
        damage = other.damage;
        target = other.target;
        hspeed = t_hspeed;
        vspeed = t_vspeed;
    }
}
