timer = 0;
xballtimer = 80;
yballtimer = 1;
cenx = x;
ceny = y;
radius = 20;
ball_alpha = 1;

fade_out = function()
{
    scr_lerpvar("ball_alpha", 1, 0, 30, 2, "out");
};
