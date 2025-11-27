image_speed = 1;
image_xscale = 2;
image_yscale = 2;
timer = 0;
con = 0;
damage = 2;
mysolid = 0;
active_hitbox = true;
destroyonhit = false;
if (i_ex(obj_shadow_mantle_enemy) && i_ex(obj_mainchara_board) && obj_shadow_mantle_enemy.hp < 5 && obj_mainchara_board.myhealth < 4)
    damage = 1;
krisonly = false;
