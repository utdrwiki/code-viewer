if (timer < 11)
    exit;
if (!surface_exists(afterimage))
    afterimage = surface_create(640, 480);
else
    draw_surface_ext(afterimage, 0, 0, 1, 1, 0, c_white, 0.5);
surface_copy(afterimage, 0, 0, application_surface);
