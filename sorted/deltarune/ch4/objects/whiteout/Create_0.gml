target = -4;
follow = false;
current_color = c_white;
current_alpha = 0;

start_whiteout = function(arg0, arg1, arg2 = false, arg3 = 16777215)
{
    target = arg1;
    follow = arg2;
    current_color = arg3;
    scr_lerpvar("current_alpha", 0, 1, arg0);
};

stop_whiteout = function(arg0)
{
    scr_lerpvar("current_alpha", 1, 0, arg0);
    scr_doom(id, arg0 + 1);
};
