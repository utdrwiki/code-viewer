timer++
if (timer == 30)
    scr_battle(74, false, marker1, marker2, marker3)
if (timer == 60)
    audio_stop_all()
if (timer > 60)
{
    if keyboard_check_pressed(ord("1"))
    {
        safe_delete(obj_battleblcon)
        safe_delete(obj_writer)
        global.typer = 50
        ini_open("ballooner.txt")
        text = ini_read_string("ballooner", "text", text)
        ini_close()
        msgset(0, text)
        scr_heroblcon("kr")
    }
    if keyboard_check_pressed(ord("2"))
    {
        safe_delete(obj_battleblcon)
        safe_delete(obj_writer)
        global.typer = 50
        ini_open("ballooner.txt")
        text = ini_read_string("ballooner", "text", text)
        ini_close()
        msgset(0, text)
        scr_heroblcon("su")
    }
    if keyboard_check_pressed(ord("3"))
    {
        safe_delete(obj_battleblcon)
        safe_delete(obj_writer)
        global.typer = 50
        ini_open("ballooner.txt")
        text = ini_read_string("ballooner", "text", text)
        ini_close()
        msgset(0, text)
        scr_heroblcon("ra")
    }
    if keyboard_check_pressed(ord("4"))
    {
        safe_delete(obj_battleblcon)
        safe_delete(obj_writer)
        global.typer = 50
        ini_open("ballooner.txt")
        text = ini_read_string("ballooner", "text", text)
        ini_close()
        msgset(0, text)
        scr_enemyblcon((global.monsterx[0] + xmod), (global.monstery[0] + ymod), 10)
    }
    if keyboard_check_pressed(ord("5"))
    {
        safe_delete(obj_battleblcon)
        safe_delete(obj_writer)
        global.typer = 50
        ini_open("ballooner.txt")
        text = ini_read_string("ballooner", "text", text)
        ini_close()
        msgset(0, text)
        scr_enemyblcon((global.monsterx[1] + xmod), (global.monstery[1] + ymod), 10)
    }
    if keyboard_check_pressed(ord("6"))
    {
        safe_delete(obj_battleblcon)
        safe_delete(obj_writer)
        global.typer = 50
        ini_open("ballooner.txt")
        text = ini_read_string("ballooner", "text", text)
        ini_close()
        msgset(0, text)
        scr_enemyblcon((global.monsterx[2] + xmod), (global.monstery[2] + ymod), 10)
    }
}
if keyboard_check_pressed(ord("T"))
{
    ini_open("ballooner.txt")
    text = ini_read_string("ballooner", "text", text)
    ini_close()
}
draw_set_color(c_white)
draw_set_font(fnt_main)
draw_rectangle(0, 292, 640, 300, false)
draw_set_color(c_black)
draw_rectangle(0, 296, 640, 480, false)
draw_set_color(c_white)
draw_text(10, 300, "[1] kris balloon")
draw_text(10, 320, "[2] ralsei balloon")
draw_text(10, 340, "[3] susie balloon")
draw_text(150, 300, "[4] enemy 1 balloon")
draw_text(150, 320, "[5] enemy 2 balloon")
draw_text(150, 340, "[6] enemy 3 balloon")
draw_text(10, 360, "[P] Take Screenshot")
draw_text(150, 360, "[C] Switch Language")
draw_set_color(c_orange)
draw_text(300, 360, ("global.lang=" + global.lang))
draw_set_color(c_white)
draw_set_halign(fa_center)
draw_text(320, 390, "Current Text String Loaded (Press T to Reload from ballooner.txt)")
draw_set_color(c_yellow)
if (global.lang == "en")
    draw_set_font(fnt_mainbig)
else
    draw_set_font(fnt_ja_mainbig)
draw_text(320, 410, text)
draw_set_color(c_white)
draw_set_font(fnt_main)
draw_set_halign(fa_left)
draw_text(300, 310, "[  LEFT  /  RIGHT]    Balloon X Modifier:")
draw_text(300, 330, "[   UP   /      DOWN ]    Balloon Y Modifier:")
draw_set_halign(fa_right)
draw_set_color(c_yellow)
draw_text(570, 310, string(xmod))
draw_text(570, 330, string(ymod))
draw_set_color(c_white)
draw_set_halign(fa_left)
if ((timer % 2) == 0)
{
    if left_h()
        xmod--
    if right_h()
        xmod++
    if up_h()
        ymod--
    if down_h()
        ymod++
}
if keyboard_check_pressed(ord("C"))
{
    draw_set_alpha(0.9)
    draw_set_color(c_black)
    draw_rectangle(0, 0, 640, 480, false)
    draw_set_alpha(1)
    draw_set_color(c_white)
    draw_set_halign(fa_center)
    draw_set_font(fnt_mainbig)
    draw_text(320, 200, "PLEASE WAIT WHILE WE LOAD THE TEXT")
    draw_text(320, 240, "THE ROOM WILL BE RELOADED")
    alarm[0] = 1
}
if keyboard_check_pressed(ord("P"))
{
    snd_play(snd_camera_flash)
    var date = ((((((((((string(date_get_year(date_current_datetime())) + "_") + string(date_get_month(date_current_datetime()))) + "_") + string(date_get_day(date_current_datetime()))) + "_") + string(date_get_hour(date_current_datetime()))) + "_") + string(date_get_minute(date_current_datetime()))) + "_") + string(date_get_second(date_current_datetime())))
    screen_save((("Ballooner_Screenshot_" + date) + ".png"))
}
