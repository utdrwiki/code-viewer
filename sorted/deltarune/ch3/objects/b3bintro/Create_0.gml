image_alpha = 0;
active = false;
init = 0;
con = 0;
timer = 0;
kris = 0;
susie = 0;
ralsei = 0;
kr_real = 0;
su_real = 0;
ra_real = 0;
tenna = 0;
suwalk = 0;
suwalktimer = 0;
visit = 0;
floorloc = 0;
global.flag[1023] = 0;
var make = true;
if (make)
{
    if (global.flag[1055] == 6)
        instance_create(x, y, obj_b3bintrocutscene_swordroutever);
    else
        instance_create(x, y, obj_b3bintrocutscene);
    global.interact = 1;
}
else
{
    con = 0.5;
}
