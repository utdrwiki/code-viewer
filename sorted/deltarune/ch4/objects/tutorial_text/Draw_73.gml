if (view_current == 0 && !d_ex())
{
    var camx = camerax();
    var camy = cameray();
    var displayformat = 0;
    var exitstring = stringsetloc("Exit", "obj_tutorial_text_slash_Draw_73_gml_14_0");
    var holdstring = stringsetloc("Hold", "obj_tutorial_text_slash_Draw_73_gml_15_0");
    var resetstring = stringsetloc("Reset", "obj_tutorial_text_slash_Draw_73_gml_16_0");
    var playstring = stringsetloc("Play", "obj_tutorial_text_slash_Draw_73_gml_17_0");
    var playpianostring = stringsetloc("Play Piano", "obj_tutorial_text_slash_Draw_73_gml_18_0");
    var movebookshelf = stringsetloc("Move Bookshelf", "obj_tutorial_text_slash_Draw_73_gml_19_0");
    var movepiano = stringsetloc("Move Piano", "obj_tutorial_text_slash_Draw_73_gml_20_0");
    var shiftstring = stringsetloc("Shift Octave", "obj_tutorial_text_slash_Draw_73_gml_21_0");
    var chargejump = stringsetloc("Charge Jump", "obj_tutorial_text_slash_Draw_73_gml_22_0");
    line[0] = "";
    line[1] = "";
    line[2] = "";
    line[3] = "";
    holdline[0] = false;
    holdline[1] = false;
    holdline[2] = false;
    holdline[3] = false;
    linecount = 2;
    exitline = -1;
    but[0] = 4;
    but[1] = 5;
    but[2] = 6;
    var count = 0;
    canceltimer = 0;
    if (i_ex(obj_ch4_DCA08D) || room == room_dw_church_jackenstein)
    {
        line[0] = chargejump;
        holdline[0] = true;
        linecount = 1;
    }
    if (i_ex(obj_mike_minigame_controller))
    {
        active = obj_mike_minigame_controller.phase == 2;
        line[0] = exitstring;
        holdline[0] = true;
        holdvalue[0] = obj_mike_minigame_controller.hold_quit_timer;
        holdvalueLimit[0] = 30;
        but[0] = 6;
        linecount = 1;
    }
    if (i_ex(obj_dw_church_bookshelfpuzzle))
    {
        linecount = 3;
        line[0] = playpianostring;
        line[1] = resetstring;
        line[2] = exitstring;
        holdline[1] = true;
        but[0] = 4;
        but[1] = 6;
        but[2] = 5;
        exitline = 2;
        holdvalue[1] = 0;
        holdvalueLimit[1] = 15;
        with (obj_dw_church_remote_piano)
        {
            if (con == 2)
            {
                other.canceltimer = endtimer;
                other.canceltime = endtime;
                other.holdvalue[1] = shelfresettimer;
                other.holdvalueLimit[1] = shelfresettime;
            }
        }
    }
    if (i_ex(obj_dw_church_pianopiece_right))
    {
        linecount = 3;
        line[0] = movebookshelf;
        line[1] = shiftstring;
        line[2] = exitstring;
        but[0] = 4;
        but[1] = 6;
        but[2] = 5;
        exitline = 2;
        displayformat = 1;
        with (obj_dw_church_remote_piano)
        {
            if (con == 2 || con == -999)
            {
                other.canceltimer = endtimer;
                other.canceltime = endtime;
            }
        }
    }
    if (i_ex(obj_church_piano_playable))
    {
        linecount = 2;
        line[0] = playstring;
        line[1] = exitstring;
        but[0] = 4;
        but[1] = 5;
        exitline = 1;
        with (obj_church_piano_playable)
        {
            if (con == 1)
            {
                other.canceltimer = canceltimer;
                other.canceltime = canceltime;
            }
        }
    }
    if (i_ex(obj_dw_church_remotepianomove))
    {
        if (obj_dw_church_remotepianomove.final)
        {
            linecount = 1;
            line[0] = playpianostring;
            but[0] = 4;
        }
        else
        {
            if (global.flag[1538] == 1)
            {
                linecount = 2;
                line[0] = movepiano;
                line[1] = exitstring;
                but[0] = 4;
                but[1] = 5;
                exitline = 1;
            }
            else
            {
                linecount = 3;
                line[0] = movebookshelf;
                line[1] = resetstring;
                line[2] = exitstring;
                but[0] = 4;
                but[1] = 6;
                but[2] = 5;
                exitline = 2;
            }
            with (obj_dw_church_remotepianomove)
            {
                if (engaged)
                {
                    other.canceltimer = endtimer;
                    other.canceltime = endtime;
                }
            }
        }
    }
    if (i_ex(obj_dw_church_organ))
    {
        linecount = 3;
        line[0] = playstring;
        line[1] = shiftstring;
        line[2] = exitstring;
        but[0] = 4;
        but[1] = 6;
        but[2] = 5;
        exitline = 2;
        with (obj_dw_church_organ)
        {
            other.canceltimer = endtimer;
            other.canceltime = endtime;
        }
    }
    if (i_ex(obj_church_secretpiano_playable))
    {
        linecount = 2;
        line[0] = playstring;
        line[1] = exitstring;
        but[0] = 4;
        but[1] = 5;
        exitline = 1;
        with (obj_church_secretpiano_playable)
        {
            other.canceltimer = canceltimer;
            other.canceltime = canceltime;
        }
    }
    if (i_ex(obj_dw_church_sideclimb))
    {
        linecount = 1;
        line[0] = exitstring;
        exitline = 0;
        but[0] = 5;
        canceltimer = obj_dw_church_sideclimb.canceltimer;
        canceltime = 30;
    }
    if (instructionLerp > 0 || active)
    {
        if (instructionLerp < 1 && active)
            instructionLerp += 0.1;
        else if (!active)
            instructionLerp -= 0.1;
        var _easedLerp = scr_ease_out(instructionLerp, 3);
        scr_84_set_draw_font("mainbig");
        draw_set_color(c_white);
        draw_set_halign(fa_right);
        var space = 28;
        var margin = 20;
        var yloc = 480 - (space * linecount) - margin;
        var reddening = clamp(canceltimer / canceltime, 0, 1);
        var redcol = merge_color(c_white, c_red, reddening);
        var butmarg = -12;
        var gamepad = false;
        if (global.is_console || obj_gamecontroller.gamepad_active)
            gamepad = true;
        if (displayformat == 0)
        {
            var xloc = (camx + 640 + 100) - margin - (_easedLerp * 100);
            if (gamepad)
            {
                for (var i = 0; i < linecount; i++)
                {
                    var buttspr = scr_getbuttonsprite(global.input_g[but[i]], false);
                    var butoffset = 4;
                    draw_set_color(c_white);
                    if (i != exitline)
                    {
                        var fullline = " : " + line[i];
                        scr_84_draw_text_outline(xloc, camy + yloc + (space * i), fullline);
                        var butxpos = (xloc - string_width(" : " + line[i]) - sprite_get_width(buttspr)) + butmarg;
                        draw_sprite_ext(buttspr, 0, butxpos, camy + yloc + (space * i) + butoffset, 2, 2, 0, c_white, 1);
                        if (holdline[i])
                            scr_84_draw_text_outline(butxpos, camy + yloc + (space * i), holdstring + " ");
                        if (holdvalueLimit[i] != -1)
                        {
                            var spritexpos = butxpos - string_width(holdstring + " ") - 28 - 6;
                            var spriteypos = camy + yloc + (space * i) + 3;
                            draw_sprite_ext(spr_quiz_hud_timer, clamp(28 - ((holdvalue[i] / holdvalueLimit[i]) * 29), 0, 28), spritexpos, spriteypos, 2, 2, 0, c_white, holdvalue[i] / 8);
                        }
                    }
                    else
                    {
                        draw_set_color(redcol);
                        var fullline = " : " + line[i];
                        var butxpos = (xloc - string_width(fullline) - sprite_get_width(buttspr)) + butmarg;
                        draw_set_halign(fa_right);
                        scr_84_draw_text_outline(butxpos - 4, camy + yloc + (space * i), holdstring);
                        draw_sprite_ext(buttspr, 0, butxpos, camy + yloc + (space * i) + butoffset, 2, 2, 0, redcol, 1);
                        scr_84_draw_text_outline(xloc, camy + yloc + (space * i), fullline);
                        draw_set_color(c_white);
                        var spritexpos = scr_even((butxpos - 4 - 28 - 1 - string_width(holdstring)) + (butmarg / 2));
                        var spriteypos = camy + yloc + (space * i) + 3;
                        if (active)
                            draw_sprite_ext(spr_quiz_hud_timer, clamp(28 - ((canceltimer / canceltime) * 29), 0, 28), spritexpos, spriteypos, 2, 2, 0, redcol, canceltimer / 8);
                    }
                }
                draw_set_color(c_white);
            }
            else
            {
                for (var i = 0; i < linecount; i++)
                {
                    var hold = holdline[i];
                    var holdstr = "";
                    if (hold)
                        holdstr = holdstring + " ";
                    var fullline = holdstr + scr_get_input_name(but[i]) + " : " + line[i];
                    if (exitline == i)
                    {
                        fullline = holdstring + " " + scr_get_input_name(but[i]) + " : " + line[i];
                        var spritexpos = (camx + 720) - (_easedLerp * 100) - round(string_width(fullline)) - 28 - 8;
                        var spriteypos = camy + yloc + (space * i) + 3;
                        if (active)
                            draw_sprite_ext(spr_quiz_hud_timer, clamp(28 - ((canceltimer / canceltime) * 29), 0, 28), spritexpos, spriteypos, 2, 2, 0, redcol, canceltimer / 8);
                        draw_set_color(redcol);
                    }
                    scr_84_draw_text_outline(xloc, camy + yloc + (space * i), fullline);
                    if (holdvalueLimit[i] != -1)
                    {
                        var spritexpos = (camx + 720) - (_easedLerp * 100) - round(string_width(fullline)) - 28 - 8;
                        var spriteypos = camy + yloc + (space * i) + 3;
                        draw_sprite_ext(spr_quiz_hud_timer, clamp(28 - ((holdvalue[i] / holdvalueLimit[i]) * 29), 0, 28), spritexpos, spriteypos, 2, 2, 0, c_white, holdvalue[i] / 8);
                    }
                    draw_set_color(c_white);
                }
            }
            draw_set_halign(fa_left);
        }
        if (displayformat == 1)
        {
            if (linecount >= 1)
            {
                butmarg = 2;
                var i = 0;
                var xloc = ((camx + margin) - 100) + (_easedLerp * 100);
                yloc = ((camy + 480) - (space * 2) - margin) + 2;
                if (gamepad)
                {
                    var buttspr = scr_getbuttonsprite(global.input_g[but[i]], false);
                    var butoffset = 4;
                    draw_set_halign(fa_left);
                    if (i != exitline)
                    {
                        var fullline = " : " + line[i];
                        if (holdline[i])
                        {
                            scr_84_draw_text_outline(xloc, yloc + (space * i), holdstring + " ");
                            xloc += string_width(holdstring + " ");
                        }
                        draw_sprite_ext(buttspr, 0, xloc, yloc + butoffset, 2, 2, 0, c_white, 1);
                        xloc += ((sprite_get_width(buttspr) * 2) + butmarg);
                        scr_84_draw_text_outline(xloc, yloc, fullline);
                    }
                    else
                    {
                        draw_set_color(redcol);
                        var fullline = " : " + line[i];
                        if (holdline[i])
                        {
                            scr_84_draw_text_outline(xloc, yloc + (space * i), holdstring + " ");
                            xloc += string_width(holdstring + " ");
                        }
                        draw_sprite_ext(buttspr, 0, xloc, yloc + butoffset, 2, 2, 0, c_white, 1);
                        xloc += ((sprite_get_width(buttspr) * 2) + butmarg);
                        scr_84_draw_text_outline(xloc, yloc, fullline);
                        draw_set_color(-1);
                        var spritexpos = xloc + round(string_width(fullline)) + 6;
                        var spriteypos = yloc + 3;
                        if (active)
                            draw_sprite_ext(spr_quiz_hud_timer, clamp(28 - ((canceltimer / canceltime) * 29), 0, 28), spritexpos, spriteypos, 2, 2, 0, redcol, canceltimer / 8);
                    }
                }
                else
                {
                    var hold = holdline[i];
                    var holdstr = "";
                    if (hold)
                        holdstr = holdstring + " ";
                    var fullline = holdstr + scr_get_input_name(but[i]) + " : " + line[i];
                    if (exitline == i)
                    {
                        fullline = holdstring + " " + scr_get_input_name(but[i]) + " : " + line[i];
                        var spritexpos = xloc + round(string_width(fullline)) + 4;
                        var spriteypos = yloc + 3;
                        if (active)
                            draw_sprite_ext(spr_quiz_hud_timer, clamp(28 - ((canceltimer / canceltime) * 29), 0, 28), spritexpos, spriteypos, 2, 2, 0, redcol, canceltimer / 8);
                        draw_set_color(redcol);
                    }
                    draw_set_halign(fa_left);
                    scr_84_draw_text_outline(xloc, yloc, fullline);
                    draw_set_halign(fa_right);
                    draw_set_color(c_white);
                }
            }
            if (linecount >= 2)
            {
                butmarg = -12;
                draw_set_halign(fa_right);
                yloc = ((camy + 480) - (space * 2) - margin) + 2;
                var i = 1;
                var xloc = (camx + 640 + 100) - margin - (_easedLerp * 100);
                if (gamepad)
                {
                    var buttspr = scr_getbuttonsprite(global.input_g[but[i]], false);
                    var butoffset = 4;
                    draw_set_color(c_white);
                    if (i != exitline)
                    {
                        var fullline = " : " + line[i];
                        scr_84_draw_text_outline(xloc, yloc, fullline);
                        var butxpos = (xloc - string_width(" : " + line[i]) - sprite_get_width(buttspr)) + butmarg;
                        draw_sprite_ext(buttspr, 0, butxpos, yloc + butoffset, 2, 2, 0, c_white, 1);
                        if (holdline[i])
                            scr_84_draw_text_outline(butxpos, yloc, holdstring + " ");
                    }
                    else
                    {
                        draw_set_color(redcol);
                        var fullline = " : " + line[i];
                        var butxpos = (xloc - string_width(fullline) - sprite_get_width(buttspr)) + butmarg;
                        draw_set_halign(fa_right);
                        scr_84_draw_text_outline(butxpos - 4, yloc, holdstring);
                        draw_sprite_ext(buttspr, 0, butxpos, yloc + butoffset, 2, 2, 0, redcol, 1);
                        scr_84_draw_text_outline(xloc, yloc, fullline);
                        draw_set_color(c_white);
                        var spritexpos = (butxpos - string_width(holdstring) - (sprite_get_width(spr_quiz_hud_timer) * 2)) + butmarg + 2;
                        var spriteypos = yloc + 3;
                        if (active)
                            draw_sprite_ext(spr_quiz_hud_timer, clamp(28 - ((canceltimer / canceltime) * 29), 0, 28), spritexpos, spriteypos, 2, 2, 0, redcol, canceltimer / 8);
                    }
                    draw_set_color(c_white);
                }
                else
                {
                    var hold = holdline[i];
                    var holdstr = "";
                    if (hold)
                        holdstr = holdstring + " ";
                    var fullline = holdstr + scr_get_input_name(but[i]) + " : " + line[i];
                    if (exitline == i)
                    {
                        fullline = holdstring + " " + scr_get_input_name(but[i]) + " : " + line[i];
                        var spritexpos = xloc - (sprite_get_width(spr_quiz_hud_timer) * 2) - round(string_width(fullline)) - 4;
                        var spriteypos = yloc + 3;
                        if (active)
                            draw_sprite_ext(spr_quiz_hud_timer, clamp(28 - ((canceltimer / canceltime) * 29), 0, 28), spritexpos, spriteypos, 2, 2, 0, redcol, canceltimer / 8);
                        draw_set_color(redcol);
                    }
                    scr_84_draw_text_outline(xloc, yloc, fullline);
                    draw_set_color(c_white);
                }
                draw_set_halign(fa_left);
            }
            if (linecount >= 3)
            {
                var i = 2;
                var xloc = camx + 320;
                butmarg = 2;
                yloc = (((camy + 480) - (space * 1) - margin) + 2 + 100) - (_easedLerp * 100);
                if (gamepad)
                {
                    var buttspr = scr_getbuttonsprite(global.input_g[but[i]], false);
                    var butoffset = 4;
                    draw_set_halign(fa_left);
                    if (i != exitline)
                    {
                        var fullline = " : " + line[i];
                        if (holdline[i])
                        {
                            xloc -= string_width(holdstring + " ");
                            scr_84_draw_text_outline(xloc, yloc, holdstring + " ");
                            xloc += string_width(holdstring + " ");
                        }
                        else
                        {
                            xloc -= (string_width(fullline) - (sprite_get_width(buttspr) * 2));
                        }
                        draw_sprite_ext(buttspr, 0, xloc, yloc + butoffset, 2, 2, 0, c_white, 1);
                        xloc += ((sprite_get_width(buttspr) * 2) + butmarg);
                        scr_84_draw_text_outline(xloc, yloc, fullline);
                    }
                    else
                    {
                        draw_set_color(redcol);
                        var fullline = " : " + line[i];
                        xloc -= round((string_width(holdstring + " ") + (sprite_get_width(buttspr) * 2) + string_width(fullline)) / 2);
                        scr_84_draw_text_outline(xloc, yloc, holdstring + " ");
                        xloc += string_width(holdstring + " ");
                        draw_sprite_ext(buttspr, 0, xloc, yloc + butoffset, 2, 2, 0, c_white, 1);
                        xloc += ((sprite_get_width(buttspr) * 2) + butmarg);
                        scr_84_draw_text_outline(xloc, yloc, fullline);
                        draw_set_color(-1);
                        var spritexpos = xloc + round(string_width(fullline)) + 6;
                        var spriteypos = yloc + 3;
                        if (active)
                            draw_sprite_ext(spr_quiz_hud_timer, clamp(28 - ((canceltimer / canceltime) * 29), 0, 28), spritexpos, spriteypos, 2, 2, 0, redcol, canceltimer / 8);
                    }
                }
                else
                {
                    var hold = holdline[i];
                    var holdstr = "";
                    if (hold)
                        holdstr = holdstring + " ";
                    var fullline = holdstr + scr_get_input_name(but[i]) + " : " + line[i];
                    if (exitline == i)
                    {
                        fullline = holdstring + " " + scr_get_input_name(but[i]) + " : " + line[i];
                        xloc -= round(string_width(fullline) / 2);
                        var spritexpos = xloc + round(string_width(fullline)) + 4;
                        var spriteypos = yloc + 3;
                        if (active)
                            draw_sprite_ext(spr_quiz_hud_timer, clamp(28 - ((canceltimer / canceltime) * 29), 0, 28), spritexpos, spriteypos, 2, 2, 0, redcol, canceltimer / 8);
                        draw_set_color(redcol);
                    }
                    else
                    {
                        xloc -= round(string_width(fullline) / 2);
                    }
                    draw_set_halign(fa_left);
                    scr_84_draw_text_outline(xloc, yloc, fullline);
                    draw_set_halign(fa_right);
                    draw_set_color(c_white);
                }
            }
        }
    }
}
draw_set_halign(fa_left);
