if (up_p())
{
    choice_index--;
    snd_play_x(snd_menumove, 1, 1.2);
}
if (down_p())
{
    choice_index++;
    snd_play_x(snd_menumove, 1, 1);
}
choice_index = scr_wrap_new(choice_index, 0, array_length(choice) - 1);
if (button1_p())
{
    if (choice_index == 0)
    {
        var menu_go = 0;
        var roomchoice = room_intro;
        var CH = string(global.chapter);
        if (ossafe_file_exists("filech" + CH + "_0"))
            menu_go = 1;
        if (ossafe_file_exists("filech" + CH + "_1"))
            menu_go = 1;
        if (ossafe_file_exists("filech" + CH + "_2"))
            menu_go = 1;
        if (ossafe_file_exists("filech" + CH + "_3"))
            menu_go = 1;
        if (ossafe_file_exists("dr.ini"))
            menu_go = 1;
        if (ossafe_file_exists("filech" + CH + "_3"))
            menu_go = 2;
        if (ossafe_file_exists("filech" + CH + "_4"))
            menu_go = 2;
        if (ossafe_file_exists("filech" + CH + "_5"))
            menu_go = 2;
        if (menu_go == 0 || menu_go == 1)
            roomchoice = room_intro;
        if (menu_go == 2)
        {
            scr_windowcaption("DELTARUNE");
            global.tempflag[10] = 1;
            roomchoice = room_legend;
            global.plot = 0;
        }
        global.darkzone = 0;
        room_goto(roomchoice);
    }
    else if (choice_index == 1)
    {
        room_goto_next();
    }
    else if (choice_index == 2)
    {
        scr_load();
    }
    else if (choice_index == 3)
    {
        room_goto(PLACE_MENU);
    }
    else if (choice_index == 4)
    {
        global.darkzone = 0;
        room_goto(room_ed);
        global.chemg_menu_depth = 0;
    }
}
if (scr_debug())
{
    if (keyboard_check_pressed(ord("L")))
        scr_load();
}
