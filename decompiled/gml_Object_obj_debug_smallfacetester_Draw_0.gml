draw_set_alpha(0.8)
draw_set_color(c_black)
draw_rectangle(0, 0, 640, 480, false)
draw_set_alpha(1)
draw_set_font(fnt_main)
draw_set_color(c_teal)
var spacing = 12
draw_text(1, (-3 + (spacing * 0)), "[1]     Light World")
draw_text(1, (-3 + (spacing * 1)), "[2]     Dark World")
draw_text(1, (-3 + (spacing * 2)), "[SPACE] Test Smallface")
draw_text(1, (-3 + (spacing * 3)), ("[C] Switch Language global.lang=" + string(global.lang)))
draw_text(141, (-3 + (spacing * 0)), "[P]     Screenshot")
draw_text(141, (-3 + (spacing * 1)), "[R]     Reset Room")
if (fileExists == 0)
{
    draw_set_color(c_red)
    draw_text(20, 57, "The file ``smallface.txt`` is not found.")
    draw_text(20, 71, "Ask for new smallface.txt and add it to")
    draw_text(20, 85, "your save directory, then reboot.")
}
draw_set_color(c_white)
if (haswritten == 1)
{
    draw_set_font(fnt_main)
    if (global.lang == "ja")
        draw_set_font(fnt_ja_main)
    spacing = 14
    ypos = 50
    draw_set_halign(fa_left)
    draw_text(10, (ypos + (spacing * 0)), (("smallname = \"" + smallname) + "\""))
    draw_text(10, (ypos + (spacing * 1)), ("emotion = " + string(emotion)))
    if (position == "name")
    {
        draw_text(10, (ypos + (spacing * 2)), (("position = \"" + position) + "\""))
        draw_text(10, (ypos + (spacing * 3)), (("name_xpos = \"" + name_xpos) + "\""))
        draw_text(10, (ypos + (spacing * 4)), (("name_ypos = \"" + name_ypos) + "\""))
    }
    else
    {
        draw_text(10, (ypos + (spacing * 2)), (("position = \"" + position) + "\""))
        draw_text(10, (ypos + (spacing * 3)), ("numb_xpos = " + string(numb_xpos)))
        draw_text(10, (ypos + (spacing * 4)), ("numb_ypos = " + string(numb_ypos)))
    }
    draw_text(10, (ypos + (spacing * 5)), (("smalltext = \"" + smalltext) + "\""))
    draw_text(10, (ypos + (spacing * 6)), (("maintext = \"" + maintext) + "\""))
}
if keyboard_check_pressed(ord("1"))
{
    global.darkzone = false
    room_goto(room_debug_smallface)
}
if keyboard_check_pressed(ord("2"))
{
    global.darkzone = true
    room_goto(room_debug_smallface_dark)
}
if keyboard_check_pressed(vk_space)
{
    haswritten = 1
    safe_delete(obj_writer)
    if fileExists
    {
        ini_open("smallface.txt")
        smallname = ini_read_string("smallface", "smallname", "susie")
        emotion = ini_read_real("smallface", "emotion", 0)
        position = ini_read_string("smallface", "position", "name")
        name_xpos = ini_read_string("smallface", "name_xpos", "right")
        name_ypos = ini_read_string("smallface", "name_ypos", "bottom")
        numb_xpos = ini_read_real("smallface", "numb_xpos", 80)
        numb_ypos = ini_read_real("smallface", "numb_ypos", 120)
        smalltext = ini_read_string("smallface", "smalltext", "Example Dialogue.")
        maintext = ini_read_string("smallface", "maintext", "* Example text.")
        ini_close()
        if (position == "name")
            scr_smallface(0, smallname, emotion, name_xpos, name_ypos, smalltext)
        else
            scr_smallface(0, smallname, emotion, numb_xpos, numb_ypos, smalltext)
        global.msg[0] = maintext
        d = d_make()
        d.side = 1
    }
    else
        snd_play(snd_queen_hoot_0)
}
if d_ex()
    global.interact = 1
else
    global.interact = 0
if keyboard_check_pressed(ord("P"))
{
    snd_play(snd_camera_flash)
    var date = ((((((((((string(date_get_year(date_current_datetime())) + "_") + string(date_get_month(date_current_datetime()))) + "_") + string(date_get_day(date_current_datetime()))) + "_") + string(date_get_hour(date_current_datetime()))) + "_") + string(date_get_minute(date_current_datetime()))) + "_") + string(date_get_second(date_current_datetime())))
    screen_save((("Smallface_Screenshot_" + date) + ".png"))
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
