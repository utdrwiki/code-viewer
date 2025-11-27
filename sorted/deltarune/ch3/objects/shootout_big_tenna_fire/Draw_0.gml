if (!i_ex(obj_shootout_controller))
{
    instance_destroy();
    exit;
}
var chosen_window = obj_shootout_controller.windows[0][0];
if (pattern == 0)
{
    timer++;
    if (timer == 10)
        instance_create(chosen_window.x, chosen_window.y, obj_shootout_tenna_reticle);
}
siner++;
y = ystart + (sin(siner / 6) * 3);
draw_self();
