if (view_current == 0)
{
    var cx = camerax();
    var cy = cameray();
    actstring = stringsetloc("Action", "obj_b3bs_console_slash_Draw_0_gml_4_0");
    quistring = stringsetsubloc("Hold ~1 : Quit", scr_get_input_name(5), "obj_b3bs_console_slash_Draw_0_gml_5_0");
    quistring2 = stringsetloc("Quit", "obj_b3bs_console_slash_Draw_0_gml_6_0");
    swistring = stringsetloc("Switch Characters", "obj_b3bs_console_slash_Draw_0_gml_7_0");
    holdstring = stringsetloc("Hold", "obj_b3bs_console_slash_Draw_0_gml_8_0");
    if (con == 2)
        engaged = true;
    else
        engaged = false;
    if (instructionLerp > 0 || engaged)
    {
        if (instructionLerp < 1 && engaged)
            instructionLerp += 0.1;
        else if (!engaged)
            instructionLerp -= 0.1;
        var _easedLerp = scr_ease_out(instructionLerp, 3);
        scr_84_set_draw_font("mainbig");
        draw_set_color(c_white);
        draw_set_halign(fa_right);
        var space = 28;
        var yloc = 380;
        if (!canswitch)
            yloc = 408;
        var reddening = canceltimer / (canceltime * 1.2);
        reddening = clamp(reddening, 0, 1);
        var redcol = merge_color(c_white, c_red, reddening);
        var controllerText = global.is_console || obj_gamecontroller.gamepad_active;
        if (controllerText)
        {
            var zSpr = scr_getbuttonsprite(global.input_g[4], false);
            var butoffset = 4;
            scr_84_draw_text_outline((cx + 720) - (_easedLerp * 100), cy + yloc + (space * 0), " : " + actstring);
            var butxpos = (cx + 720) - (_easedLerp * 100) - string_width(" : " + actstring) - sprite_get_width(zSpr) - 12;
            draw_sprite_ext(zSpr, 0, butxpos, cy + yloc + (space * 0) + butoffset, 2, 2, 0, c_white, 1);
            draw_set_color(redcol);
            scr_84_draw_text_outline((cx + 720) - (_easedLerp * 100), cy + yloc + (space * 1), " : " + quistring2);
            var xSpr = scr_getbuttonsprite(global.input_g[5], false);
            butxpos = (cx + 720) - (_easedLerp * 100) - string_width(" : " + quistring2) - sprite_get_width(xSpr) - 12;
            if (global.lang == "ja")
                butxpos = (cx + 720) - (_easedLerp * 100) - 246;
            draw_sprite_ext(xSpr, 0, butxpos, cy + yloc + (space * 1) + butoffset, 2, 2, 0, redcol, 1);
            var holdtextpos = butxpos - 4;
            if (global.lang == "ja")
                holdtextpos = butxpos + 40 + 83;
            draw_set_halign(fa_right);
            scr_84_draw_text_outline(holdtextpos, cy + yloc + (space * 1), holdstring);
            var stringwid = string_width(holdstring);
            if (global.lang == "ja")
                stringwid -= 88;
            draw_sprite_ext(spr_quiz_hud_timer, 28 - ((canceltimer / canceltime) * 29), butxpos - 32 - stringwid - 8, cy + yloc + (space * 1) + 4, 2, 2, 0, redcol, canceltimer / 8);
            draw_set_color(c_white);
            if (canswitch)
            {
                var cSpr = scr_getbuttonsprite(global.input_g[6], false);
                butxpos = (cx + 720) - (_easedLerp * 100) - string_width(" : " + swistring) - sprite_get_width(cSpr) - 12;
                scr_84_draw_text_outline((cx + 720) - (_easedLerp * 100), cy + yloc + (space * 2), " : " + swistring);
                draw_sprite_ext(cSpr, 0, butxpos, cy + yloc + (space * 2) + butoffset, 2, 2, 0, c_white, 1);
            }
        }
        else
        {
            scr_84_draw_text_outline((cx + 720) - (_easedLerp * 100), cy + yloc + (space * 0), scr_get_input_name(4) + " : " + actstring);
            draw_set_color(redcol);
            scr_84_draw_text_outline((cx + 720) - (_easedLerp * 100), cy + yloc + (space * 1), quistring);
            draw_sprite_ext(spr_quiz_hud_timer, 28 - ((canceltimer / canceltime) * 29), (cx + 720) - (_easedLerp * 100) - round(string_width(quistring)) - 28 - 8, cy + yloc + (space * 1) + 3, 2, 2, 0, redcol, canceltimer / 8);
            draw_set_color(c_white);
            if (canswitch)
                scr_84_draw_text_outline((cx + 720) - (_easedLerp * 100), cy + yloc + (space * 2), scr_get_input_name(6) + " : " + swistring);
        }
        draw_set_halign(fa_left);
    }
    if (scr_debug())
    {
    }
}
