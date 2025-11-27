if (i_ex(obj_gameover_minigame) || i_ex(obj_minigame_evaluation))
    exit;
if (canceltimer >= canceltime)
{
    if (canceltimer == 30 && (!quit || global.chapter > 3))
        instance_create_depth(camerax(), cameray(), depth - 10, obj_gameover_minigame_ch4);
    if (canceltimer >= retrytime)
    {
        var _menu_string = [];
        _menu_string[0] = stringsetloc("Retry", "obj_minigame_quit_ui_slash_Draw_0_gml_16_0");
        _menu_string[1] = stringsetloc("Quit", "obj_minigame_quit_ui_slash_Draw_0_gml_17_0");
        if (con == 0)
        {
            draw_set_color(c_white);
            scr_84_set_draw_font("main");
            selection = scr_simple_menu_transformed(selection, camerax() + 300, cameray() + 200, 32, _menu_string, 2, 2, 65535);
            if (button1_p())
            {
                snd_play(snd_badexplosion);
                scr_fadeout(30);
                con = 1;
            }
        }
        else if (con == 1)
        {
            canceltimer++;
            if (canceltimer >= (retrytime + 32))
            {
                if (selection == 0)
                {
                    room_goto(room_dw_rhythm_countdown);
                }
                else if (selection == 1)
                {
                    snd_free_all();
                    inst = instance_create(0, 0, obj_persistentfadein);
                    global.entrance = global.band_song;
                    if (global.entrance == 0)
                        global.entrance = 3;
                    global.interact = 3;
                    global.facing = 0;
                    print_message("entrance = " + string(global.band_song));
                    room_goto(room_dw_castle_tv_rhythm);
                }
            }
        }
    }
    else
    {
        canceltimer++;
    }
    exit;
}
if (button3_h())
{
    canceltimer++;
    if (canceltimer >= canceltime)
        quit = true;
}
else
{
    canceltimer = 0;
}
if (appear)
{
    if (instructionLerp < 1)
        instructionLerp += 0.1;
}
if (!appear)
    instructionLerp -= 0.1;
var _easedLerp = scr_ease_out(instructionLerp, 3);
var _ja = global.lang == "ja";
var _space = _ja ? "" : "    ";
quistring = stringsetsubloc("Hold ~1 : Quit", scr_get_input_name(6), "obj_minigame_quit_ui_slash_Draw_0_gml_18_0");
quistring2 = stringsetsubloc("Hold ~1 : Quit", _space, "obj_minigame_quit_ui_slash_Draw_0_gml_18_0");
scr_84_set_draw_font("mainbig");
draw_set_color(c_white);
draw_set_halign(fa_right);
var space = 28;
var yloc = 380;
var butoffset = 4;
var reddening = canceltimer / (canceltime * 1.2);
reddening = clamp(reddening, 0, 1);
var redcol = merge_color(c_white, c_red, reddening);
var a = 2;
var xx = 0;
var yy = 0;
var scale = 1;
var _alpha = 1;
if (room == room_dw_rhythm)
    xx = -210;
if (global.is_console || obj_gamecontroller.gamepad_active)
{
    draw_set_alpha(1);
    draw_set_colour(redcol);
    draw_text_transformed_outline((camerax() + xx + 720) - (_easedLerp * 100), cameray() + yloc + yy + (space * a), quistring2, scale, 1, 0);
    var xSpr = scr_getbuttonsprite(global.input_g[6], false);
    var butxpos = (camerax() + 720) - (_easedLerp * 100) - string_width(" " + quistring2);
    if (_ja)
        butxpos -= ((sprite_get_width(xSpr) * 2) - 10);
    var butxoff = butxpos;
    if (!_ja)
    {
        butxoff += string_width(" Hold ");
        butxpos += 4;
    }
    draw_sprite_ext(xSpr, 0, butxoff + xx, cameray() + yloc + (space * a) + butoffset + yy, 2, 2, 0, redcol, _alpha);
    if (canceltimer == canceltime)
        draw_sprite_ext(spr_quiz_hud_timer, 0, (butxpos - 32) + xx, cameray() + yloc + (space * a) + 4 + yy, 2, 2, 0, redcol, canceltimer / 8);
    else
        draw_sprite_ext(spr_quiz_hud_timer, 28 - ((canceltimer / canceltime) * 29), (butxpos - 32) + xx, cameray() + yloc + (space * a) + 4 + yy, 2, 2, 0, redcol, canceltimer / 8);
    draw_set_color(c_white);
}
else
{
    draw_set_colour(redcol);
    draw_text_transformed_outline((camerax() + xx + 720) - (_easedLerp * 100), cameray() + yloc + yy + (space * a), quistring, scale, 1, 0);
    if (canceltimer == canceltime)
        draw_sprite_ext(spr_quiz_hud_timer, 0, (camerax() + xx + 720) - (_easedLerp * 100) - round(string_width(quistring)) - 28 - 8, cameray() + yloc + (space * a) + 3 + yy, 2, 2, 0, redcol, canceltimer / 8);
    else
        draw_sprite_ext(spr_quiz_hud_timer, 28 - ((canceltimer / canceltime) * 29), (camerax() + xx + 720) - (_easedLerp * 100) - round(string_width(quistring)) - 28 - 8, cameray() + yloc + (space * a) + 3 + yy, 2, 2, 0, redcol, canceltimer / 8);
    draw_set_color(c_white);
}
draw_set_halign(fa_left);
