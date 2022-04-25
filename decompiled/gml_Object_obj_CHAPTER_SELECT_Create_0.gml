global.is_console = (os_type == os_switch || os_type == os_ps4)
global.chapter_debug_init = 0
global.savedata_async_id = -1
global.savedata_async_load = 0
global.savedata_error = 0
global.savedata_debuginfo = ""
window_set_caption("DELTARUNE Chapter 1&2")
if instance_exists(obj_time_ch1)
{
    with (obj_time_ch1)
        instance_destroy()
}
if instance_exists(obj_time)
{
    with (obj_time)
        instance_destroy()
}
if instance_exists(obj_debugcontroller_ch1)
{
    with (obj_debugcontroller_ch1)
        instance_destroy()
}
if variable_global_exists("chapter_return")
{
    global.lang_loaded = ""
    var load_chapter = global.chapter_return
    global.chapter_return = -1
    snd_free_all()
    if (load_chapter == 1)
    {
        room_goto(ROOM_INITIALIZE_ch1)
        return;
    }
    else if (load_chapter == 2)
    {
        room_goto(ROOM_INITIALIZE)
        return;
    }
}
if (os_type == os_switch && (!variable_global_exists("switchlogin")))
{
    for (var _id = -1; _id < 0; _id = switch_accounts_select_account(1, 0, 0))
    {
    }
    global.switchlogin = _id
    switch_accounts_open_user(global.switchlogin)
}
first_time = global.is_console
init_loaded = 0
display_height = display_get_height()
display_width = display_get_width()
window_size_multiplier = 1
for (_ww = 2; _ww < 6; _ww += 1)
{
    if (display_width > (640 * _ww) && display_height > (480 * _ww))
        window_size_multiplier = _ww
}
if (window_size_multiplier > 1)
{
    window_set_size((640 * window_size_multiplier), (480 * window_size_multiplier))
    alarm[0] = 1
}
if global.is_console
{
    application_surface_enable(true)
    application_surface_draw_enable(false)
}
global.debug = true
con = "init"
file_found = 0
highestUncompletedChapter = 0
highestCompletedChapter = 0
stringset = "0"
yes = "Yes"
no = "No"
mpos = 0
chapterselectinit = 0
timer = 0
drawcolor = c_black
yy = (room_height / 2)
xx = (room_width / 2)
fademax = 10
fade = fademax
chaptertoload = 0
chaptertoload_temp = 0
console = (os_type == os_switch || os_type == os_ps4)
latestAvailableChapter = 2
chapname[0] = " - - "
chapname[1] = "The Beginning"
chapname[2] = "A Cyber's World"
chapname[3] = " - - "
chapname[4] = " - - "
chapname[5] = " - - "
chapname[6] = " - - "
chapname[7] = " - - "
text_font = 3
roominit = 0
scale = 1
fadeout = 1
xscale = 1
yscale = 1
spr_aftereffect = 0
confirm_choice_index = 0
move_noise = 0
select_noise = 0
for (i = 0; i < 10; i += 1)
{
    global.input_pressed[i] = false
    global.input_held[i] = false
    global.input_released[i] = false
}
if global.is_console
{
    if (os_type == os_switch)
    {
        switch_controller_support_set_defaults()
        switch_controller_support_set_singleplayer_only(1)
        switch_controller_set_supported_styles(7)
    }
    if (os_type == os_ps4)
        ps4_touchpad_mouse_enable(0)
    ossafe_savedata_load()
}
else
{
    var _locale = os_get_language()
    var _lang = (substr(_locale, 1, 2) != "ja" ? "en" : "ja")
    global.lang = _lang
    if ossafe_file_exists("true_config.ini")
    {
        ossafe_ini_open("true_config.ini")
        global.lang = ini_read_string("LANG", "LANG", _lang)
        var is_fullscreen = ini_read_real("SCREEN", "FULLSCREEN", 0)
        window_set_fullscreen(is_fullscreen)
        ossafe_ini_close()
    }
    text_font = (global.lang == "en" ? 3 : 10)
    yes = (global.lang == "en" ? "Yes" : "はい")
    no = (global.lang == "en" ? "No" : "いいえ")
    chapname[1] = (global.lang == "en" ? "The Beginning" : "はじまり")
    chapname[2] = (global.lang == "en" ? "A Cyber's World" : "サイバーワールド")
    scr_controls_default()
    audio_group_load(1)
    init_loaded = 1
}
