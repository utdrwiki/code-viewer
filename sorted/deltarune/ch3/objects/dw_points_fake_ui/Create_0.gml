amount_display = 0;
cur_jewel = 0;
display_timer = 0;
increase_points = false;
xx = (camerax() + (view_wport[0] / 2)) - 110;
yy = cameray() + 180;

display_points = function(arg0 = 10)
{
    global.flag[1044] += arg0;
    global.flag[1117] += arg0;
    amount_display = global.flag[1044] - arg0;
};

show_point_increase = function()
{
    increase_points = true;
};
