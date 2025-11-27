if (x < (__view_get(e__VW.XView, 0) - 80))
    instance_destroy();
if (x > (__view_get(e__VW.XView, 0) + 760))
    instance_destroy();
if (y < (__view_get(e__VW.YView, 0) - 80))
    instance_destroy();
if (y > (__view_get(e__VW.YView, 0) + 580))
    instance_destroy();
init_size *= 0.65;
timer++;
prev_counter = color_counter;
color_counter = 0.9 + (sin(timer) * 0.1);
if (leavetrails)
{
    if (!irandom(1))
    {
        with (instance_create_depth(x, y + irandom_range(-32, 32), depth - 1, obj_battle_marker))
        {
            var scale = choose(0.5, 0.75);
            image_xscale = scale * choose(1, -1) * 0.75;
            image_yscale = scale * 1.5;
            destroyoncomplete = true;
            sprite_index = spr_darkshape_dissipate;
            image_speed = 0.5 + choose(0, 0.5);
            direction = other.direction + 180;
            image_angle = direction - 90;
            speed = 3 + random(3);
        }
    }
}
image_xscale = (0.65 + init_size + (sin(global.time * 2) * 0.1)) * xmod;
image_yscale = (0.65 + init_size + (sin(global.time * 2) * 0.1)) * ymod;
with (obj_darkshape)
{
    if (point_distance(x, y, other.x, other.y) < ((40 * other.image_xscale) + (radius * image_xscale)))
    {
        var dblast = other.id;
        with (instance_create_depth(x, y, depth - 1, obj_battle_marker))
        {
            image_xscale = choose(-0.75, 0.75);
            image_yscale = 0.75;
            destroyoncomplete = true;
            sprite_index = spr_darkshape_dissipate;
            image_speed = 0.5 + choose(0, 0.5);
            direction = point_direction(dblast.x, dblast.y, x, y);
            image_angle = direction - 90;
            speed = 3;
        }
        instance_destroy();
    }
}

enum e__VW
{
    XView,
    YView,
    WView,
    HView,
    Angle,
    HBorder,
    VBorder,
    HSpeed,
    VSpeed,
    Object,
    Visible,
    XPort,
    YPort,
    WPort,
    HPort,
    Camera,
    SurfaceID
}
