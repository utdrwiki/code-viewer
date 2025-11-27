t = 0;
target = 9897887;
damage = 1;
caster = 0;
star = 0;
if (i_ex(obj_titan_enemy) && instance_exists(obj_titan_enemy.gerson))
{
    obj_titan_enemy.gerson.visible = 0;
    depth = obj_titan_enemy.gerson.depth;
    x = obj_titan_enemy.gerson.x;
    y = obj_titan_enemy.gerson.y;
}
image_xscale = -2;
image_yscale = 2;
image_speed = 0.5;
