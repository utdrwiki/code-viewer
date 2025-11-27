function scr_copy_tenna(arg0, arg1, arg2)
{
    scr_copy_tenna_ext(arg0, arg1, arg2, arg0.xscale, arg0.yscale, 1, arg0.outline, arg0.dropshadow);
}

function scr_copy_tenna_ext(arg0, arg1, arg2, arg3, arg4, arg5, arg6 = true, arg7 = false)
{
    with (arg0)
    {
        var _x1 = (x1 - x) + arg1;
        var _x2 = (x2 - x) + arg1;
        var _x3 = (x3 - x) + arg1;
        var _x4 = (x4 - x) + arg1;
        var _y1 = (y1 - y) + arg2;
        var _y2 = (y2 - y) + arg2;
        var _y3 = (y3 - y) + arg2;
        var _y4 = (y4 - y) + arg2;
        if (drawtype == 0)
        {
            if (arg3 != xscale)
            {
                _x1 = arg1 + ((_x1 - arg1) * (arg3 / 2));
                _x2 = arg1 + ((_x2 - arg1) * (arg3 / 2));
                _x3 = arg1 + ((_x3 - arg1) * (arg3 / 2));
                _x4 = arg1 + ((_x4 - arg1) * (arg3 / 2));
            }
            if (arg4 != yscale)
            {
                _y1 = arg2 + ((_y1 - arg2) * (arg4 / 2));
                _y2 = arg2 + ((_y2 - arg2) * (arg4 / 2));
                _y3 = arg2 + ((_y3 - arg2) * (arg4 / 2));
                _y4 = arg2 + ((_y4 - arg2) * (arg4 / 2));
            }
            if (arg6)
            {
                d3d_set_fog(true, c_black, 0, 1);
                draw_sprite_pos(sprite_index, image_index, _x1 - 2, _y1, _x2 - 2, _y2, _x3 - 2, _y3, _x4 - 2, _y4, 1);
                draw_sprite_pos(sprite_index, image_index, _x1, _y1 - 2, _x2, _y2 - 2, _x3, _y3 - 2, _x4, _y4 - 2, 1);
                draw_sprite_pos(sprite_index, image_index, _x1, _y1 + 2, _x2, _y2 + 2, _x3, _y3 + 2, _x4, _y4 + 2, 1);
                draw_sprite_pos(sprite_index, image_index, _x1 + 2, _y1, _x2 + 2, _y2, _x3 + 2, _y3, _x4 + 2, _y4, 1);
                d3d_set_fog(false, c_black, 0, 0);
            }
            if (arg7)
            {
                d3d_set_fog(true, c_black, 0, 1);
                draw_sprite_pos(sprite_index, image_index, _x1 + dropdist, _y1 + dropdist, _x2 + dropdist, _y2 + dropdist, _x3 + dropdist, _y3 + dropdist, _x4 + dropdist, _y4 + dropdist, 1);
                d3d_set_fog(false, c_white, 0, 0);
            }
            draw_sprite_pos(sprite_index, image_index, _x1, _y1, _x2, _y2, _x3, _y3, _x4, _y4, 1);
        }
        if (drawtype == 1)
        {
            if (arg7)
                draw_sprite_ext(sprite_index, image_index, x + dropdist, y + dropdist, image_xscale, image_yscale, image_angle, c_black, image_alpha);
            draw_sprite_ext(sprite_index, image_index, arg1, arg2, arg3, arg4, image_angle, image_blend, arg5);
        }
    }
}

function scr_tenna_marker(arg0, arg1, arg2)
{
    var __marker = instance_create(arg0, arg1, obj_tenna_marker);
    with (__marker)
        scr_copy_tenna_vars(arg2);
    return __marker;
}

function scr_tenna_afterimage(arg0 = -4)
{
    if (arg0 == -4)
        arg0 = id;
    var __afterimage = instance_create(arg0.x, arg0.y, obj_tenna_afterimage);
    with (__afterimage)
        scr_copy_tenna_vars(arg0);
    return __afterimage;
}

function scr_copy_tenna_vars(arg0)
{
    sprite_index = arg0.sprite_index;
    image_index = arg0.image_index;
    image_speed = 0;
    image_angle = arg0.image_angle;
    image_blend = arg0.image_blend;
    image_xscale = arg0.image_xscale;
    image_yscale = arg0.image_yscale;
    depth = arg0.depth;
    outline = arg0.outline;
    drawtype = arg0.drawtype;
    dropdist = arg0.dropdist;
    dropshadow = arg0.dropshadow;
    xscale = arg0.xscale;
    yscale = arg0.yscale;
    x1 = arg0.x1 - arg0.x;
    x2 = arg0.x2 - arg0.x;
    x3 = arg0.x3 - arg0.x;
    x4 = arg0.x4 - arg0.x;
    y1 = arg0.y1 - arg0.y;
    y2 = arg0.y2 - arg0.y;
    y3 = arg0.y3 - arg0.y;
    y4 = arg0.y4 - arg0.y;
}
