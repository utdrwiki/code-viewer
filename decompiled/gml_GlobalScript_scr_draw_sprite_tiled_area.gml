scr_draw_sprite_tiled_area = function() //gml_Script_scr_draw_sprite_tiled_area
{
    var sprite = argument[0]
    var subimg = argument[1]
    var xx = argument[2]
    var yy = argument[3]
    var x1 = argument[4]
    var y1 = argument[5]
    var x2 = argument[6]
    var y2 = argument[7]
    var xscale = argument[8]
    var yscale = argument[9]
    var col = (argument_count > 10 ? argument[10] : c_white)
    var alpha = (argument_count > 11 ? argument[11] : 1)
    var sw = (sprite_get_width(sprite) * xscale)
    var sh = (sprite_get_height(sprite) * yscale)
    var i = ((x1 - ((x1 % sw) - (xx % sw))) - (sw * (x1 % sw) < (xx % sw)))
    var j = ((y1 - ((y1 % sh) - (yy % sh))) - (sh * (y1 % sh) < (yy % sh)))
    var jj = j
    while (i <= x2)
    {
        while (j <= y2)
        {
            if (i <= x1)
                var left = (x1 - i)
            else
                left = 0
            var X = (i + left)
            if (j <= y1)
                var top = (y1 - j)
            else
                top = IMAGE_LOGO
            var Y = (j + top)
            if (x2 <= (i + sw))
                var width = (((sw - ((i + sw) - x2)) + 1) - left)
            else
                width = (sw - left)
            if (y2 <= (j + sh))
                var height = (((sh - ((j + sh) - y2)) + 1) - top)
            else
                height = (sh - top)
            draw_sprite_part_ext(sprite, subimg, left, top, width, height, X, Y, xscale, yscale, col, alpha)
            j += sh
        }
        j = jj
        i += sw
    }
    return 0;
}

