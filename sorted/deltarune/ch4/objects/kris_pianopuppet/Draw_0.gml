var xx = 10;
var yy = 8;
var space = 15;
draw_text(xx, yy + (space * 0), "W: Toggle Recording");
draw_text(xx, yy + (space * 1), "M: Toggle Sound: " + string(playsound));
draw_text(xx, yy + (space * 2), "Left Hand: Z X C V B N");
draw_text(xx, yy + (space * 3), "Right Hand: T Y U I O P");
if (keyboard_check_pressed(ord("M")))
    playsound = 1 - playsound;
if (keyboard_check_pressed(ord("Q")))
{
    var right_playback = "0R0R0R0R0R0R0R0R0R0R0R0R0R0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0R0R0R0R0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0R0R0R0R0R0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0U0U0U0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0L0L0L0L0L0W0W0W0W0W0W0W0W0W0W0W0W03030303030W0W0W0W0W0W0W020202020W0W0W0W0W0W0W0W0W0W020202020W0W0W0W0W0W0202020W0W0202020W0W0W0W0W0W0W0W0W0W0W0W0303030W0W0W0W0W0W0W0W0W0W0W0W0W0303030L0L0L0W0W0W0W0W0W0W0W0W0U0U0W0W0W0W0W0W0W0W0W0U0U0W0W0W0W0W0W0W0R0R0R0W0W0W0W0W0W0W0W0W0W0W0W0W0W";
    var left_playback = "010101010101010101010101010W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W010101010W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W010101010W0W0W0W0W010101010W0W0W0W0W0W020202020W0W0W0W0W0W0W0W0W0W0W0W0W030303030W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0L0L0L0L0L0W0W0W0W0W0W0W0W0W0U0U0U0W0W0W0W0W0W0W0W0R0R0R0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0L0L0L0L0L0W0W0W0W0W0W0W0W0W030303030W0W0W0W0W0W02020202020W0W0W0W0W0W0W01010101010W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W";
    lpianorecordcon = 2;
    lpianorecordcount = 0;
    lpianorecordstring = left_playback;
    lpianorecordsave = false;
    rpianorecordcon = 2;
    rpianorecordcount = 0;
    rpianorecordstring = right_playback;
    rpianorecordsave = false;
}
lk1 = keyboard_check(ord("Z"));
lk2 = keyboard_check(ord("X"));
lk3 = keyboard_check(ord("C"));
lk4 = keyboard_check(ord("V"));
lk5 = keyboard_check(ord("B"));
lk6 = keyboard_check(ord("N"));
press_l = 0;
press_r = 0;
press_u = 0;
press_d = 0;
press_1 = 0;
press_2 = 0;
press_3 = 0;
press_1 = lk1;
press_2 = lk2;
press_3 = lk3;
press_l = lk4;
press_u = lk5;
press_r = lk6;
if (lpianorecordcon == 1)
{
    lpianorecordstring += "0";
    var no_input = true;
    if (press_1)
    {
        lpianorecordstring += "1";
        no_input = false;
    }
    if (press_2)
    {
        lpianorecordstring += "2";
        no_input = false;
    }
    if (press_3)
    {
        lpianorecordstring += "3";
        no_input = false;
    }
    if (press_l)
    {
        lpianorecordstring += "L";
        no_input = false;
    }
    if (press_u)
    {
        lpianorecordstring += "U";
        no_input = false;
    }
    if (press_r)
    {
        lpianorecordstring += "R";
        no_input = false;
    }
    if (no_input == true)
        lpianorecordstring += "W";
    lpianorecordcount++;
}
if (lpianorecordcon == 2)
{
    press_l = 0;
    press_r = 0;
    press_u = 0;
    press_d = 0;
    press_1 = 0;
    press_2 = 0;
    press_3 = 0;
    if (lpianorecordcount < string_length(lpianorecordstring))
    {
        var _end = 0;
        while (_end == 0)
        {
            var _input = string_char_at(lpianorecordstring, lpianorecordcount);
            lpianorecordcount++;
            if (_input == "L")
                press_l = 1;
            if (_input == "R")
                press_r = 1;
            if (_input == "U")
                press_u = 1;
            if (_input == "D")
                press_d = 1;
            if (_input == "1")
                press_1 = 1;
            if (_input == "2")
                press_2 = 1;
            if (_input == "3")
                press_3 = 1;
            if (_input == "0")
                _end = 1;
            if (lpianorecordcount >= string_length(lpianorecordstring))
                _end = 1;
        }
    }
    else
    {
        if (lpianorecordsave == true && show_question("Do you want to save the left piano recording?"))
        {
            _string_save = get_string("Input string file name:", "default");
            ini_open("pianoplayback.ini");
            ini_write_string("piano Playback Info", _string_save, lpianorecordstring);
            ini_close();
        }
        else
        {
        }
        lpianorecordstring = "";
        lpianorecordcon = 0;
        lpianorecordcount = 0;
    }
}
var lkeydown = 0;
if (press_1 || press_2 || press_3 || press_u || press_l || press_r)
    lkeydown = 1;
if (press_1)
    baselindex = 5;
if (press_2)
    baselindex = 4;
if (press_3)
    baselindex = 3;
if (press_l)
    baselindex = 2;
if (press_u)
    baselindex = 1;
if (press_r)
    baselindex = 0;
if (playsound)
{
    if (press_1)
    {
        lowpitch = 1;
        lowplay = 1;
    }
    if (press_2)
    {
        lowpitch = 1.1;
        lowplay = 2;
    }
    if (press_3)
    {
        lowpitch = 1.2;
        lowplay = 3;
    }
    if (press_l)
    {
        lowpitch = 1.3;
        lowplay = 4;
    }
    if (press_u)
    {
        lowpitch = 1.4;
        lowplay = 5;
    }
    if (press_r)
    {
        lowpitch = 1.5;
        lowplay = 6;
    }
    if (!press_1 && !press_2 && !press_3 && !press_l && !press_u && !press_r)
        lowplay = 0;
    if (lowplay != lowplaylast)
    {
        if (lowplay)
            snd_play_pitch(snd_organ_do, lowpitch);
        lowplaylast = lowplay;
    }
}
rk1 = keyboard_check(ord("P"));
rk2 = keyboard_check(ord("O"));
rk3 = keyboard_check(ord("I"));
rk4 = keyboard_check(ord("U"));
rk5 = keyboard_check(ord("Y"));
rk6 = keyboard_check(ord("T"));
press_l = 0;
press_r = 0;
press_u = 0;
press_d = 0;
press_1 = 0;
press_2 = 0;
press_3 = 0;
press_1 = rk1;
press_2 = rk2;
press_3 = rk3;
press_l = rk4;
press_u = rk5;
press_r = rk6;
if (rpianorecordcon == 1)
{
    rpianorecordstring += "0";
    var no_input = true;
    if (press_1)
    {
        rpianorecordstring += "1";
        no_input = false;
    }
    if (press_2)
    {
        rpianorecordstring += "2";
        no_input = false;
    }
    if (press_3)
    {
        rpianorecordstring += "3";
        no_input = false;
    }
    if (press_l)
    {
        rpianorecordstring += "L";
        no_input = false;
    }
    if (press_u)
    {
        rpianorecordstring += "U";
        no_input = false;
    }
    if (press_r)
    {
        rpianorecordstring += "R";
        no_input = false;
    }
    if (no_input == true)
        rpianorecordstring += "W";
    rpianorecordcount++;
}
if (rpianorecordcon == 2)
{
    press_l = 0;
    press_r = 0;
    press_u = 0;
    press_d = 0;
    press_1 = 0;
    press_2 = 0;
    press_3 = 0;
    if (rpianorecordcount < string_length(rpianorecordstring))
    {
        var _end = 0;
        while (_end == 0)
        {
            var _input = string_char_at(rpianorecordstring, rpianorecordcount);
            rpianorecordcount++;
            if (_input == "L")
                press_l = 1;
            if (_input == "R")
                press_r = 1;
            if (_input == "U")
                press_u = 1;
            if (_input == "D")
                press_d = 1;
            if (_input == "1")
                press_1 = 1;
            if (_input == "2")
                press_2 = 1;
            if (_input == "3")
                press_3 = 1;
            if (_input == "0")
                _end = 1;
            if (rpianorecordcount >= string_length(rpianorecordstring))
                _end = 1;
        }
    }
    else
    {
        if (rpianorecordsave == true && show_question("Do you want to save the right piano recording?"))
        {
            _string_save = get_string("Input string file name:", "default");
            ini_open("pianoplayback.ini");
            ini_write_string("piano Playback Info", _string_save, rpianorecordstring);
            ini_close();
        }
        else
        {
        }
        rpianorecordstring = "";
        rpianorecordcon = 0;
        rpianorecordcount = 0;
    }
}
var rkeydown = 0;
if (press_1 || press_2 || press_3 || press_u || press_l || press_r)
    rkeydown = 1;
if (press_1)
    baserindex = 5;
if (press_2)
    baserindex = 4;
if (press_3)
    baserindex = 3;
if (press_l)
    baserindex = 2;
if (press_u)
    baserindex = 1;
if (press_r)
    baserindex = 0;
if (playsound)
{
    if (press_1)
    {
        hipitch = 1.5;
        hiplay = 1;
    }
    if (press_2)
    {
        hipitch = 1.4;
        hiplay = 2;
    }
    if (press_3)
    {
        hipitch = 1.3;
        hiplay = 3;
    }
    if (press_l)
    {
        hipitch = 1.2;
        hiplay = 4;
    }
    if (press_u)
    {
        hipitch = 1.1;
        hiplay = 5;
    }
    if (press_r)
    {
        hipitch = 1;
        hiplay = 6;
    }
    if (!press_1 && !press_2 && !press_3 && !press_l && !press_u && !press_r)
        hiplay = 0;
    if (hiplay != hiplaylast)
    {
        if (hiplay)
            snd_play_pitch(snd_organ_re, hipitch);
        hiplaylast = hiplay;
    }
    if (lpianorecordcon == 1)
        draw_text_outline(20, 20, "RECORDING", 1310841);
    if (lpianorecordcon == 2)
        draw_text_outline(20, 20, "PLAYBACK", 3869451);
}
draw_sprite_ext(spr_kris_pianopuppet_larm, baselindex + (lkeydown * 6), x - 2, y, 2, 2, 0, image_blend, image_alpha);
draw_sprite_ext(spr_kris_pianopuppet_rarm, baserindex + (rkeydown * 6), x - 2, y, 2, 2, 0, image_blend, image_alpha);
draw_sprite_ext(spr_kris_pianopuppet_body, 0, x, y, 2, 2, 0, image_blend, image_alpha);
