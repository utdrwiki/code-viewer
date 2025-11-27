if (con == 1)
{
    con = 2;
    var maked = true;
    switch (playedfun)
    {
        case 1:
            scr_speaker("ralsei");
            msgsetloc(0, "\\E2* Aww^1, what a pretty melody^1! It's like a lullaby...!/%", "obj_dw_church_organpuzzle_slash_Step_0_gml_12_0");
            break;
        case 2:
            scr_speaker("ralsei");
            msgsetloc(0, "\\EH* Aww^1, that song sounds so friendly and sweet!/%", "obj_dw_church_organpuzzle_slash_Step_0_gml_16_0");
            break;
        case 3:
            scr_speaker("ralsei");
            msgsetloc(0, "\\EK* Umm..^1. that melody's a little.../", "obj_dw_church_organpuzzle_slash_Step_0_gml_20_0");
            scr_anyface_next("susie", "L");
            msgnextloc("\\EL* Annoying?/", "obj_dw_church_organpuzzle_slash_Step_0_gml_22_0");
            scr_anyface_next("ralsei", "L");
            msgnextloc("\\EL* UM...^1! I wouldn't say that!/", "obj_dw_church_organpuzzle_slash_Step_0_gml_24_0");
            scr_anyface_next("susie", "2");
            msgnextloc("\\E2* Duh^1, YOU wouldn't./%", "obj_dw_church_organpuzzle_slash_Step_0_gml_26_0");
            break;
        case 7:
            scr_speaker("ralsei");
            msgsetloc(0, "\\EH* Oh^1, that's Mr. Rouxls's theme!/", "obj_dw_church_organpuzzle_slash_Step_0_gml_30_0");
            scr_anyface_next("susie", "2");
            msgnextloc("\\E2* More like theme of him getting his ass kicked./%", "obj_dw_church_organpuzzle_slash_Step_0_gml_32_0");
            break;
        case 4:
            scr_speaker("ralsei");
            msgsetloc(0, "\\ED* Oh...!/", "obj_dw_church_organpuzzle_slash_Step_0_gml_36_0");
            scr_anyface_next("susie", "2");
            msgnextloc("\\E2* What^1, you gonna serenade Ralsei with that one?/%", "obj_dw_church_organpuzzle_slash_Step_0_gml_38_0");
            break;
        case 5:
            scr_speaker("susie");
            msgsetloc(0, "\\EV* .../", "obj_dw_church_organpuzzle_slash_Step_0_gml_42_0");
            scr_anyface_next("ralsei", "0");
            msgnextloc("\\E0* ..^1. Susie?/", "obj_dw_church_organpuzzle_slash_Step_0_gml_44_0");
            scr_anyface_next("susie", "Q");
            msgnextloc("\\EQ* Nothing..^1. just thought it was a kinda cool song./%", "obj_dw_church_organpuzzle_slash_Step_0_gml_46_0");
            break;
        case 6:
            scr_speaker("susie");
            msgsetloc(0, "\\EN* That one's..^1. kinda nice./", "obj_dw_church_organpuzzle_slash_Step_0_gml_50_0");
            msgnextloc("\\EA* Wonder if I could learn it on^1, uh^1, guitar./%", "obj_dw_church_organpuzzle_slash_Step_0_gml_51_0");
            break;
        case 8:
            scr_speaker("susie");
            msgsetloc(0, "\\E9* Hell yeah^1, that's majestic!/", "obj_dw_church_organpuzzle_slash_Step_0_gml_55_0");
            scr_anyface_next("ralsei", "2");
            msgnextloc("\\E2* Perhaps the Old Man would enjoy that one!/%", "obj_dw_church_organpuzzle_slash_Step_0_gml_57_0");
            break;
        case 9:
            scr_speaker("ralsei");
            msgsetloc(0, "\\E2* How emotional.../", "obj_dw_church_organpuzzle_slash_Step_0_gml_61_0");
            scr_anyface_next("susie", "7");
            msgnextloc("\\E7* Maybe you should play that for your mom./", "obj_dw_church_organpuzzle_slash_Step_0_gml_63_0");
            msgnextloc("\\EK* Y'know..^1. she hasn't heard you play in a while./%", "obj_dw_church_organpuzzle_slash_Step_0_gml_64_0");
            break;
        case 10:
        case 11:
        case 12:
            scr_speaker("susie");
            msgsetloc(0, "\\EH* Dude^1, stop messing around!/%", "obj_dw_church_organpuzzle_slash_Step_0_gml_70_0");
            break;
        case 13:
            scr_speaker("susie");
            msgsetloc(0, "\\EK* What's that song? Sounds like crap./%", "obj_dw_church_organpuzzle_slash_Step_0_gml_74_0");
            break;
        case 14:
            scr_speaker("susie");
            msgsetloc(0, "\\EB* Feel like I heard that one.../", "obj_dw_church_organpuzzle_slash_Step_0_gml_78_0");
            scr_anyface_next("ralsei", "U");
            msgnextloc("\\EU* ...?/", "obj_dw_church_organpuzzle_slash_Step_0_gml_80_0");
            scr_anyface_next("susie", "7");
            msgnextloc("\\E7* Yeah^1, that's right. Ralsei was humming it earlier./", "obj_dw_church_organpuzzle_slash_Step_0_gml_82_0");
            scr_anyface_next("ralsei", "D");
            msgnextloc("\\ED* O-oh^1, was I...? S-sorry...!/%", "obj_dw_church_organpuzzle_slash_Step_0_gml_84_0");
            break;
        case 15:
            maked = false;
            if (global.flag[1561] == 0)
            {
                snd_play_delay(snd_drive, 8, 1, 1);
                global.flag[1561] = 1;
                timer = 0;
                con = 72;
            }
            else
            {
                snd_stop(snd_krispiano);
                snd_play(snd_pianonoise);
                con = 2;
            }
            break;
        case 16:
            global.flag[6] = 1;
            scr_speaker("susie");
            msgsetloc(0, "\\EK* Huh..^1. why'd you play it so different?/", "obj_dw_church_organpuzzle_slash_Step_0_gml_104_0");
            msgnextloc("\\ED* Are you like..^1. nervous or something?/", "obj_dw_church_organpuzzle_slash_Step_0_gml_105_0");
            scr_anyface_next("ralsei", "Q");
            msgnextloc("\\EQ* I^1, thought..^1. they were both really nice renditions!/", "obj_dw_church_organpuzzle_slash_Step_0_gml_107_0");
            scr_anyface_next("susie", "K");
            msgnextloc("\\EK* (..^1. does he?)/%", "obj_dw_church_organpuzzle_slash_Step_0_gml_109_0");
            break;
        case 17:
            scr_speaker("ralsei");
            msgsetloc(0, "\\E2* Amazing^1, you played the whole thing^1, Kris!/", "obj_dw_church_organpuzzle_slash_Step_0_gml_113_0");
            scr_anyface_next("susie", 0);
            msgnextloc("\\E0* I dunno^1, that sounded kinda..^1. off./", "obj_dw_church_organpuzzle_slash_Step_0_gml_115_0");
            msgnextloc("\\E6* Isn't there a switcher key or something you gotta use?/", "obj_dw_church_organpuzzle_slash_Step_0_gml_116_0");
            scr_anyface_next("ralsei", 0);
            msgnextloc("\\EJ* Umm^1, it sounded nice without it^1, too!/%", "obj_dw_church_organpuzzle_slash_Step_0_gml_118_0");
            break;
    }
    if (maked)
        d_make(1, undefined, undefined, 1, 1);
}
if (con == 2 && !d_ex())
{
    obj_dw_church_organ.con = 0;
    playedfun = 0;
    con = 0;
}
if (con == 72)
{
    timer++;
    if (timer == 15)
    {
        with (obj_actor)
        {
            visible = false;
            var mark = scr_marker_ext(x, y, sprite_index, image_xscale, image_yscale, image_speed, image_index, image_blend, depth);
            if (name == "kris")
                other.kris = mark;
            if (name == "susie")
                other.susie = mark;
            if (name == "ralsei")
                other.ralsei = mark;
        }
        dog = scr_marker_ext(camerax() + 640, kris.y - 10, spr_dogcar, 2, 2, 0.5, undefined, undefined, kris.depth - 1);
        with (dog)
        {
            scr_limitval_lower(id, "x", other.kris.bbox_right - 10);
            con = 0;
            gravity = 2;
            gravity_direction = 180;
            hspeed = -24;
        }
        susie.con = 0;
        ralsei.con = 0;
        con = 73;
        timer = 0;
    }
}
if (i_ex(dog) && con == 73)
{
    with (dog)
    {
        if (x <= (other.kris.bbox_right - 10) && x > (camerax() - 100))
        {
            with (obj_tutorial_text)
                visible = false;
            if (other.ralsei.con == 0)
            {
                other.ralsei.sprite_index = spr_ralsei_shocked_behind;
                scr_shakeobj(other.ralsei);
                other.ralsei.con = 1;
            }
            if (other.susie.con == 0)
            {
                other.susie.sprite_index = spr_susie_shocked_behind;
                scr_shakeobj(other.susie);
                other.susie.con = 1;
            }
            x = other.kris.bbox_right;
            other.kris.hspeed = -14;
            other.kris.friction = 2;
            other.kris.sprite_index = spr_kris_sword_jump;
            hspeed += 2;
            snd_stop(snd_hurt1);
            snd_play(snd_hurt1);
            other.con = 74;
            other.timer = 0;
            other.blackout = scr_marker_ext(camerax(), cameray(), spr_pxwhite, 640, 480, undefined, undefined, c_black, -4, undefined, undefined, 1);
        }
    }
}
if (con == 74)
{
    timer++;
    if (timer == 1)
    {
    }
    if (timer == 60)
    {
        safe_delete(kris);
        safe_delete(ralsei);
        safe_delete(susie);
        safe_delete(dog);
        with (obj_actor)
            visible = true;
        with (blackout)
            scr_lerpvar("image_alpha", 1, 0, 15);
    }
    if (timer == 75)
    {
        with (obj_tutorial_text)
        {
            instructionLerp = 0;
            visible = true;
        }
        with (obj_dw_church_organ)
            con = 0;
        timer = 0;
        con = 0;
    }
}
