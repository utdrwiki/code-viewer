timer++;
image_speed = 0;
image_alpha = 0;
var flashthreshold = 30;
if (mode == 0)
{
    if ((timer % flashthreshold) == 0)
    {
        image_index++;
        for (var _i = 0; _i < 3; _i++)
        {
            var _a = scr_afterimage();
            _a.image_index = image_index;
            _a.image_alpha = 0.8;
            _a.fadeSpeed = 0.02 + (_i / 100);
            _a.depth = depth - 1;
            _a.x += (_i * 2) - 2;
            _a.y += (_i * 2) - 2;
        }
    }
}
if (mode == 1)
{
    if ((timer % 12) == 0)
    {
        x = xstart + (count * 16);
        y = ystart + (sin(timer / 40) * 10);
        image_index = count * 4;
        var _t = scr_afterimage();
        _t.image_speed = 0.2;
        _t.sprite_index = spr_tenna_dance_cabbage;
        _t.image_blend = make_color_hsv(timer % 255, 255, 255);
        _t.image_alpha = 0.6;
        _t.image_xscale = 0.5;
        _t.image_yscale = 0.5;
        _t.fadeSpeed = 0.01;
        _t.depth = depth - count;
        count++;
    }
    if (timer >= 120)
    {
        timer = 0;
        count = 0;
    }
}
