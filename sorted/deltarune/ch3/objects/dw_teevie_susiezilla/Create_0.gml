if (scr_debug())
    scr_setparty(1, 1, 0);
con = 0;
timer = 0;
sukcon = 0;
suktimer = 0;
susie = -4;
sureal = 0;
targ = 0;
killmove = 0;
fighthappened = false;
init = 0;
dokick = false;
patalk = 0;
nohouses = 0;
signx = camerax() + 320;
signy = -400;
vis = true;
fightcon = 0;
timer2 = 0;
suwalktarg = 
{
    x: 0,
    y: 0
};
sustart = 
{
    x: 0,
    y: 0
};

scr_returnwait = function(arg0, arg1, arg2, arg3, arg4)
{
    return max(1, round(point_distance(arg0, arg1, arg2, arg3) / arg4));
};
