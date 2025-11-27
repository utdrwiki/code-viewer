if (init == 0)
{
    for (var i = 0; i < width; i++)
    {
        for (var j = 0; j < height; j++)
        {
            screensprite[i][j] = 4933;
            screencon[i][j] = 0;
            screentimer[i][j] = floor(random(100) - 100);
            screencolor[i][j] = c_white;
            var myimage = choose(0, 2, 4);
            screenimage[i][j] = myimage;
            if (myimage == 0)
                screencolor[i][j] = merge_color(c_red, c_white, 0.5);
            if (myimage == 2)
                screencolor[i][j] = c_yellow;
            if (myimage == 4)
                screencolor[i][j] = c_aqua;
            screenimageoffset[i][j] = 0;
        }
    }
    init = 1;
}
timer++;
image_xscale = 2;
image_yscale = 2;
var tvheight = 40 * image_yscale;
var tvwidth = 40 * image_xscale;
var xx = x;
var yy = y;
draw_set_blend_mode(bm_add);
for (var i = 0; i < width; i++)
{
    for (var j = 0; j < height; j++)
    {
        if (mode == 0)
        {
            if (screencon[i][j] == 0)
            {
                screentimer[i][j]++;
                if ((abs(screentimer[i][j]) % 8) == 0)
                {
                    if (screenimageoffset[i][j] == 0)
                        screenimageoffset[i][j] = 1;
                    else
                        screenimageoffset[i][j] = 0;
                }
                if (screentimer[i][j] >= 120)
                {
                    screentimer[i][j] = 0;
                    screencon[i][j] = 1;
                    screensprite[i][j] = 3996;
                    screenimage[i][j] = 0;
                    screencolor[i][j] = c_white;
                    screenimageoffset[i][j] = 0;
                }
            }
            if (screencon[i][j] == 1)
            {
                screentimer[i][j]++;
                if ((screentimer[i][j] % 2) == 0)
                {
                    if (screenimageoffset[i][j] == 0)
                        screenimageoffset[i][j] = 1;
                    else
                        screenimageoffset[i][j] = 0;
                }
                if (screentimer[i][j] >= 15)
                {
                    screentimer[i][j] = -100 + floor(random(100));
                    screencon[i][j] = 0;
                    screensprite[i][j] = 4933;
                    var myimage = choose(0, 2, 4);
                    screenimage[i][j] = myimage;
                    if (myimage == 0)
                        screencolor[i][j] = merge_color(c_red, c_white, 0.5);
                    if (myimage == 2)
                        screencolor[i][j] = c_yellow;
                    if (myimage == 4)
                        screencolor[i][j] = c_aqua;
                    screenimageoffset[i][j] = 0;
                }
            }
        }
        draw_sprite_ext(screensprite[i][j], screenimage[i][j] + screenimageoffset[i][j], x + (i * tvwidth), y + (j * tvheight), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    }
}
draw_set_blend_mode(bm_normal);
if (mode == 1)
{
    draw_set_color(c_blue);
    draw_rectangle(xx, yy, (xx + (tvwidth * width)) - 2, (yy + (tvheight * height)) - 2, false);
    draw_set_color(c_white);
    quizstring = stringsetloc("What is the capital of my ass?\n\n A- FUNKYTOWN\n B- DUNKYTOWN", "obj_dw_teevie_tvtest_slash_Draw_0_gml_112_0");
    draw_set_font(fnt_8bit);
    draw_text_ext(xx + 20, yy + 30, quizstring, 20, (tvwidth * width) - 20);
}
for (var i = 0; i < width; i++)
{
    for (var j = 0; j < height; j++)
    {
        draw_sprite_ext(tvbasesprite, 4, x + (i * tvwidth), y + (j * tvheight), image_xscale, image_yscale, image_angle, c_white, image_alpha);
        draw_sprite_ext(tvbasesprite, 1, x + (i * tvwidth), y + (j * tvheight), image_xscale, image_yscale, image_angle, merge_color(tvbasecolor, screencolor[i][j], 0.6 + (sin((timer / 4) + i + j) * 0.1)), image_alpha);
        draw_sprite_ext(tvbasesprite, 2, x + (i * tvwidth), y + (j * tvheight), image_xscale, image_yscale, image_angle, merge_color(tvbasecolor, c_black, 0.5), image_alpha);
        draw_sprite_ext(tvbasesprite, 3, x + (i * tvwidth), y + (j * tvheight), image_xscale, image_yscale, image_angle, tvbasecolor, image_alpha);
        draw_sprite_ext(tvbasesprite, 5, x + (i * tvwidth), y + (j * tvheight), image_xscale, image_yscale, image_angle, c_white, image_alpha);
    }
}
