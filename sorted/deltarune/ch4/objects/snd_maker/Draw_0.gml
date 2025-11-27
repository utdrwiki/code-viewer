col_gray = 6972976;
col_inactivechosen = 14668032;
var cx = camerax();
var cy = cameray();
draw_set_blend_mode(bm_add);
draw_sprite_ext(spr_pxwhite, 0, cx - 20, cy - 20, 660, 500, 0, #192829, 1);
draw_set_blend_mode(bm_normal);
draw_sprite_ext(spr_pxwhite, 0, cx - 20, cy - 20, 660, 500, 0, #192829, 0.95);
draw_sprite_ext(spr_pxwhite, 0, cx + 252 + 2, cy + 0 + 2, 2, 480, 0, #0F1C1D, 1);
draw_sprite_ext(spr_pxwhite, 0, cx + 252 + 2, cy + 238 + 2, 640, 2, 0, #0F1C1D, 1);
draw_sprite_ext(spr_pxwhite, 0, cx + 252, cy + 0, 2, 480, 0, col_gray, 1);
draw_sprite_ext(spr_pxwhite, 0, cx + 252, cy + 238, 640, 2, 0, col_gray, 1);
draw_set_font(fnt_main);
draw_set_halign(fa_right);
var count = 1;
draw_set_halign(fa_left);
var xx = cx + 10;
var yy = cy + 80;
var mspace = 18;
var txscale = 1;
for (var i = 0; i < soundtotal; i++)
{
    var entry = soundName[i];
    if (pageind[0] == i)
        entry = ">>  " + soundName[i];
    draw_set_color(c_white);
    if (page != 0)
        draw_set_color(col_gray);
    if (i == pageind[0])
    {
        draw_set_color(c_yellow);
        if (page != 0)
            draw_set_color(col_inactivechosen);
    }
    draw_text_transformed(xx, (yy + (i * mspace)) - (pageind[0] * mspace), entry, txscale, 1, 0);
    draw_set_color(c_white);
}
menu[0] = "Volume < >   : " + string(curvolume);
menu[1] = "Pitch  < >   : " + string(curpitch);
menu[2] = "Delay  < >   : " + string(curdelay);
menu[3] = "Loop Rate: " + string(curlooprate);
menu[4] = "Kill Sound Upon Loop: " + string(curkillsnd);
menu[5] = "Add New Sound to Complex Sound";
menu[6] = "Overwrite Current Sound";
menu[7] = "Delete Current Sound";
menu[8] = "Test Complex Sound";
menu[9] = "Complex Sound Lifetime: " + string(curlifetime);
menu[10] = "Complex Sound Kill All: " + string(curkillall);
menu[11] = "Complex Sound Kill Individual: " + string(curkillind);
xx = cx + 260;
yy = cy + 40;
mspace = 16;
for (var i = 0; i < array_length(menu); i++)
{
    draw_set_color(c_white);
    if (page != 1)
        draw_set_color(col_gray);
    if (i == pageind[1])
    {
        draw_set_color(c_yellow);
        if (page != 1)
            draw_set_color(col_inactivechosen);
    }
    draw_text(xx, yy + (mspace * i), menu[i]);
}
draw_set_color(c_white);
yy = cy + 260;
mspace = 16;
count = 0;
var commandstring = "var snd=snd_play_complex(" + string(curkillall) + "," + string(curkillind) + "," + string(curlifetime) + ")";
draw_set_color(col_gray);
if (page == 2)
    draw_set_color(c_white);
draw_text(xx, yy + (mspace * -1), commandstring);
for (var i = 0; i < sndcount; i++)
{
    commandstring = "snd_add_complex(snd," + string(i) + "," + string(audio_get_name(snd[i])) + "," + string(pitch[i]) + "," + string(volume[i]) + "," + string(delay[i]) + "," + string(looprate[i]) + "," + string(killsnd[i]) + ")";
    var bonusstring = "";
    if (i == cursnd)
        bonusstring = ">> ";
    draw_set_color(col_gray);
    if (page == 2)
        draw_set_color(c_white);
    if (i == cursnd)
    {
        if (page == 2)
            draw_set_color(c_yellow);
        else
            draw_set_color(col_inactivechosen);
    }
    draw_text(xx, yy + (mspace * i), bonusstring + commandstring);
    draw_set_color(c_white);
}
draw_sprite_ext(spr_pxwhite, 0, cx, (cy + 480) - 24, 640, 24, 0, #0B1718, 0.9);
draw_set_halign(fa_center);
draw_set_color(#84DEE5);
draw_text_outline(cx + 320, ((cy + 480) - 24) + 4, "Hold [F1] or gp_Start for Help");
draw_set_halign(fa_left);
if (keyboard_check(vk_f1) || gamepad_button_check(0, gp_start) || gamepad_button_check(1, gp_start))
{
    siner++;
    draw_sprite_ext(spr_pxwhite, 0, cx - 20, cy - 20, 660, 500, 0, #111111, 1);
    draw_set_halign(fa_center);
    draw_set_color(c_black);
    draw_text_transformed(cx + 320 + 2, cy + 10 + 2, "HELP", 4, 4, sin(siner / 5) * 4);
    draw_set_color(c_white);
    draw_text_transformed_color(cx + 320, cy + 10, "HELP", 4, 4, sin(siner / 5) * 4, c_yellow, c_yellow, c_white, c_white, 1);
    draw_set_halign(fa_left);
    xx = cx + 200;
    yy = cy + 120;
    mspace = 24;
    count = 0;
    draw_text_outline(xx, yy + (mspace * count), "[Z] or gp_A = Play current Sound");
    count++;
    draw_text_outline(xx, yy + (mspace * count), "[X] or gp_B = Kill all playing sounds");
    count++;
    draw_text_outline(xx, yy + (mspace * count), "[C] or gp_Y = Add current sound to complex sound");
    count++;
    draw_text_outline(xx, yy + (mspace * count), "[V] or gp_X = Replace selected sound with current settings");
    count++;
    draw_text_outline(xx, yy + (mspace * count), "[Q] or gp_L1 = Switch to previous section");
    count++;
    draw_text_outline(xx, yy + (mspace * count), "[E] or [TAB] or gp_R1 = Switch to next section");
    count++;
    draw_text_outline(xx, yy + (mspace * count), "[SPACE] or gp_R2 = Play Complex Sound");
    count++;
    draw_text_outline(xx, yy + (mspace * count), "[ESC] or gp_Select = Exit");
    count++;
    draw_text_outline(xx, yy + (mspace * count), "[CTRL] + [C] to copy GML command to clipboard");
    count++;
    draw_set_halign(fa_left);
    draw_set_color(c_white);
}
