if (con == 1)
{
    con = 1
    global.interact = 1
    global.facing = 3
    sneo = scr_dark_marker(288, -170, spr_spamton_defeat_vines)
    with (sneo)
        scr_depth()
    cutscene_master = scr_cutscene_make()
    scr_maincharacters_actors()
    c_sel(kr)
    c_setxy(304, 221)
    c_facing("u")
    c_sel(ra)
    c_setxy(215, 310)
    c_facing("u")
    c_sel(su)
    c_setxy(374, 303)
    c_facing("u")
}
if (con == 1)
{
    con = 49
    alarm[0] = 30
    c_var_lerp_instance(whiteall, "image_alpha", 1, 0, 30)
    c_wait(30)
    c_speaker("spamton")
    c_msgsetloc(0, "* It seems after all I couldn't be anything more than a simple puppet./", "obj_ch2_sceneex2a_slash_Step_0_gml_48_0")
    c_msgnextloc("* But you three..^1. You're strong./", "obj_ch2_sceneex2a_slash_Step_0_gml_49_0")
    c_msgnextloc("* With a power like that.../", "obj_ch2_sceneex2a_slash_Step_0_gml_52_0")
    c_msgnextloc("* Maybe you three can break your own strings./", "obj_ch2_sceneex2a_slash_Step_0_gml_53_0")
    c_msgnextloc("* Let me become your strength./%", "obj_ch2_sceneex2a_slash_Step_0_gml_54_0")
    c_talk_wait()
    c_var_lerp_instance(sneo, "image_alpha", 1, 0, 60)
    c_wait(30)
    c_var_instance(sparkle, "x", 315)
    c_var_instance(sparkle, "y", 150)
    c_var_lerp_instance(sparkle, "image_alpha", 0, 1, 30)
    c_wait(30)
    c_var_lerp_instance(sparkle, "x", 315, 315, 45)
    c_var_lerp_instance(sparkle, "y", 150, 260, 45)
    c_wait(45)
    c_var_lerp_instance(sparkle, "image_alpha", 1, 0, 15)
    c_wait(45)
    if (global.flag[571] == 1)
    {
        scr_weaponget(21)
        if (noroom == true)
            global.flag[468] = 1
        else
        {
            c_soundplay(snd_item)
            c_speaker("no_name")
            c_msgsetloc(0, "* (You got PuppetScarf.)/%", "obj_ch2_sceneex2a_slash_Step_0_gml_88_0")
            c_talk_wait()
        }
    }
    else
    {
        global.flag[454] = 1
        scr_armorget(21)
        if (noroom == true)
            global.flag[468] = 1
        else
        {
            c_soundplay(snd_item)
            c_speaker("no_name")
            c_msgsetloc(0, "* (You got Dealmaker.)/%", "obj_ch2_sceneex2a_slash_Step_0_gml_82_0")
            c_talk_wait()
        }
    }
    scr_keyitemget(13)
    c_soundplay(snd_item)
    c_speaker("no_name")
    c_msgsetloc(0, "* (You got ShadowCrystal.)/%", "obj_ch2_sceneex2a_slash_Step_0_gml_95_0")
    c_talk_wait()
    c_mus2("volume", 0, 30)
    c_wait(30)
}
if (con == 50 && (!d_ex()))
{
    con = 60
    c_actortokris()
    c_actortocaterpillar()
    c_terminatekillactors()
}
if (con == 60 && (!i_ex(obj_cutscene_master)))
{
    con = -1
    global.interact = 0
    global.facing = 0
    global.flag[309] = 9
    snd_free_all()
    scr_tempsave()
}
