sax_animation.image_speed = 0;
if (draw_style == 0)
    exit;
if (progressLoop < pathLifetime)
    draw_set_alpha(1);
else
    draw_set_alpha((pathLifetime + 1) - progressLoop);
colorProgress = 0;
if (progressLoop > 1)
{
    if (progressLoop > 2)
        colorProgress = 1;
    else
        colorProgress = progressLoop - 1;
}
var _alpha = draw_get_alpha();
if (_alpha > 0)
    draw_set_alpha(clamp01(_alpha + 0.5));
scr_debug_print("note alpha is " + string(draw_get_alpha()));
snapshot = true;
event_user(7);
snapshot = false;
progressLoop = max(progressLoop, pathLifetime);
draw_set_alpha(1);
