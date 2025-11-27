fog = instance_create(x, y, obj_dw_church_fog);
if (scr_debug())
{
    if (keyboard_check(ord("P")))
    {
    }
}
timer = 0;
con = 0;
dcamx = -1;
dcamy = -1;
altx1 = 0;
alty1 = 0;
rax = 0;
ray1 = 0;
ray2 = 0;
ralsei = 0;
init = 0;
topy = 1990;
bottomy = 2042;
room_left = 2560;
makera = true;
layer_set_visible("DEBUG_ASSETS", 0);
if (scr_debug())
{
    scr_setparty(1);
    if (keyboard_check(ord("W")))
    {
        if (keyboard_check_pressed(ord("V")))
        {
        }
    }
}
krmark = [];
sumark = [];
ramark = [];
for (var i = 0; i < 4; i++)
{
    krmark[i] = -4;
    sumark[i] = -4;
    ramark[i] = -4;
}
depupd = 0;
