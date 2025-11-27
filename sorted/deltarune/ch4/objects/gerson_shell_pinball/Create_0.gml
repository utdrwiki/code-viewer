event_inherited();
var aa = (global.hp[2] - 30) / 250;
if (aa < 0)
    aa = 0;
damage = lerp(12, 90, aa);
left_timer = -1;
right_timer = -1;
top_timer = -1;
image_speed = 8;
timer = 0;
im_done = false;
xpprevious = x;
ypprevious = y;
gerson_x = x;
gerson_y = y;
counter = choose(0, -1);
grazetimer = 0;
grazepoints = 4;

check_bounds = function(arg0)
{
    for (var a = 0; a < 100; a++)
    {
        var checkx = x + lengthdir_x(a * 2, arg0);
        var checky = y + lengthdir_y(a * 2, arg0);
        if (checkx > (obj_growtangle.x - 72) && checkx < (obj_growtangle.x + 72) && checky > (obj_growtangle.y - 75) && checky < (obj_growtangle.y + 75))
            return true;
    }
    return false;
};
