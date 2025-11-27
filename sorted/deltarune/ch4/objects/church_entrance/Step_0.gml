if (con < 0)
    exit;
if (con == 5 && global.interact == 0 && !d_ex())
{
    con = -1;
    global.interact = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    if (kr_actor.y < 100)
    {
        c_sel(kr);
        c_autodepth(0);
        c_depth(97000);
        c_walkdirect_wait(kr_actor.x, 100, 6);
        c_walkdirect(390, 100, 12);
        c_delayfacing(13, "u");
    }
    else
    {
        c_sel(kr);
        c_autodepth(0);
        c_depth(97000);
        c_autowalk(0);
        c_sprite(spr_krisu);
        c_imagespeed(0.2);
        c_walkdirect_wait(390, 100, 16);
        c_halt();
    }
    if (su_actor.y < 92 || su_actor.x > 422)
    {
        c_sel(su);
        c_autodepth(0);
        c_depth(96900);
        c_walkdirect_wait(su_actor.x, 92, 6);
        c_walkdirect_wait(360, 92, 12);
        c_facing("u");
    }
    else
    {
        c_sel(su);
        c_autowalk(0);
        c_autodepth(0);
        c_depth(96900);
        c_sprite(spr_susie_walk_up_lw);
        c_imagespeed(0.2);
        c_walkdirect(360, 92, 16);
        c_delaycmd(17, "imagespeed", 0);
        c_delaycmd(17, "imageindex", 0);
    }
    c_wait(15);
    if (scr_flag_get(1509) == 0)
    {
        c_msc(1395);
        c_talk_wait();
    }
    else
    {
        c_msc(1397);
        c_talk_wait();
    }
    c_waitcustom();
}
if (con == 10 && !d_ex())
{
    con = 25;
    global.interact = 1;
    scr_speaker("susie");
    msgsetloc(0, "\\EL* Obviously. Heh heh.../", "obj_church_entrance_slash_Step_0_gml_56_0");
    msgnextloc("\\EK* ..^1. Okay^1, quit smiling^1, dumbass. What's the real answer?/%", "obj_church_entrance_slash_Step_0_gml_57_0");
    var d = d_make();
    d.stay = 5;
}
if (con == 20 && !d_ex())
{
    con = 25;
    global.interact = 1;
    scr_speaker("susie");
    msgsetloc(0, "\\E1* So it just kinda helps you..^1. pray for people?/", "obj_church_entrance_slash_Step_0_gml_68_0");
    msgnextloc("\\E6* .../", "obj_church_entrance_slash_Step_0_gml_69_0");
    msgnextloc("\\E6* ..^1. hey^1, my...name's here. That means someone must have.../", "obj_church_entrance_slash_Step_0_gml_70_0");
    msgnextloc("\\ED* .../%", "obj_church_entrance_slash_Step_0_gml_71_0");
    var d = d_make();
    d.stay = 5;
}
if (con == 25 && !d_ex())
{
    con = -1;
    global.interact = 1;
    global.msc = 1397;
    scr_text(global.msc);
    d_make();
}
if (con == 26 && !d_ex())
{
    con = -1;
    global.interact = 0;
}
if (con == 30 && !d_ex())
{
    con = 90;
    global.interact = 1;
    scr_speaker("no_name");
    msgsetloc(0, "* (You clasped your hands tightly^1, took a deep breath^1, and said her name.)/", "obj_church_entrance_slash_Step_0_gml_101_0");
    scr_anyface_next("susie", 5);
    msgnextloc("\\E5* ..^1. Hey^1, don't pray for me^1, dumbass^1! I don't need it!/%", "obj_church_entrance_slash_Step_0_gml_103_0");
    d_make();
}
if (con == 40 && !d_ex())
{
    con = 90;
    global.interact = 1;
    scr_speaker("no_name");
    msgsetloc(0, "* (You loosely joined your hands and mumbled the name of her father.)/", "obj_church_entrance_slash_Step_0_gml_113_0");
    var susie_face = 20;
    var susie_text = stringsetloc("\\EK* ..^1. who the hell is that?/%", "obj_church_entrance_slash_Step_0_gml_117_0");
    var _save_exists = false;
    for (var i = 0; i < 3; i++)
    {
        var _ch = i + 1;
        for (var j = 0; j < 2; j++)
        {
            var _file_exists = ossafe_file_exists("filech" + string(_ch) + "_" + string(j));
            if (_file_exists)
            {
                _save_exists = true;
                break;
            }
        }
    }
    if (scr_flag_get(316) > 0 || scr_flag_get(752) > 0 || !_save_exists)
    {
        susie_face = 15;
        susie_text = stringsetloc("\\ED* ..^1. Yeah..^1. I hope..^1. he gets better^1, too.../%", "obj_church_entrance_slash_Step_0_gml_138_0");
    }
    scr_anyface_next("susie", susie_face);
    msgnext(susie_text);
    d_make();
}
if (con == 50 && !d_ex() && customcon == 1)
{
    con = 51;
    customcon = 0;
    c_waitcustom_end();
    c_sel(kr);
    c_sprite(spr_kris_kick_heavy);
    c_var_lerp("image_index", 0, 8, 12);
    c_delaycmd(13, "imagespeed", 0);
    c_wait(2);
    c_sel(su);
    c_addxy(-8, 0);
    c_sprite(spr_susie_shocked_behind_right_lw);
    c_shakeobj();
    c_waitcustom();
}
if (con == 51 && customcon == 1 && !d_ex())
{
    con = 53;
    snd_play(snd_impact);
    snd_play(snd_glassbreak);
    with (candle_marker)
        scr_shakeobj();
}
if (con == 53 && customcon == 1 && !d_ex())
{
    con = 90;
    customcon = 0;
    c_waitcustom_end();
    c_wait(30);
    c_sel(kr);
    c_sprite(spr_krisu);
    c_msgside("top");
    c_speaker("susie");
    c_msgsetloc(0, "\\EZ* H..^1. hey^1! Hey^1, Kris^1, don't!/", "obj_church_entrance_slash_Step_0_gml_195_0");
    c_msgnextloc("\\ES* Look^1, I like breaking stuff too^1, but.../", "obj_church_entrance_slash_Step_0_gml_196_0");
    c_msgnextloc("\\ET* ..^1. your..^1. name's on here too^1, idiot./%", "obj_church_entrance_slash_Step_0_gml_197_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_autowalk(0);
    c_sprite(spr_susie_head_scratch);
    c_flip("x");
    c_imagespeed(0.2);
    c_addxy(4, -1);
    c_wait_box(2);
    c_sel(su);
    c_autowalk(1);
    c_facing("r");
    c_flip("x");
    c_halt();
    c_addxy(-2, 1);
    c_wait_talk();
    c_waitcustom();
}
if (con == 60 && !d_ex())
{
    con = 90;
    global.interact = 1;
    scr_speaker("no_name");
    msgsetloc(0, "* (You put your hands together and said his name^1, blankly.)/", "obj_church_entrance_slash_Step_0_gml_227_0");
    scr_anyface_next("susie", 20);
    msgnextloc("\\EK* ..^1. At least pretend to try./%", "obj_church_entrance_slash_Step_0_gml_229_0");
    d_make();
}
if (con == 90 && customcon == 1 && !d_ex())
{
    con = 100;
    customcon = 0;
    global.facing = 0;
    c_waitcustom_end();
    c_sel(su);
    c_sprite(spr_susie_walk_down_lw);
    c_autowalk(1);
    c_delaywalk(4, "d", 1, 8);
    c_sel(kr);
    c_autowalk(1);
    c_imagespeed(0.2);
    c_walk_wait("d", 1, 12);
    c_pannable(1);
    c_panobj(kr_actor, 8);
    c_wait(9);
    c_pannable(0);
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 100 && !d_ex() && !i_ex(obj_cutscene_master))
{
    con = -1;
    global.interact = 0;
}
