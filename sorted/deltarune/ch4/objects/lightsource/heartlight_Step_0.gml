if (global.inv > 15)
    siner += clamp(global.inv - 15, 1, 30);
else
    siner++;
smallerLight = max(0, (sin(siner / 30) * 10) + current_radius);
biggerLight = max(0, (sin((siner - 10) / 30) * 10) + current_radius + (biggerrad * (current_radius / radius)));
scr_depth();
if (supercharged)
{
    super_timer++;
    depth = obj_heart.depth + 1;
    if (super_timer > (12 + random(5)))
    {
        super_timer = 0;
        instance_create(x, y, obj_heartlight_beam);
    }
}
var succ = 0.35;
if (instance_exists(obj_jackenstein_enemy))
{
    if (obj_jackenstein_enemy.sact)
        succ += 0.3;
}
if (i_ex(obj_lightsource_firebar))
    succ += 0.1;
with (obj_ghosthouse_dot)
{
    if (point_distance(x, y, obj_heart.x + 5, obj_heart.y + 5) < (48 * succ) && !suck)
    {
        suck = true;
        friction = 0.5;
    }
}
