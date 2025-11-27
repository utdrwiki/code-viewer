if (scr_debug() && keyboard_check_pressed(ord("V")))
    dodraw = !dodraw;
if (!dodraw)
    exit;
draw_self();
