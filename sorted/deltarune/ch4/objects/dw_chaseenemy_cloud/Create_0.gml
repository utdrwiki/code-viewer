event_inherited();
guys = [];
hcount = 18;
vcount = 6;
target = 0;
damage = 38;
miny = 0;
active = 1;
minspeed = 0;
maxspeed = 0;
con = 0;
minx = 0;
last_jumped_x = 999999;
depth = 30095;
destroyoffscreen = false;
for (var i = 0; i < hcount; i++)
{
    for (var ii = 0; ii < vcount; ii++)
    {
        var marker = instance_create(i, y + (random(1) * 20) + ii, obj_marker);
        marker.sprite_index = spr_climb_chaseenemy_40;
        marker.image_speed = 0.5;
        marker.image_angle = 180;
        marker.xoffset = (random(1) * 16) - 8;
        marker.yoffset = (random(1) * 16) - 8;
        marker.visible = false;
        marker.image_blend = merge_color(c_white, c_black, ii / vcount);
        array_push(guys, marker);
    }
}
