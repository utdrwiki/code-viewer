image_speed = 0.25;
image_xscale = 1.5;
image_yscale = 1.5;
timer = 0;
con = 0;
damage = 2;
mysolid = 0;
active_hitbox = true;
if (!i_ex(obj_shadow_mantle_enemy))
{
    instance_destroy();
    exit;
}
depth = obj_shadow_mantle_enemy.depth - 1;
destroyonhit = false;
if (obj_shadow_mantle_enemy.hp < 5 && obj_mainchara_board.myhealth < 4)
    damage = 1;
krisonly = false;
