dtsprite = spr_toriel_dt_ch1
rtsprite = spr_toriel_rt_ch1
ltsprite = spr_toriel_lt_ch1
utsprite = spr_toriel_ut_ch1
myinteract = 0
facing = 0
dfacing = 0
image_speed = 0
talked = false
ourcase = 0
if (global.darkzone == true)
{
    image_xscale = 2
    image_yscale = 2
}
normalanim = 1
remanimspeed = 0
depthbonus = 0
depthcancel = false
if (room == room_alphysclass_ch1)
{
    facing = 2
    dfacing = 2
    ourcase = 1
    if (y < 172)
    {
        dtsprite = spr_noelle_dt_ch1
        rtsprite = spr_noelle_ut_r_ch1
        utsprite = spr_noelle_ut_ch1
        ltsprite = spr_noelle_ut_l_ch1
        if (x > 120)
        {
            utsprite = spr_berdly_ut_ch1
            rtsprite = spr_berdly_ut_r_ch1
            ltsprite = spr_berdly_ut_l_ch1
            dtsprite = spr_berdly_ut_ch1
        }
    }
    if (y > 172)
    {
        dtsprite = spr_catti_ut_ch1
        utsprite = spr_catti_ut_ch1
        rtsprite = spr_catti_ut_ch1
        ltsprite = spr_catti_ut_ch1
        if (x > 120)
        {
            dtsprite = spr_mkid_ut_ch1
            rtsprite = spr_mkid_ut_r_ch1
            ltsprite = spr_mkid_ut_l_ch1
            utsprite = spr_mkid_ut_ch1
        }
    }
    if (y > 212)
    {
        dtsprite = spr_jockington_ut_ch1
        utsprite = spr_jockington_ut_ch1
        rtsprite = spr_jockington_rt_ch1
        ltsprite = spr_jockington_lt_ch1
        if (x > 120)
        {
            utsprite = spr_snowy_ut_ch1
            ltsprite = spr_snowy_ut_l_ch1
            rtsprite = spr_snowy_ut_r_ch1
            dtsprite = spr_snowy_ut_ch1
        }
    }
    if (y < 100)
    {
        facing = 0
        dfacing = 0
        dtsprite = spr_alphysd_ch1
        ltsprite = spr_alphysl_ch1
        rtsprite = spr_alphysr_ch1
        utsprite = spr_alphysu_ch1
    }
}
if (room == room_field2_ch1)
{
    facing = 0
    dfacing = 0
    dtsprite = spr_lancer_dt_ch1
    utsprite = spr_lancer_dt_ch1
    rtsprite = spr_lancer_rt_ch1
    ltsprite = spr_lancer_lt_ch1
    if (room == room_field2_ch1)
    {
        if (global.plot >= 35)
            instance_destroy()
    }
}
if (room == room_forest_maze_deadend_ch1)
{
    facing = 0
    dfacing = 0
    if (global.plot < 95)
        global.plot = 95
    global.flag[293] += 1
    dtsprite = spr_lancer_dt_ch1
    utsprite = spr_lancer_dt_ch1
    rtsprite = spr_lancer_rt_ch1
    ltsprite = spr_lancer_lt_ch1
    if (global.plot >= 120)
        instance_destroy()
}
if (room == room_forest_maze_deadend2_ch1)
{
    facing = 2
    dfacing = 2
    global.flag[294] += 1
    dtsprite = spr_susied_dark_ch1
    utsprite = spr_susieu_dark_ch1
    rtsprite = spr_susier_dark_ch1
    ltsprite = spr_susiel_dark_ch1
    if (global.plot >= 120)
        instance_destroy()
}
if (room == room_field_boxpuzzle_ch1)
{
    type = 0
    if (x < (room_width / 2))
    {
        sprite_index = spr_ralseid_ch1
        dtsprite = spr_ralseid_ch1
        utsprite = spr_ralseiu_ch1
        rtsprite = spr_ralseir_ch1
        ltsprite = spr_ralseil_ch1
        y += sprite_height
    }
    else
    {
        type = 1
        sprite_index = spr_susied_ch1
        dtsprite = spr_susied_dark_ch1
        utsprite = spr_susieu_dark_ch1
        rtsprite = spr_susier_dark_ch1
        ltsprite = spr_susiel_dark_ch1
        y += sprite_height
    }
}
if (room == room_cc_kingbattle_ch1)
{
    if (global.plot < 240)
        instance_destroy()
    sprite_index = spr_ralseid_ch1
    dtsprite = spr_ralseid_ch1
    utsprite = spr_ralseiu_ch1
    rtsprite = spr_ralseir_ch1
    ltsprite = spr_ralseil_ch1
    y += sprite_height
}
if (room == room_cc_throneroom_ch1)
{
    if (global.plot < 240)
        instance_destroy()
    sprite_index = spr_lancer_dt_ch1
    dtsprite = spr_lancer_dt_ch1
    utsprite = spr_lancer_ut_ch1
    rtsprite = spr_lancer_rt_ch1
    ltsprite = spr_lancer_lt_ch1
    y += sprite_height
    depthbonus = -250
}
if (room == room_forest_area1_ch1)
{
    sprite_index = spr_susier_dark_ch1
    rtsprite = spr_susier_dark_ch1
    dtsprite = spr_susied_dark_ch1
    utsprite = spr_susieu_dark_ch1
    ltsprite = spr_susiel_dark_ch1
    facing = 1
    dfacing = 1
    if (x >= 1160)
    {
        facing = 3
        dfacing = 3
        sprite_index = spr_lancer_lt_ch1
        dtsprite = spr_lancer_dt_ch1
        utsprite = spr_lancer_dt_ch1
        rtsprite = spr_lancer_rt_ch1
        ltsprite = spr_lancer_lt_ch1
    }
    if (global.plot > 70)
        instance_destroy()
}
if (room == room_forest_area3_ch1)
{
    if (x >= 600)
    {
        facing = 2
        dfacing = 2
        sprite_index = spr_lancer_ut_ch1
        dtsprite = spr_lancer_dt_ch1
        utsprite = spr_lancer_ut_ch1
        rtsprite = spr_lancer_rt_ch1
        ltsprite = spr_lancer_lt_ch1
    }
    else
    {
        facing = 2
        dfacing = 2
        sprite_index = spr_susieut_dark_ch1
        dtsprite = spr_susiedt_dark_ch1
        utsprite = spr_susieut_dark_ch1
        rtsprite = spr_susiert_dark_ch1
        ltsprite = spr_susielt_dark_ch1
    }
}
if (room == room_library_ch1)
{
    if (x < 120)
    {
        facing = 1
        dfacing = 1
        dtsprite = spr_berdly_library_r_ch1
        utsprite = spr_berdly_library_u_ch1
        rtsprite = spr_berdly_library_r_ch1
        ltsprite = spr_berdly_library_u_ch1
        depthcancel = true
        depth = 4000
    }
    if (x > 150)
    {
        facing = 1
        dfacing = 1
        dtsprite = spr_jockington_ut_ch1
        utsprite = spr_jockington_ut_ch1
        rtsprite = spr_jockington_rt_ch1
        ltsprite = spr_jockington_lt_ch1
    }
    if (x > 220)
    {
        facing = 3
        dfacing = 3
        dtsprite = spr_tem_sit_l_ch1
        rtsprite = spr_tem_sit_r_ch1
        utsprite = spr_tem_sit_ch1
        ltsprite = spr_tem_sit_l_ch1
    }
}
if (room == room_flowershop_1f_ch1)
{
    facing = 0
    dfacing = 0
    dtsprite = spr_asgored_ch1
    utsprite = spr_asgoreu_ch1
    rtsprite = spr_asgorer_ch1
    ltsprite = spr_asgorel_ch1
}
if (room == room_flowershop_2f_ch1)
{
    facing = 2
    dfacing = 2
    dtsprite = spr_asgored_ch1
    utsprite = spr_asgoreu_ch1
    rtsprite = spr_asgorer_ch1
    ltsprite = spr_asgorel_ch1
}
if (room == room_alphysalley_ch1)
{
    facing = 3
    dfacing = 3
    dtsprite = spr_alphysd_ch1
    utsprite = spr_alphysu_ch1
    rtsprite = spr_alphysr_ch1
    ltsprite = spr_alphysl_ch1
}
if (room == room_town_south_ch1)
{
    facing = 0
    dfacing = 0
    dtsprite = spr_undyne_dt_ch1
    utsprite = spr_undyne_ut_ch1
    rtsprite = spr_undyne_rt_ch1
    ltsprite = spr_undyne_lt_ch1
}
if (room == room_town_mid_ch1)
{
    facing = 0
    dfacing = 0
    dtsprite = spr_sans_d_ch1
    ltsprite = spr_sans_l_ch1
    utsprite = spr_sans_u_ch1
    rtsprite = spr_sans_r_ch1
}
if (room == room_town_north_ch1)
{
    facing = 3
    dfacing = 3
    dtsprite = spr_noelle_dt_ch1
    ltsprite = spr_noelle_lt_ch1
    utsprite = spr_noelle_ut_ch1
    rtsprite = spr_noelle_rt_ch1
    if (global.flag[255] < 1)
        instance_destroy()
}
scr_npcdir_ch1()
y -= sprite_height
if (depthcancel == false)
    scr_depth_ch1()
depth += depthbonus
