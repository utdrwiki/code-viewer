target = 43843743;
damage = 1;
star = 0;
caster = 0;
image_alpha = 0;
image_xscale = 2;
image_yscale = 2;
image_speed = 1;
for (i = 0; i < 10; i += 1)
{
    prevx[i] = x;
    prevy[i] = y;
}
a = 0;
targetx = 0;
targety = 0;
t = 0;
tmax = 4;
siner = 0;
speedmax = 24;
explode = 0;
maxaft = 0;
bolt_timer = 0;
chosen_bolt = 0;
final_bolt = 0;
lockdamage = false;
red = 0;
battlemode = 1;
if (global.fighting == 0)
    battlemode = 0;
if (global.chapter == 4)
{
    if (i_ex(obj_hammer_of_justice_enemy) && obj_hammer_of_justice_enemy.rudebusterhitcount != obj_hammer_of_justice_enemy.rudebusterhitcountmax)
        speedmax = 6;
}
hurtflashalpha = 0;
gersonswingtimer = 0;
gersonoffset = 0;
misswritercreated = false;
if (global.chapter == 4)
{
    if (i_ex(obj_hammer_of_justice_enemy))
    {
        gersonoffset = -10;
        x += 20;
        y -= 20;
    }
}
