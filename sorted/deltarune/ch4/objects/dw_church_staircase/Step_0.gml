if (con < 0)
    exit;
if (con == 0 && obj_mainchara.x >= 240 && global.interact == 0)
{
    con = 10;
    global.interact = 1;
    global.facing = 0;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(ra);
    c_walkdirect(186, 198, 30);
    c_sel(kr);
    c_walkdirect(328, 209, 30);
    c_delayfacing(31, "l");
    c_sel(su);
    c_walkdirect(270, 193, 30);
    c_delayfacing(31, "l");
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EQ* Looks like..^1. this is the Fountain./", "obj_dw_church_staircase_slash_Step_0_gml_28_0");
    c_facenext("susie", 0);
    c_msgnextloc("\\E0* ..^1. Yeah^1, guess this is it./", "obj_dw_church_staircase_slash_Step_0_gml_30_0");
    c_facenext("ralsei", "J");
    c_msgnextloc("\\EJ* ..^1. phew./", "obj_dw_church_staircase_slash_Step_0_gml_32_0");
    c_msgnextloc("\\E2* Kris^1, Susie^1, I suppose I'll see you in the Castle Town./", "obj_dw_church_staircase_slash_Step_0_gml_33_0");
    c_facenext("susie", "0");
    c_msgnextloc("\\E0* Yeah.../%", "obj_dw_church_staircase_slash_Step_0_gml_35_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_facing("u");
    c_wait_box(4);
    c_sel(su);
    c_facing("l");
    c_sel(ra);
    c_sprite(spr_ralsei_head_down_smile_right);
    c_wait_box(5);
    c_sel(ra);
    c_facing("r");
    c_wait_talk();
    c_wait(30);
    if (scr_flag_get(1514) > 0)
    {
        c_sel(su);
        c_sprite(spr_susie_pose);
        c_shakeobj();
        c_snd_play(snd_noise);
        c_sel(ra);
        c_sprite(spr_ralsei_surprised_right);
        c_speaker("susie");
        c_msgsetloc(0, "\\E9* Let's have another tea party or something!/", "obj_dw_church_staircase_slash_Step_0_gml_69_0");
        c_facenext("ralsei", "H");
        c_msgnextloc("\\EH* Haha^1, sure^1, Susie!/%", "obj_dw_church_staircase_slash_Step_0_gml_71_0");
        c_talk();
        c_wait_box(2);
        c_sel(ra);
        c_sprite(spr_ralsei_walk_right_smile);
        c_wait_talk();
    }
    c_sel(su);
    c_facing("u");
    c_sel(kr);
    c_facing("u");
    c_wait(30);
    c_sel(ra);
    c_walkdirect(301, 198, 30);
    c_delayfacing(31, "u");
    c_sel(kr);
    c_walkdirect(328, 156, 30);
    c_sel(su);
    c_walkdirect(270, 137, 30);
    c_wait_if(kr_actor, "y", "<=", 164);
    c_var_instance(id, "kris_hide", true);
    c_var_instance(id, "susie_hide", true);
    c_wait(45);
    c_customfunc(function()
    {
        with (obj_border_controller)
        {
            set_border(border_dw_church_a, 1);
            hide_border(0.025);
        }
    });
    c_var_lerp_instance(blackall, "image_alpha", 0, 1, 60);
    c_wait(90);
    c_waitcustom();
}
if (con == 10 && customcon == 1)
{
    con = -1;
    global.interact = 3;
    instance_create(0, 0, obj_persistentfadein);
    room_goto(room_dw_church_fountain);
}
if (kris_hide)
{
    kris_shadow = clamp(kris_shadow + 0.2, 0, 1);
    var shadow = kris_shadow;
    with (kr_actor)
        color_blend = merge_color(c_white, make_color_hsv(0, 0, 0), shadow);
    if (kris_shadow >= 1)
        kris_hide = false;
}
if (susie_hide)
{
    susie_shadow = clamp(susie_shadow + 0.2, 0, 1);
    var shadow = susie_shadow;
    with (su_actor)
        color_blend = merge_color(c_white, make_color_hsv(0, 0, 0), shadow);
    if (susie_shadow >= 1)
        susie_hide = false;
}
