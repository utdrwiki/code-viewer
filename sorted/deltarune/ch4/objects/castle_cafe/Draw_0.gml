draw_sprite_ext(spr_castle_cafe_base, 0, x, y, 2, 2, 0, c_white, 1);
timer++;
if ((timer % 15) == 0)
{
    var cloud = instance_create(x + 148, y + 78, obj_castle_cafe_cloud);
    cloud.vspeed = random_range(-1.2, -1.8);
    cloud.hspeed = random_range(0.5, 1);
    cloud.width = random_range(15, 20);
    cloud.height = random_range(10, 15);
    cloud.fade = true;
    cloud.gravity = 0.025;
    cloud.gravity_direction = 225;
}
if (i_ex(obj_castle_cafe_cloud))
{
    with (obj_castle_cafe_cloud)
    {
        var t = 6;
        var x1 = round(x - width - t);
        var x2 = round(x + width + t);
        var y1 = round(y - height - t);
        var y2 = round(y + height + t);
        draw_set_color(#007DDF);
        d_ellipse(x1, y1, x2, y2, 0);
    }
    with (obj_castle_cafe_cloud)
    {
        var t = 4;
        var x1 = round(x - width - t);
        var x2 = round(x + width + t);
        var y1 = round(y - height - t);
        var y2 = round(y + height + t);
        draw_set_color(c_black);
        d_ellipse(x1, y1, x2, y2, 0);
    }
    with (obj_castle_cafe_cloud)
    {
        var t = 0;
        var x1 = round((x - width) + t);
        var x2 = round(x + width + t);
        var y1 = round((y - height) + t);
        var y2 = round(y + height + t);
        draw_set_color(#5475A6);
        d_ellipse(x1, y1, x2, y2, 0);
    }
}
