destroyoffscreen = false;
tolerance = 0;
active = 1;
timer = 0;
con = 0;
damage = 25;
target = 0;
ypos = y;
xpos = x;
vanish = false;
image_alpha = 0;
image_speed = 0;
image_index = 2;
image_angle = 270;
image_xscale = 2;
image_yscale = 2;
sprite_index = spr_roaringknight_sword3;
depth = 49000;
direction = image_angle;

MoveSword = function(arg0, arg1 = direction)
{
    xpos += lengthdir_x(arg0, direction);
    ypos += lengthdir_y(arg0, direction);
};

murder = false;
alwaystrack_x = false;
cameratrack_x = true;
cameratrack_y = true;
placed = false;
spring_length = 10;
heavy = false;
