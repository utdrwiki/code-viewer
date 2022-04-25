draw_set_alpha(0.8)
draw_set_color(c_black)
draw_rectangle(0, 0, 640, 480, false)
draw_set_alpha(1)
draw_set_font(fnt_main)
draw_set_color(c_teal)
var spacing = 12
draw_text(1, (-3 + (spacing * 0)), "[1]     Light World")
draw_text(1, (-3 + (spacing * 1)), "[2]     Dark World")
draw_text(1, (-3 + (spacing * 2)), "[SPACE] Test Choicer")
draw_text(1, (-3 + (spacing * 3)), ("[C] Switch Language global.lang=" + string(global.lang)))
if keyboard_check_pressed(ord("4"))
    global.typer--
if keyboard_check_pressed(ord("5"))
    global.typer++
draw_text(141, (-3 + (spacing * 0)), "[P]     Screenshot")
draw_text(141, (-3 + (spacing * 1)), "[R]     Reset Room")
draw_set_color(c_white)
if (haswritten == 1)
{
    draw_set_font(fnt_main)
    if (global.lang == "ja")
        draw_set_font(fnt_ja_main)
    spacing = 14
    ypos = 72
    draw_set_halign(fa_left)
    draw_text(10, (ypos + (spacing * 0)), (("c1 = \"" + c1) + "\""))
    draw_text(10, (ypos + (spacing * 1)), (("c2 = \"" + c2) + "\""))
    if (promptcount > 2)
        draw_text(10, (ypos + (spacing * 2)), (("c3 = \"" + c3) + "\""))
    if (promptcount > 3)
        draw_text(10, (ypos + (spacing * 3)), (("c4 = \"" + c4) + "\""))
}
if keyboard_check_pressed(ord("1"))
{
    global.darkzone = false
    room_goto(room_debug_choicer_light)
}
if keyboard_check_pressed(ord("2"))
{
    global.darkzone = true
    room_goto(room_debug_choicer_dark)
}
if keyboard_check_pressed(ord("C"))
{
    draw_set_alpha(0.9)
    draw_set_color(c_black)
    draw_rectangle(0, 0, 640, 480, false)
    draw_set_alpha(1)
    draw_set_color(c_white)
    draw_set_halign(fa_center)
    if (global.darkzone == true)
        draw_set_font(fnt_mainbig)
    draw_text((160 * (1 + global.darkzone)), (100 * (1 + global.darkzone)), "PLEASE WAIT WHILE WE LOAD THE TEXT")
    draw_text((160 * (1 + global.darkzone)), (120 * (1 + global.darkzone)), "THE ROOM WILL BE RELOADED")
    alarm[0] = 1
}
if keyboard_check_pressed(vk_space)
{
    haswritten = 1
    safe_delete(obj_choicer_neo)
    safe_delete(obj_writer)
    if fileExists
    {
        ini_open("choicer.txt")
        q = ini_read_string("choicer", "question", q)
        c1 = ini_read_string("choicer", "c1", c1)
        c2 = ini_read_string("choicer", "c2", c2)
        c3 = ini_read_string("choicer", "c3", c3)
        c4 = ini_read_string("choicer", "c4", c4)
        promptcount = ini_read_real("choicer", "promptcount", promptcount)
        ini_close()
        if (position == "name")
            scr_smallface(0, smallname, emotion, name_xpos, name_ypos, smalltext)
        else
            scr_smallface(0, smallname, emotion, numb_xpos, numb_ypos, smalltext)
        global.choicemsg[0] = c1
        global.choicemsg[1] = c2
        global.choicemsg[2] = c3
        global.choicemsg[3] = c4
        scr_speaker("no_name")
        msgset(0, (q + "/"))
        if (promptcount == 1)
            msgnext("\\C1 ")
        if (promptcount == 2)
            msgnext("\\C2 ")
        if (promptcount == 3)
            msgnext("\\C3 ")
        if (promptcount == 4)
            msgnext("\\C4 ")
        msgnextloc("\\C4 ", "obj_debug_choicer_slash_Draw_0_gml_105_0")
        d = d_make()
        d.side = 1
    }
}
if d_ex()
    global.interact = 1
else
    global.interact = 0
if keyboard_check_pressed(ord("P"))
{
    snd_play(snd_camera_flash)
    var date = ((((((((((string(date_get_year(date_current_datetime())) + "_") + string(date_get_month(date_current_datetime()))) + "_") + string(date_get_day(date_current_datetime()))) + "_") + string(date_get_hour(date_current_datetime()))) + "_") + string(date_get_minute(date_current_datetime()))) + "_") + string(date_get_second(date_current_datetime())))
    screen_save((("Choicer_Screenshot_" + date) + ".png"))
}
