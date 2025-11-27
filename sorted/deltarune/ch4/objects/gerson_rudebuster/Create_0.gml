inst = instance_create(x, y, obj_gerson_slowdown);
if (obj_hammer_of_justice_enemy.rudebusterhitcountmax == 1)
{
    if (obj_hammer_of_justice_enemy.susiehitbyrudebustercount == 0)
        inst.type = 0;
    if (obj_hammer_of_justice_enemy.susiehitbyrudebustercount == 1)
        inst.type = 1;
    if (obj_hammer_of_justice_enemy.susiehitbyrudebustercount == 2)
        inst.type = 2;
}
target = 43843743;
damage = 1;
star = 0;
caster = 0;
image_alpha = 0;
image_xscale = 2;
image_yscale = 2;
image_speed = 1;
image_angle = 180;
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
explode = 0;
maxaft = 0;
bolt_timer = 0;
chosen_bolt = 0;
final_bolt = 0;
red = 0;
battlemode = 0;
textcolortimer = 0;
textcolor = merge_color(c_white, c_red, textcolortimer);
susieattackcon = 0;
susieattacktimer = 0;
buffer_z = 0;
hurtflashalpha = 0;
scr_bullet_init();
target = 3;
damage = 60;
hitsusietimer = 0;
hitback = false;
