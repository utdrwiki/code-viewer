timer = 0;
amount = 0;

init = function(arg0)
{
    amount = arg0;
    scr_lerpvar("y", y, y - 20, 24, 6, "out");
};
