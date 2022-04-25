hasitems = global.litem[0] != 0
if (global.interact == 5)
{
    currentmenu = global.menuno
    if (global.menuno < 6)
        currentspot = global.menucoord[global.menuno]
    if button1_p_ch1()
    {
        if (global.menuno == 5)
        {
            if (global.menucoord[5] == 0)
            {
                global.menuno = 9
                script_execute(gml_Script_scr_litemuseb_ch1, global.menucoord[1], global.litem[global.menucoord[1]])
            }
            if (global.menucoord[5] == 1)
            {
                global.menuno = 9
                script_execute(gml_Script_scr_litemdesc_ch1, global.litem[global.menucoord[1]])
                script_execute(gml_Script_scr_writetext_ch1, 0, "x", 0, 0)
            }
            if (global.menucoord[5] == 2)
            {
                dontthrow = 0
                global.menuno = 9
                if (global.litem[global.menucoord[1]] == 5)
                    dontthrow = 1
                if (dontthrow == 0)
                {
                    i = round(random(30))
                    if (i == 0)
                        global.msg[0] = ((scr_84_get_lang_string_ch1("obj_overworldc_slash_Step_0_gml_32_0") + global.litemname[global.menucoord[1]]) + ".")
                    if (i == 1)
                        global.msg[0] = scr_84_get_subst_string_ch1(scr_84_get_lang_string_ch1("obj_overworldc_slash_Step_0_gml_33_0"), global.litemname[global.menucoord[1]])
                    if (i == 2)
                        global.msg[0] = scr_84_get_subst_string_ch1(scr_84_get_lang_string_ch1("obj_overworldc_slash_Step_0_gml_35_0"), global.litemname[global.menucoord[1]])
                    if (i == 3)
                        global.msg[0] = ((scr_84_get_lang_string_ch1("obj_overworldc_slash_Step_0_gml_36_0") + global.litemname[global.menucoord[1]]) + ".")
                    if (i > 3)
                        global.msg[0] = scr_84_get_subst_string_ch1(scr_84_get_lang_string_ch1("obj_overworldc_slash_Step_0_gml_37_0"), global.litemname[global.menucoord[1]])
                    global.msg[0] += scr_84_get_lang_string_ch1("obj_overworldc_slash_Step_0_gml_38_0")
                    if (global.litem[global.menucoord[1]] == 8)
                    {
                        global.msg[0] = scr_84_get_lang_string_ch1("obj_overworldc_slash_Step_0_gml_41_0")
                        if (global.flag[263] == 0)
                            global.flag[263] = 1
                    }
                    script_execute(gml_Script_scr_writetext_ch1, 0, "x", 0, 0)
                    script_execute(gml_Script_scr_litemshift_ch1, global.menucoord[1], 0)
                }
                if (dontthrow == 1)
                {
                    global.msc = 10
                    scr_text_ch1(global.msc)
                    script_execute(gml_Script_scr_writetext_ch1, 10, "x", 0, 0)
                }
            }
        }
        if (global.menuno == 3)
        {
            global.menuno = 9
            script_execute(gml_Script_scr_litemuseb_ch1, global.menucoord[3], global.phone[global.menucoord[3]])
        }
        if (global.menuno == 1)
        {
            global.menuno = 5
            global.menucoord[5] = 0
        }
        if (global.menuno == 0)
            global.menuno += (global.menucoord[0] + 1)
        if (global.menuno == 3)
        {
            script_execute(gml_Script_scr_phonename_ch1)
            global.menucoord[3] = 0
        }
        if (global.menuno == 1)
        {
            if (global.litem[0] != 0)
            {
                global.menucoord[1] = 0
                script_execute(gml_Script_scr_litemname_ch1)
            }
            else
                global.menuno = 0
        }
    }
    if up_p_ch1()
    {
        if (global.menuno == 0)
        {
            if (global.menucoord[0] != 0)
                global.menucoord[0] -= 1
        }
        if (global.menuno == 1)
        {
            if (global.menucoord[1] != 0)
                global.menucoord[1] -= 1
        }
        if (global.menuno == 3)
        {
            if (global.menucoord[3] != 0)
                global.menucoord[3] -= 1
        }
    }
    if down_p_ch1()
    {
        if (global.menuno == 0)
        {
            if (global.menucoord[0] != 2)
                global.menucoord[0] += 1
        }
        if (global.menuno == 1)
        {
            if (global.menucoord[1] != 7)
            {
                if (global.litem[(global.menucoord[1] + 1)] != 0)
                    global.menucoord[1] += 1
            }
        }
        if (global.menuno == 3)
        {
            if (global.menucoord[3] != 7)
            {
                if (global.phone[(global.menucoord[3] + 1)] != 0)
                    global.menucoord[3] += 1
            }
        }
    }
    if (button2_p_ch1() && buffer >= 0)
    {
        if (global.menuno == 0)
        {
            global.menuno = -1
            global.interact = 0
        }
        else if (global.menuno <= 3)
            global.menuno = 0
        if (global.menuno == 5)
            global.menuno = 1
    }
    if right_p_ch1()
    {
        if (global.menuno == 5)
        {
            if (global.menucoord[5] != 2)
                global.menucoord[5] += 1
        }
    }
    if left_p_ch1()
    {
        if (global.menuno == 5)
        {
            if (global.menucoord[5] != 0)
                global.menucoord[5] -= 1
        }
    }
    if (button3_p_ch1() && threebuffer <= 0)
    {
        if (global.menuno == 0)
        {
            global.menuno = -1
            global.interact = 0
            with (obj_mainchara_ch1)
                threebuffer = 2
        }
    }
    if (currentmenu < global.menuno && global.menuno != 9)
        selnoise = true
    else if (global.menuno >= 0 && global.menuno < 6)
    {
        if (currentspot != global.menucoord[global.menuno])
            movenoise = true
    }
}
if (global.menuno == 9 && instance_exists(obj_dialoguer_ch1) == 0)
{
    global.menuno = -1
    global.interact = 0
}
if (selnoise == true)
{
    snd_play_ch1(snd_select_ch1)
    selnoise = false
}
if (movenoise == true)
{
    snd_play_ch1(snd_menumove_ch1)
    movenoise = false
}
if scr_debug_ch1()
{
    if keyboard_check_pressed(ord("S"))
        instance_create_ch1(0, 0, obj_savemenu_ch1)
    if keyboard_check_pressed(ord("F"))
        room_speed = 58
    if keyboard_check_pressed(ord("L"))
        ossafe_savedata_load_ch1()
    if keyboard_check_pressed(ord("R"))
        game_restart_true_ch1()
}
threebuffer--
