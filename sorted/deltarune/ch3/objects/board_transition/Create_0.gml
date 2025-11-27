depth = 600000;
con = 0;
timer = 0;
transitionspeed = 3;
tilescovered = 0;
pausetime = 15;
width = 24;
height = 16;
for (var i = 0; i < width; i += 1)
{
    for (var j = 0; j < height; j += 1)
        tile[i][j] = 0;
}
type = 0;
prefill = 0;
interactResetter = false;
triggered = 0;
s_curcol = 0;
if (i_ex(obj_gameshow_swordroute))
    s_curcol = obj_gameshow_swordroute.screencolor;
forcecolor = -1;
