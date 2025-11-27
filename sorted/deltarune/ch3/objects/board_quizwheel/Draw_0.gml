if (init == 0)
{
    pushcon = 1;
    pushamount = 0;
    if (slicetype == 0)
    {
    }
    if (slicetype == 1)
    {
        maxslices = 4 + irandom(12);
        for (i = 0; i < maxslices; i++)
        {
            sliceicon[i] = 3301;
            slicetext[i] = "no. " + string(i);
            slicetextcolor[i] = choose(16777215, 65535, 4235519);
        }
    }
    init = 1;
}
if (keyboard_check_pressed(vk_alt))
    init = 0;
draw_set_color(c_black);
ossafe_fill_rectangle(120, 60, 520, 320, false);
draw_set_color(c_blue);
xx = 340;
yy = 180;
r = 100;
draw_circle(xx, yy, r, false);
draw_set_color(c_black);
siner -= rotationalspeed;
ang = 360 / maxslices;
whichslicechosen = -1;
draw_set_font(fnt_main);
draw_set_halign(fa_right);
if (!surface_exists(slicesurf))
    slicesurf = surface_create(r * 2, r * 2);
var minangle, maxangle;
for (i = 0; i < maxslices; i++)
{
    draw_set_color(c_white);
    finalang = (ang * i) + (ang / 2) + siner;
    var slicechosen = 0;
    minangle = (finalang - (ang / 2)) % 360;
    maxangle = (finalang + (ang / 2)) % 360;
    if (minangle > maxangle)
    {
        slicechosen = 1;
        whichslicechosen = i;
    }
    var selectedcolor = 16777215;
    if (slicechosen)
        selectedcolor = 65535;
    draw_line(xx, yy, xx + lengthdir_x(r, finalang + (ang / 2)), yy + lengthdir_y(r, finalang + (ang / 2)));
    x1 = xx + lengthdir_x(10, finalang + (ang / 2));
    y1 = yy + lengthdir_y(10, finalang + (ang / 2));
    x2 = xx + lengthdir_x(r, finalang - (ang / 2));
    y2 = yy + lengthdir_y(r, finalang - (ang / 2));
    x3 = xx + lengthdir_x(r, finalang + (ang / 2));
    y3 = yy + lengthdir_y(r, finalang + (ang / 2));
    x4 = xx + lengthdir_x(10, finalang - (ang / 2));
    y4 = yy + lengthdir_y(10, finalang - (ang / 2));
    var piecealpha = 1;
    if (pushcon == 1)
    {
        piecealpha = 1;
    }
    else if (pushcon >= 2)
    {
        piecealpha = 0.5;
        if (rotationalspeed < 30)
        {
            if (slicechosen)
                piecealpha = 1;
            else
                piecealpha = (1 / (abs(rotationalspeed * 4) + 1)) + 0.5;
        }
    }
    surface_set_target(slicesurf);
    draw_clear_alpha(c_black, 0);
    draw_primitive_begin(pr_trianglefan);
    draw_set_color(slicebgcolor[i]);
    draw_vertex(r, r);
    var _degreecap = round(ang / 12);
    for (var i2 = 0; i2 <= _degreecap; i2++)
    {
        var _xx = r + lengthdir_x(r, (finalang - (ang / 2)) + lerp(0, ang, i2 / _degreecap));
        var _yy = r + lengthdir_y(r, (finalang - (ang / 2)) + lerp(0, ang, i2 / _degreecap));
        draw_vertex(_xx, _yy);
    }
    draw_primitive_end();
    gpu_set_blendmode_ext_sepalpha(bm_src_alpha, bm_inv_src_alpha, bm_dest_alpha, bm_zero);
    draw_sprite_ext(spr_board_wheel_slice_test_2, i, r, r, 3, 3, finalang, c_white, piecealpha);
    draw_set_blend_mode(bm_normal);
    surface_reset_target();
    draw_surface(slicesurf, xx - r, yy - r);
    if (pushcon >= 3 && (sliceflash % 2 || sliceflash > 8) && slicechosen)
    {
        draw_set_blend_mode(bm_add);
        draw_surface_ext(slicesurf, xx - r, yy - r - 2, 1, 1, 0, c_white, piecealpha / 4);
        draw_surface_ext(slicesurf, (xx - r) + 2, yy - r, 1, 1, 0, c_white, piecealpha / 4);
        draw_surface_ext(slicesurf, xx - r - 2, yy - r, 1, 1, 0, c_white, piecealpha / 4);
        draw_surface_ext(slicesurf, xx - r, (yy - r) + 2, 1, 1, 0, c_white, piecealpha / 4);
        draw_set_blend_mode(bm_normal);
    }
    draw_set_color(slicetextcolor[i]);
    draw_sprite_ext(sliceicon[i], 0, xx + lengthdir_x(r - 20, finalang), yy + lengthdir_y(r - 20, finalang), 2, 2, finalang, c_white, image_alpha);
    draw_sprite_ext(spr_numbersfontbig, i, xx + lengthdir_x(r - 20, finalang), yy + lengthdir_y(r - 20, finalang), 2, 2, finalang, selectedcolor, image_alpha / 4);
    draw_text_transformed(xx + lengthdir_x(80, finalang + 8), yy + lengthdir_y(80, finalang + 8), slicetext[i], 1, 1, finalang);
}
for (i = 0; i < maxslices; i++)
{
    finalang = (ang * i) + (ang / 2) + siner;
    draw_set_color(c_white);
    draw_line_width(xx, yy, xx + lengthdir_x(r, finalang - (ang / 2)), yy + lengthdir_y(r, finalang - (ang / 2)), 4);
}
draw_sprite_ext(spr_ch3_wheel_center, 3, xx, yy, 1, 1, finalang, c_white, 1);
draw_set_halign(fa_left);
rotationalspeed = clamp(rotationalspeed - rotationalfriction, 0, 999);
if (pushcon == 1)
{
    if (button1_h())
    {
        pushsiner++;
        pushamount = abs(sin(pushsiner / 8)) * 100;
        meterfill = pushamount;
        spinready = 1;
    }
    else if (!button1_h() && spinready == 1)
    {
        pushsiner = 0;
        pushcon = 2;
        idealrotationalspeed = rotationalspeed + 4 + (pushamount / 5) + (8 / maxslices);
        if (idealrotationalspeed > 30)
            idealrotationalspeed = 30;
        scr_lerpvar("rotationalspeed", rotationalspeed, idealrotationalspeed, 3, 1, "out");
        rotationalfriction = 0.2 + (idealrotationalspeed / 100);
        pushamount = 0;
    }
    else
    {
        meterfill = 0;
        pushamount = 0;
    }
}
else
{
    meterfill = scr_movetowards(meterfill, 0, 20);
}
draw_sprite(spr_ch3_wheel_power_meter, 0, xx + 64, yy);
surface_set_target(slicesurf);
draw_clear_alpha(c_black, 0);
draw_set_blend_mode(bm_normal);
draw_sprite(spr_ch3_wheel_power_meter, 1, 64, r);
gpu_set_blendmode(bm_subtract);
draw_primitive_begin(pr_trianglefan);
draw_set_color(c_white);
draw_vertex(0, r);
for (var i2 = 0; i2 <= 4; i2++)
{
    var _xx = lengthdir_x(r * 2, lerp(45, -50, (1 - (meterfill / 100)) * (i2 / 4)));
    var _yy = r + lengthdir_y(r * 2, lerp(45, -50, (1 - (meterfill / 100)) * (i2 / 4)));
    draw_vertex(_xx, _yy);
}
draw_primitive_end();
draw_set_blend_mode(bm_normal);
surface_reset_target();
draw_surface(slicesurf, xx, yy - r);
if (pushcon == 2)
{
    pushsiner++;
    if (pushsiner > 5)
    {
        if (abs(rotationalspeed) < 0.5)
        {
            rotationalfriction = 0.1;
            pushcon = 3;
            pushsiner = 0;
        }
    }
}
if (pushcon >= 3)
{
    pushsiner++;
    if (abs((finalang - (ang / 2)) % ang) < 3 || abs((finalang - (ang / 2)) % ang) > (ang - 3))
    {
        rotationalfriction = 0.05;
        rotationalspeed += 0.06;
    }
    else if (abs(rotationalspeed) < 0.2 && pushcon == 3)
    {
        pushcon = 4;
    }
    else if (pushcon == 4)
    {
        sliceflash++;
        if (sliceflash > 16)
        {
            daddy.tilecon = 2;
            daddy.quizchoice = whichslicechosen;
            debug_message(whichslicechosen);
            pushsiner = 0;
            instance_destroy();
        }
    }
}
draw_set_color(c_red);
draw_arrow(xx + r + 40 + pushamount, yy, xx + r + pushamount, yy, 10 + (pushamount / 4));
draw_text(xx + r + 40, yy + 40, whichslicechosen);
draw_text(xx + r + 40, yy + 60, minangle);
draw_text(xx + r + 40, yy + 80, maxangle);
draw_text(xx + r + 40, yy + 100, finalang);
draw_text(xx + r + 40, yy + 120, abs(finalang - (ang / 2)) % ang);
draw_text(xx + r + 40, yy + 140, abs((finalang % ang) - ang));
