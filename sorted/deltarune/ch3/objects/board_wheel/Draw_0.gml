if (init == 0)
{
    pushcon = 1;
    pushamount = 0;
    if (slicetype == 0)
        maxslices = 16;
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
ossafe_fill_rectangle(130, 60, 520, 320, false);
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
    x1 = xx;
    y1 = yy;
    x2 = xx + lengthdir_x(r, finalang - (ang / 2));
    y2 = yy + lengthdir_y(r, finalang - (ang / 2));
    x3 = xx + lengthdir_x(r, finalang + (ang / 2));
    y3 = yy + lengthdir_y(r, finalang + (ang / 2));
    var piecealpha = 1;
    if (pushcon == 1)
    {
        piecealpha = 1;
    }
    else if (pushcon >= 2)
    {
        piecealpha = 0.5;
        if (rotationalspeed < 8)
        {
            if (slicechosen)
                piecealpha = 1;
            else
                piecealpha = (1 / (abs(rotationalspeed * 4) + 1)) + 0.5;
        }
    }
    draw_sprite_pos(spr_board_wheel_slice_test, i, xx, yy, x3, y3, x2, y2, xx, yy, piecealpha);
    draw_set_color(slicetextcolor[i]);
    draw_sprite_ext(sliceicon[i], 0, xx + lengthdir_x(r - 20, finalang), yy + lengthdir_y(r - 20, finalang), 2, 2, finalang, c_white, image_alpha);
    draw_sprite_ext(spr_numbersfontbig, i, xx + lengthdir_x(r - 20, finalang), yy + lengthdir_y(r - 20, finalang), 2, 2, finalang, selectedcolor, image_alpha / 4);
    draw_text_transformed(xx + lengthdir_x(50, finalang + 8), yy + lengthdir_y(50, finalang + 8), slicetext[i], 1, 1, finalang);
}
draw_set_halign(fa_left);
rotationalspeed = clamp(rotationalspeed - rotationalfriction, 0, 999);
if (pushcon == 1)
{
    pushsiner++;
    pushamount = abs(sin(pushsiner / 8)) * 100;
    if (button1_p())
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
}
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
if (pushcon == 3)
{
    pushsiner++;
    if (abs((finalang - (ang / 2)) % ang) < 3 || abs((finalang - (ang / 2)) % ang) > (ang - 3))
    {
        rotationalfriction = 0.05;
        rotationalspeed += 0.06;
    }
    else if (abs(rotationalspeed) < 0.2)
    {
        pushcon = 1;
        pushsiner = 0;
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
