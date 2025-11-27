var cx = camerax();
var cy = cameray();
var lineLength = 0.0125;
if (scr_is_switch_os())
{
    var count = 0;
    with (obj_shadowman_enemy)
    {
        if (myattackchoice == 1)
            count++;
    }
    lineLength = 0.0125;
    if (count == 2)
        lineLength = 0.018750000000000003;
    if (count == 3)
        lineLength = 0.025;
}
if (!optimized_draw || image_alpha >= 1)
{
    if (optimized_draw)
    {
        surface_set_target(surf);
        draw_clear_alpha(c_black, 0);
    }
    var i = min(loopStart, 1);
    while (i > 0)
    {
        firstColor = merge_color(c_red, c_gray, colorProgress);
        if (colorProgress < 1)
            colorProgress += 0.05;
        secondColor = merge_color(c_red, c_gray, colorProgress);
        x1 = path_get_x(mypath, i);
        y1 = path_get_y(mypath, i);
        x2 = path_get_x(mypath, i - lineLength);
        y2 = path_get_y(mypath, i - lineLength);
        var _x1 = x1;
        var _y1 = y1;
        var _x2 = x2;
        var _y2 = y2;
        if (snapshot || optimized_draw)
        {
            x1 -= cx;
            y1 -= cy;
            x2 -= cx;
            y2 -= cy;
        }
        draw_line_color(x1, y1, x2, y2, firstColor, secondColor);
        if (draw_style >= 2)
        {
            var _gap1;
            if (i >= 0.25)
                _gap1 = lerp(5, 8, scr_ease_in(clamp(scr_inverselerp(0.25, 1, i), 0, 1), 2));
            else
                _gap1 = lerp(2, 5, scr_ease_out(clamp(scr_inverselerp(0, 0.25, i), 0, 1), 2));
            var _gap2;
            if ((i - lineLength) >= 0.25)
                _gap2 = lerp(5, 8, scr_ease_in(clamp(scr_inverselerp(0.25, 1, i - lineLength), 0, 1), 2));
            else
                _gap2 = lerp(2, 5, scr_ease_out(clamp(scr_inverselerp(0, 0.25, i - lineLength), 0, 1), 2));
            if (!fancy_staff)
            {
            }
            else
            {
                var _dir1;
                if (i == 1)
                    _dir1 = point_direction(x1, y1, x2, y2) + 90;
                else
                    _dir1 = point_direction(path_get_x(mypath, i + lineLength), path_get_y(mypath, i + lineLength), _x2, _y2) + 90;
                var _dir2;
                if (i == lineLength)
                    _dir2 = 90;
                else
                    _dir2 = point_direction(_x1, _y1, path_get_x(mypath, i - (lineLength * 2)), path_get_y(mypath, i - (lineLength * 2))) + 90;
                var _xx1 = lengthdir_x(_gap1, _dir1);
                var _yy1 = lengthdir_y(_gap1, _dir1);
                var _xx2 = lengthdir_x(_gap2, _dir2);
                var _yy2 = lengthdir_y(_gap2, _dir2);
                draw_line_color(x1 - (_xx1 * 2), y1 - (_yy1 * 2), x2 - (_xx2 * 2), y2 - (_yy2 * 2), firstColor, secondColor);
                draw_line_color(x1 - (_xx1 * 1), y1 - (_yy1 * 1), x2 - (_xx2 * 1), y2 - (_yy2 * 1), firstColor, secondColor);
                draw_line_color(x1 + (_xx1 * 1), y1 + (_yy1 * 1), x2 + (_xx2 * 1), y2 + (_yy2 * 1), firstColor, secondColor);
                draw_line_color(x1 + (_xx1 * 2), y1 + (_yy1 * 2), x2 + (_xx2 * 2), y2 + (_yy2 * 2), firstColor, secondColor);
                if ((i % 0.05) < lineLength || (i % 0.05) > 0.0375)
                    draw_line_color(x1 - (_xx1 * 2), y1 - (_yy1 * 2), x1 + (_xx2 * 2), y1 + (_yy2 * 2), firstColor, firstColor);
            }
        }
        i -= lineLength;
    }
    if (optimized_draw)
        surface_reset_target();
}
if (optimized_draw)
    draw_surface_ext(surf, cx, cy, 1, 1, 0, c_white, image_alpha);
