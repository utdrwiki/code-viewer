if (!init)
    exit;
if (camera.init == 2)
    scr_draw_zoom_cam(camera, x, y, size.x, size.y, 0, 16777215, 1);
if (i_ex(obj_debug_xy))
    draw_self();
