function scr_sparkle(arg0)
{
    var num = arg0;
    dir = irandom(360);
    for (i = 0; i < num; i++)
    {
        var _ob = instance_create_depth(x + lengthdir_x(16, dir + ((i / num) * 360)), y + lengthdir_y(16, dir + ((i / num) * 360)), depth - 1, obj_heart_sparkle);
        _ob.speed = 4;
        _ob.direction = (i / num) * 360;
    }
}

function scr_sparkle_pos(arg0, arg1, arg2)
{
    var num = arg0;
    dir = irandom(360);
    for (i = 0; i < num; i++)
    {
        var _ob = instance_create_depth(arg1 + lengthdir_x(16, dir + ((i / num) * 360)), arg2 + lengthdir_y(16, dir + ((i / num) * 360)), depth - 1, obj_heart_sparkle);
        _ob.speed = 4;
        _ob.direction = (i / num) * 360;
    }
}

function scr_sparkle_colour(arg0, arg1)
{
    var num = arg0;
    dir = 0;
    for (i = 0; i < num; i++)
    {
        var _ob = instance_create_depth(x + lengthdir_x(16, dir + ((i / num) * 360)), y + lengthdir_y(16, dir + ((i / num) * 360)), depth - 5, obj_heart_sparkle);
        _ob.speed = 4;
        _ob.direction = (i / num) * 360;
        _ob.image_blend = arg1;
    }
}

function scr_sparkle_random(arg0)
{
    var num = arg0;
    dir = irandom(360);
    for (i = 0; i < num; i++)
    {
        with (instance_create_depth(x + lengthdir_x(16, (i / num) * 360), y + lengthdir_y(16, (i / num) * 360), depth - 1, obj_heart_sparkle))
            motion_set(other.dir, irandom_range(4, 6));
        dir += irandom(30);
    }
}
