scr_bullet_init();
con = 0;
special = 0;
destroyonhit = false;
active = 0;
activetimer = 0;
longtelegraph = false;
image_alpha = 0;
var a = (global.hp[2] - 30) / 250;
if (a < 0)
    a = 0;
damage = lerp(12, 90, a);
if (i_ex(obj_sound_of_justice_enemy))
{
    target = 4;
    if (obj_sound_of_justice_enemy.phase == 1)
        damage = 38;
    else
        damage = 58;
}
if (i_ex(obj_hammer_of_justice_enemy) && obj_hammer_of_justice_enemy.attackpattern == 19)
{
    image_xscale = 1;
    sprite_index = spr_gerson_swing_down_telegraph3;
}
else if (i_ex(obj_hammer_of_justice_enemy) && obj_hammer_of_justice_enemy.reachedendphase == 1)
{
    longtelegraph = true;
    image_xscale = 1;
    sprite_index = spr_gerson_swing_down_telegraph2;
}
