if (room == room_dw_puzzlecloset_1)
{
    if (!surface_exists(surf1))
        surf1 = surface_create(vwid, vhei);
    if (!surface_exists(surf2))
        surf2 = surface_create(vwid, vhei);
    if (!surface_exists(surf3))
        surf3 = surface_create(vwid, vhei);
    if (!surface_exists(surf1b))
        surf1b = surface_create(vwid, vhei);
    if (!surface_exists(surf2b))
        surf2b = surface_create(vwid, vhei);
    if (!surface_exists(surf3b))
        surf3b = surface_create(vwid, vhei);
    if (view_get_surface_id(1) != surf1)
        view_set_surface_id(1, surf1);
    if (view_get_surface_id(2) != surf2)
        view_set_surface_id(2, surf2);
    if (view_get_surface_id(3) != surf3)
        view_set_surface_id(3, surf3);
    surface_copy(surf1b, 0, 0, surf1);
    surface_copy(surf2b, 0, 0, surf2);
    surface_copy(surf3b, 0, 0, surf3);
    var yloc = 96;
    var xloc = 384;
    var xspace = 176;
    if (crtinit == 0)
    {
        crtinit = 1;
        for (var i = 0; i < 3; i++)
        {
            with (instance_create(xloc + (xspace * i), yloc, obj_board_screen))
                screenheight = 160;
        }
        with (obj_board_screen)
            depth = other.depth - 1;
    }
    if (shuffle == 0)
    {
        if (surface_exists(surf1b))
            draw_surface(surf1b, xloc + (xspace * 1), yloc);
        if (surface_exists(surf2b))
            draw_surface(surf2b, xloc + (xspace * 0), yloc);
        if (surface_exists(surf3b))
            draw_surface(surf3b, xloc + (xspace * 2), yloc);
    }
    else
    {
        if (surface_exists(surf2b))
            draw_surface(surf2b, xloc + (xspace * 1), yloc);
        if (surface_exists(surf1b))
            draw_surface(surf1b, xloc + (xspace * 0), yloc);
        if (surface_exists(surf3b))
            draw_surface(surf3b, xloc + (xspace * 2), yloc);
    }
}
if (room == room_dw_puzzlecloset_2)
{
    if (!surface_exists(surf1))
        surf1 = surface_create(vwid, vhei);
    if (!surface_exists(surf1b))
        surf1b = surface_create(vwid, vhei);
    if (view_get_surface_id(1) != surf1)
        view_set_surface_id(1, surf1);
    surface_copy(surf1b, 0, 0, surf1);
    if (!surface_exists(surf2))
        surf2 = surface_create(vwid, vhei);
    if (!surface_exists(surf2b))
        surf2b = surface_create(vwid, vhei);
    if (view_get_surface_id(2) != surf2)
        view_set_surface_id(2, surf2);
    surface_copy(surf2b, 0, 0, surf2);
    if (!surface_exists(surf3))
        surf3 = surface_create(vwid, vhei);
    if (!surface_exists(surf3b))
        surf3b = surface_create(vwid, vhei);
    if (view_get_surface_id(3) != surf3)
        view_set_surface_id(3, surf3);
    surface_copy(surf3b, 0, 0, surf3);
    if (!surface_exists(surf4))
        surf4 = surface_create(vwid, vhei);
    if (!surface_exists(surf4b))
        surf4b = surface_create(vwid, vhei);
    if (view_get_surface_id(4) != surf4)
        view_set_surface_id(4, surf4);
    surface_copy(surf4b, 0, 0, surf4);
    if (!surface_exists(surf5))
        surf5 = surface_create(vwid, vhei);
    if (!surface_exists(surf5b))
        surf5b = surface_create(vwid, vhei);
    if (view_get_surface_id(5) != surf5)
        view_set_surface_id(5, surf5);
    surface_copy(surf5b, 0, 0, surf5);
    if (!surface_exists(surf6))
        surf6 = surface_create(vwid, vhei);
    if (!surface_exists(surf6b))
        surf6b = surface_create(vwid, vhei);
    if (view_get_surface_id(6) != surf6)
        view_set_surface_id(6, surf6);
    surface_copy(surf6b, 0, 0, surf6);
    var xloc = 448;
    var yloc = 32;
    var xspace = 192;
    var yspace = 160;
    if (crtinit == 0)
    {
        crtinit = 1;
        for (var i = 0; i < 3; i++)
        {
            instance_create(xloc + (xspace * i), yloc, obj_board_screen);
            instance_create(xloc + (xspace * i), yloc + yspace, obj_board_screen);
        }
        with (obj_board_screen)
            screenwidth = 160;
        with (obj_board_screen)
            depth = other.depth - 1;
    }
    if (shuffle == 0)
    {
        if (surface_exists(surf1b))
            draw_surface(surf1b, xloc + (xspace * 0), yloc + (yspace * 0));
        if (surface_exists(surf2b))
            draw_surface(surf2b, xloc + (xspace * 1), yloc + (yspace * 0));
        if (surface_exists(surf3b))
            draw_surface(surf3b, xloc + (xspace * 2), yloc + (yspace * 0));
        if (surface_exists(surf4b))
            draw_surface(surf4b, xloc + (xspace * 0), yloc + (yspace * 1));
        if (surface_exists(surf5b))
            draw_surface(surf5b, xloc + (xspace * 1), yloc + (yspace * 1));
        if (surface_exists(surf6b))
            draw_surface(surf6b, xloc + (xspace * 2), yloc + (yspace * 1));
    }
    else
    {
        if (surface_exists(surf5b))
            draw_surface(surf5b, xloc + (xspace * 0), yloc + (yspace * 0));
        if (surface_exists(surf1b))
            draw_surface(surf1b, xloc + (xspace * 1), yloc + (yspace * 0));
        if (surface_exists(surf4b))
            draw_surface(surf4b, xloc + (xspace * 2), yloc + (yspace * 0));
        if (surface_exists(surf6b))
            draw_surface(surf6b, xloc + (xspace * 0), yloc + (yspace * 1));
        if (surface_exists(surf2b))
            draw_surface(surf2b, xloc + (xspace * 1), yloc + (yspace * 1));
        if (surface_exists(surf3b))
            draw_surface(surf3b, xloc + (xspace * 2), yloc + (yspace * 1));
    }
}
if (room == room_dw_puzzlecloset_3)
{
    if (!surface_exists(surf1))
        surf1 = surface_create(vwid, vhei);
    if (!surface_exists(surf1b))
        surf1b = surface_create(vwid, vhei);
    if (view_get_surface_id(1) != surf1)
        view_set_surface_id(1, surf1);
    surface_copy(surf1b, 0, 0, surf1);
    var xloc = 524;
    var yloc = 32;
    if (crtinit == 0)
    {
        crtinit = 1;
        instance_create(xloc, yloc, obj_board_screen);
        with (obj_board_screen)
        {
            screenwidth = 384;
            screenheight = 256;
            depth = other.depth - 1;
        }
    }
    if (surface_exists(surf1b))
        draw_surface(surf1b, xloc, yloc);
}
draw_set_color(c_white);
