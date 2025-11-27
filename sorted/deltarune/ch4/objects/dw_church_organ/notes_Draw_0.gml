with (obj_dw_church_organ)
{
    var cx = camerax();
    var cy = cameray();
    var col_def = 12627245;
    var col_sel = 15007690;
    masteralpha = lerp(masteralpha, engaged, 0.125);
    if (!variable_instance_exists(id, "siner"))
        siner = 0;
    if (view_current == 0)
        siner++;
    var yy = cy + 40;
    var bgcol = 0;
    var alph = 0.9 * masteralpha;
    var barheight = 80;
    draw_sprite_ext(spr_gradient20, 0, cx, yy, 32, 1, 0, bgcol, alph);
    draw_sprite_ext(spr_pxwhite, 0, cx, yy, 640, barheight, 0, bgcol, alph);
    draw_sprite_ext(spr_gradient20, 0, cx, yy + barheight, 32, -1, 0, bgcol, alph);
    var whole = 2848;
    var outline = 1294;
    var arrows = whole;
    if (button3_h())
        arrows = outline;
    var makeswitch = 0;
    if (button3_p())
        makeswitch = 1;
    if (global.input_released[6] || global.input_released[9])
        makeswitch = 2;
    var facing = [];
    array_push(facing, [0, 3, 0]);
    array_push(facing, [1, 0, 5]);
    array_push(facing, [0, 1, 4]);
    array_push(facing, [0, 0, 3]);
    array_push(facing, [3, 1, 2]);
    array_push(facing, [3, 0, 1]);
    array_push(facing, [2, 1, 8]);
    array_push(facing, [2, 0, 7]);
    array_push(facing, [0, 2, -1]);
    var xspace = 64;
    var xloc = (cx + 320) - ((xspace * 8) / 2);
    var yloc = yy + 40;
    for (var i = 0; i < 9; i++)
    {
        var myx = xloc + (xspace * i);
        var myy = yloc + (sin((siner + (i * 4)) / 8) * 4);
        var col = col_def;
        if (facing[i][2] == soundtoplay)
        {
            col = col_sel;
            if (makenote)
            {
                with (scr_marker_ext(myx, myy, arrows, 2, 2, undefined, facing[i][1], undefined, depth - 1))
                {
                    image_blend = col_sel;
                    image_angle = 90 * facing[i][0];
                    var lifetime = 20;
                    scr_lerpvar("image_alpha", 1, 0, lifetime);
                    direction = (facing[i][2] + 3) * 45;
                    speed = 1;
                    if (other.soundtoplay == 0)
                    {
                        speed = 0;
                        scr_lerpvar("image_xscale", image_xscale, image_xscale * 1.5, lifetime, 2, "out");
                        scr_lerpvar("image_yscale", image_xscale, image_xscale * 1.5, lifetime, 2, "out");
                    }
                    scr_doom(id, lifetime);
                }
                makenote = false;
            }
        }
        if (i == 8 && button3_h())
            col = col_sel;
        draw_sprite_ext(arrows, facing[i][1], myx, myy, 2, 2, 90 * facing[i][0], col, masteralpha * 2);
        if (makeswitch)
        {
            var which = whole;
            if (makeswitch == 2)
                which = outline;
            with (scr_marker_ext(myx, myy, which, 2, 2, 0, facing[i][1], col, 0))
            {
                var lifetime = 2 + round(i / 2);
                image_angle = 90 * facing[i][0];
                image_alpha = 1 * other.masteralpha;
                scr_lerpvar("image_alpha", image_alpha, 0, lifetime, 2, "in");
                scr_doom(id, lifetime + 1);
            }
            draw_sprite_ext(arrows, facing[i][1], myx, myy, 2, 2, 90 * facing[i][0], col, masteralpha * 2);
        }
    }
    if (scr_debug() && engaged)
    {
    }
    if (scr_debug())
    {
        var space = 8;
        var count = 0;
    }
}
