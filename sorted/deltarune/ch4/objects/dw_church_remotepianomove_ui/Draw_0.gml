with (obj_dw_church_remotepianomove)
{
    y += yoffset;
    var litblue = 15109481;
    if (view_current == 0)
    {
        siner++;
        var alphtarg = 0;
        if (engaged)
            alphtarg = 1;
        alpha = lerp(alpha, alphtarg, 0.1);
        if (global.flag[1538] == 0 && !final)
        {
            alpha = 0;
            makenote = 0;
        }
        drawspace = 18;
        drawx = lerp(drawx, x + 40, 0.6);
        drawy = lerp(drawy, y - 70, 0.6);
        draw_set_alpha(alpha * 0.5);
        d_circle_color(drawx, drawy, 44 + (sin(siner / 64) * 2), 0, 0, 0);
        draw_set_alpha(1);
        var sprangle = 0;
        var scale = 2;
        var spr = 2663;
        var circlespr = 4059;
        var arrowspr = 5251;
        var _space = 28;
        var sinstrength = 3;
        var sintimevar = 15;
        var sintimevariance = 3;
        var basealpha = 0.35;
        soundtoplay = 0;
        if (movedir == 0)
            soundtoplay = 3;
        if (movedir == 1)
            soundtoplay = 5;
        if (movedir == 2)
            soundtoplay = 7;
        if (movedir == 3)
            soundtoplay = 1;
        var bonusalpha = 0;
        var xloc = drawx + _space;
        var sinmod = (1/3) * sintimevar;
        var yloc = ((drawy + 2) - 8) + (sin((siner + sinmod) / sintimevar) * sinstrength);
        var angle = 90;
        var xscale = 2;
        var yscale = 2;
        if (soundtoplay == 5)
        {
            bonusalpha = 0.5;
            if (button1_p() && makenote == 1)
            {
                makenote = 0;
                with (scr_marker_ext(xloc, yloc, arrowspr, xscale, yscale, undefined, undefined, litblue, depth - 1))
                {
                    image_angle = angle;
                    var lifetime = 20;
                    direction = angle - 90;
                    speed = 5;
                    friction = 0.35;
                    scr_lerpvar("image_alpha", 1, 0, lifetime, 2, "out");
                    scr_doom(id, lifetime);
                }
                with (scr_marker_ext(xloc, yloc, arrowspr, xscale, yscale, undefined, undefined, c_white, depth - 2))
                {
                    image_angle = angle;
                    var lifetime = 10;
                    scr_lerpvar("image_alpha", 2, 0, lifetime, 2, "out");
                    scr_doom(id, lifetime);
                }
            }
        }
        draw_sprite_ext(arrowspr, 0, xloc, yloc, xscale, yscale, angle, litblue, (basealpha + bonusalpha) * alpha);
        bonusalpha = 0;
        xloc = drawx - _space;
        sinmod = (2/3) * sintimevar;
        yloc = drawy + 2 + 8 + (sin((siner + sinmod) / sintimevar) * sinstrength);
        xscale = -2;
        yscale = 2;
        angle = 270;
        if (soundtoplay == 1)
        {
            bonusalpha = 0.5;
            if (button1_p() && makenote == 1)
            {
                makenote = 0;
                with (scr_marker_ext(xloc, yloc, arrowspr, xscale, yscale, undefined, undefined, litblue, depth - 1))
                {
                    image_angle = angle;
                    var lifetime = 20;
                    direction = angle - 90;
                    speed = 5;
                    friction = 0.35;
                    scr_lerpvar("image_alpha", 1, 0, lifetime, 2, "out");
                    scr_doom(id, lifetime);
                }
                with (scr_marker_ext(xloc, yloc, arrowspr, xscale, yscale, undefined, undefined, c_white, depth - 2))
                {
                    image_angle = angle;
                    var lifetime = 10;
                    scr_lerpvar("image_alpha", 2, 0, lifetime, 2, "out");
                    scr_doom(id, lifetime);
                }
            }
        }
        draw_sprite_ext(spr_arrow_9x9, 0, xloc, yloc, -2, 2, angle, litblue, (basealpha + bonusalpha) * alpha);
        bonusalpha = 0;
        xloc = drawx + 2;
        sinmod = 1 * sintimevar;
        yloc = (drawy - _space) + (sin((siner + sinmod) / sintimevar) * sinstrength);
        xscale = 2;
        yscale = 2;
        angle = 180;
        if (soundtoplay == 7)
        {
            bonusalpha = 0.5;
            if (button1_p() && makenote == 1)
            {
                makenote = 0;
                with (scr_marker_ext(xloc, yloc, arrowspr, xscale, yscale, undefined, undefined, litblue, depth - 1))
                {
                    image_angle = angle;
                    var lifetime = 20;
                    direction = angle - 90;
                    speed = 5;
                    friction = 0.35;
                    scr_lerpvar("image_alpha", 1, 0, lifetime, 2, "out");
                    scr_doom(id, lifetime);
                }
                with (scr_marker_ext(xloc, yloc, arrowspr, xscale, yscale, undefined, undefined, c_white, depth - 2))
                {
                    image_angle = angle;
                    var lifetime = 10;
                    scr_lerpvar("image_alpha", 2, 0, lifetime, 2, "out");
                    scr_doom(id, lifetime);
                }
            }
        }
        draw_sprite_ext(spr_arrow_9x9, 0, xloc, yloc, 2, 2, angle, litblue, (basealpha + bonusalpha) * alpha);
        bonusalpha = 0;
        xloc = drawx;
        sinmod = (4/3) * sintimevar;
        yloc = drawy + _space + (sin((siner + sinmod) / sintimevar) * sinstrength);
        xscale = 2;
        yscale = 2;
        angle = 0;
        if (soundtoplay == 3)
        {
            bonusalpha = 0.5;
            if (button1_p() && makenote == 1)
            {
                makenote = 0;
                with (scr_marker_ext(xloc, yloc, arrowspr, xscale, yscale, undefined, undefined, litblue, depth - 1))
                {
                    image_angle = angle;
                    var lifetime = 20;
                    direction = angle - 90;
                    speed = 5;
                    friction = 0.35;
                    scr_lerpvar("image_alpha", 1, 0, lifetime, 2, "out");
                    scr_doom(id, lifetime);
                }
                with (scr_marker_ext(xloc, yloc, arrowspr, xscale, yscale, undefined, undefined, c_white, depth - 2))
                {
                    image_angle = angle;
                    var lifetime = 10;
                    scr_lerpvar("image_alpha", 2, 0, lifetime, 2, "out");
                    scr_doom(id, lifetime);
                }
            }
        }
        draw_sprite_ext(spr_arrow_9x9, 0, xloc, yloc, xscale, yscale, angle, litblue, (basealpha + bonusalpha) * alpha);
        bonusalpha = 0;
        xloc = drawx;
        sinmod = 1.6666666666666667 * sintimevar;
        yloc = drawy + (sin((siner + sinmod) / sintimevar) * sinstrength);
        xscale = 2;
        yscale = 2;
        angle = 0;
        if (soundtoplay == 0)
        {
            bonusalpha = 0.5;
            if (button1_p() && makenote == 1)
            {
                makenote = 0;
                with (scr_marker_ext(xloc, yloc, circlespr, xscale, yscale, undefined, undefined, c_white, depth - 2))
                {
                    image_angle = angle;
                    var lifetime = 10;
                    scr_lerpvar("image_alpha", 2, 0, lifetime, 2, "out");
                    scr_doom(id, lifetime);
                }
            }
        }
        draw_sprite_ext(spr_circle_7x7, 0, xloc, yloc, xscale, yscale, 0, litblue, (basealpha + bonusalpha) * alpha);
    }
    y -= yoffset;
}
