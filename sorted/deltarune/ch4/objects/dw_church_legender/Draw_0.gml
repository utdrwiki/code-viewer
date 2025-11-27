xx = lerp(xx, camerax() + relx, 0.4);
yy = lerp(yy, cameray() + rely, 0.4);
var xsin = 0;
var ysin = cos(siner / 12) * 4;
draw_sprite_ext(sprite_index, image_index, xx + xsin, yy + ysin, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
var spacer = 3;
var rate = 24;
for (var i = 1; i < 4; i++)
    draw_sprite_ext(sprite_index, image_index, xx + xsin + (sin(activetimer / rate) * spacer * i), yy + ysin + (cos(activetimer / rate) * spacer * i), image_xscale, image_yscale, image_angle, image_blend, image_alpha / 5);
if (image_only)
    exit;
draw_set_color(c_white);
draw_set_font(fnt_mainbig);
draw_set_alpha(image_alpha);
var ver = 1;
if (ver == 0)
{
    for (var i = 0; i < stringmax; i++)
    {
        if (activetimer >= textstartwait[i])
        {
            textactivetimer[i]++;
            var stringlength = string_length(textstring[i]);
            for (var j = 1; j <= textchar[i]; j++)
            {
                var chary = 0;
                rate = 6;
                if (textactivetimer[i] < ((textrate[i] * j) + rate))
                    chary = textactivetimer[i] - ((textrate[i] * j) + rate);
                var xdraw = (xx + (j * charspace) + textx[i]) - (sin(chary / rate) * 16);
                var ydraw = (yy + texty[i] + chary) - ysin - j;
                draw_set_alpha((1 + (chary / 4)) * image_alpha * 0.5);
                draw_set_color(c_darkblue);
                for (var n = 3; n < 5; n++)
                    draw_text(xdraw + n, ydraw + n, string_char_at(textstring[i], j));
                draw_set_alpha((1 + (chary / 4)) * image_alpha * 0.8);
                draw_set_color(c_white);
                draw_text(xdraw, ydraw, string_char_at(textstring[i], j));
                draw_set_alpha((1 + (chary / 4)) * image_alpha * 0.3);
                draw_text(xdraw - 1, ydraw, string_char_at(textstring[i], j));
                draw_set_alpha(image_alpha);
            }
            texttimer[i]++;
            if (texttimer[i] >= textrate[i])
            {
                if (textchar[i] < stringlength)
                    textchar[i]++;
                texttimer[i] = 0;
            }
        }
    }
}
if (ver == 1)
{
    for (var i = 0; i < stringmax; i++)
    {
        if (activetimer >= textstartwait[i])
        {
            var stringlength = string_length(textstring[i]);
            textactivetimer[i]++;
            var delay = i * 30;
            var xdraw = xx + textx[i];
            var ydraw = yy + texty[i] + (sin(siner / 24) * 4);
            var count = 8;
            var truetimer = textactivetimer[i] - delay;
            for (var j = 0; j < count; j++)
            {
                for (var k = 0; k < count; k++)
                {
                    alph = clamp((truetimer / 40) - (k / 4), 0, 0.2) * image_alpha;
                    draw_set_alpha(alph);
                    var shadcolor = merge_color(c_black, c_darkblue, clamp(alph * 10, 0, 1));
                    draw_set_color(shadcolor);
                    var rotspeed = 4;
                    var startdist = 20;
                    var len = clamp(startdist - truetimer, 2, startdist);
                    var xd2 = xdraw + lengthdir_x(len + (k / 4), (j * (360 / count)) + (truetimer * rotspeed));
                    var yd2 = ydraw + lengthdir_y(len + (k / 4), (j * (360 / count)) + (truetimer * rotspeed)) + (k / 4);
                    var maxdist = 12;
                    var amt = clamp(maxdist - truetimer, 4, maxdist);
                    draw_text(xd2, yd2, textstring[i]);
                }
            }
            var alph = clamp(truetimer / 30, 0, 1) * image_alpha;
            draw_set_color(#94A9DC);
            draw_set_alpha((alph / 2) * sin((truetimer + 12) / 12));
            draw_text(xdraw - 1, ydraw - 1, textstring[i]);
            draw_set_alpha((alph / 2) * sin((truetimer + 24) / 12));
            draw_text(xdraw + 1, ydraw - 1, textstring[i]);
            draw_set_alpha((alph / 2) * sin((truetimer + 36) / 12));
            draw_text(xdraw + 1, ydraw + 1, textstring[i]);
            draw_set_alpha((alph / 2) * sin((truetimer + 48) / 12));
            draw_text(xdraw - 1, ydraw + 1, textstring[i]);
            draw_set_alpha(alph);
            draw_set_color(c_white);
            draw_text(xdraw, ydraw, textstring[i]);
            texttimer[i]++;
            if (texttimer[i] >= textrate[i])
            {
                if (textchar[i] < stringlength)
                    textchar[i]++;
                texttimer[i] = 0;
            }
        }
    }
}
draw_set_alpha(1);
