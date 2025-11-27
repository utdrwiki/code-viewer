con = 0;
timer = 0;
notext = false;
strongerheal = false;
if (i_ex(obj_titan_enemy))
    healamt = global.monstermaxhp[obj_titan_enemy.myself] * 0.15;
for (var i = 5; i < 8; i++)
{
    var _wing = instance_create(obj_titan_enemy.x, obj_titan_enemy.y, obj_titan_wing_marker);
    _wing.wing_layer = i;
}
