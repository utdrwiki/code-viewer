if (falseloop && !i_ex(obj_rotating_tower_controller_new))
{
    var loopwidth = falseloopx[1] - falseloopx[0];
    if (!surface_exists(mysurface))
        mysurface = surface_create(640, 480);
    surface_copy_part(mysurface, 0, 0, application_surface, 0, 0, 640, 480);
    draw_surface_part_ext(mysurface, falseloopx[0], 0, loopwidth, 480, falseloopx[0] - loopwidth, cameray(), 1, 1, 16777215, 0.9);
    draw_surface_part_ext(mysurface, falseloopx[0], 0, loopwidth, 480, falseloopx[0] + loopwidth, cameray(), 1, 1, 16777215, 0.9);
    surface_copy_part(mysurface, 0, 0, application_surface, 0, 0, 640, 480);
    var _w = 120;
    draw_clear(c_black);
    draw_surface_part_ext(mysurface, x - 20, 0, 40, 480, (camerax() + 320) - 40, cameray(), 1, 1, 16777215, 1);
    var movedscale = 1;
    var movedscalerate = 0.9;
    for (var i = 1; i < 5; i++)
    {
        movedscalerate *= movedscalerate;
        movedscale += movedscalerate;
        draw_surface_part_ext(mysurface, x - 20 - (40 * i), 0, 40, 480, (camerax() + 320) - (40 * movedscale), cameray(), movedscalerate, 1, merge_color(c_white, c_navy, i / 6), 1);
        draw_surface_part_ext(mysurface, (x - 20) + (40 * i), 0, 40, 480, (camerax() + 320 + (40 * movedscale)) - 72, cameray(), movedscalerate, 1, merge_color(c_white, c_navy, i / 6), 1);
    }
}
