event_inherited();
timer = 0;
con = 0;
active = 0;
fakeout = 0;
swingdowntype = 0;
timetoswing = 22;
telegraphtime = 12;
special = 0;
eye_index = 0;
eye_con = 0;
alpha = 0;
alphacon = 0;
image_speed = 0;
speed = -7;
direction = 270;
friction = 0.4;
image_xscale = 2;
image_yscale = 2;
image_alpha = 1.4;
if (i_ex(obj_growtangle))
    depth = obj_growtangle.depth + 1;
grazepoints = 4;
version = 0;
if (i_ex(obj_hammer_of_justice_enemy) && (obj_hammer_of_justice_enemy.trueturn == 10 || true))
{
    timetoswing = 10;
    telegraphtime = 8;
}
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
