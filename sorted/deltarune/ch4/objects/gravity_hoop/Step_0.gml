var _vol = obj_mike_controller.microphone_volume / 50;
if (_vol < 0.2)
    _vol = 0;
random_x = random(_vol * 2) * choose(1, -1);
random_y = random(_vol * 2) * choose(1, -1);
score_timer = clamp(score_timer - 1, 0, 100);
image_blend = merge_color(c_red, c_blue, score_timer / 10);
if (_vol > 0.2)
{
    image_xscale = lerp(image_xscale, lerp(0.8, 1.2, _vol), 0.8);
    image_yscale = lerp(image_yscale, lerp(0.8, 1.2, _vol), 0.8);
}
else
{
    image_xscale = lerp(image_xscale, 0.9, 0.8);
    image_yscale = lerp(image_yscale, 0.9, 0.8);
}
x = lerp(x, xstart, 0.25);
