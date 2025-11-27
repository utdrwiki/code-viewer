if (doorchange)
{
    with (obj_doorAny)
    {
        if (doorRoom == room_dw_churchb_ripple1)
        {
            doorRoom = room_dw_churchb_ripplepost;
            other.doorchange = false;
        }
    }
}
if (con == 10)
{
    with (obj_caterpillarchara)
    {
        rsprite = spr_susie_walk_right_dw_unhappy;
        dsprite = spr_susie_walk_down_dw_unhappy;
        lsprite = spr_susie_walk_left_dw_unhappy;
    }
    con = 11;
    global.interact = 1;
    cutscene_master = scr_cutscene_make();
    c_wait(1);
    scr_maincharacters_actors();
    c_pannable(1);
    var campos = scr_heromarker(undefined, "cam1");
    c_pan(campos[0], campos[1], 1);
    var krpos1 = scr_heromarker("kris", "cut1");
    var supos1 = scr_heromarker("susie", "cut1");
    var krpos2 = scr_heromarker("kris", "cut2");
    var supos2 = scr_heromarker("susie", "cut2");
    var walkspeed = 2;
    var walkdistspeed = max(round(point_distance(krpos1[0], krpos1[1], krpos2[0], krpos2[1]) / walkspeed), 1);
    c_sel(kr);
    c_setxy(krpos1[0], krpos1[1]);
    c_sel(su);
    c_setxy(supos1[0], supos1[1]);
    c_sel(su);
    c_facing("susieunhappy");
    c_wait(2);
    c_sel(kr);
    c_walkdirect(krpos2[0], krpos2[1], walkdistspeed);
    c_sel(su);
    c_walkdirect(supos2[0], supos2[1], walkdistspeed);
    c_wait(walkdistspeed);
    c_wait(15);
    c_sel(su);
    c_wait(30);
    c_sel(kr);
    c_facing("r");
    c_speaker("susie");
    c_msgsetloc(0, "\\E0* Hey^1, is it me^1, or does something seem..^1. off?/", "obj_dw_churchb_staircaseintro_slash_Step_0_gml_76_0");
    c_msgnextloc("\\E1* I guess it's like Ralsei said.../", "obj_dw_churchb_staircaseintro_slash_Step_0_gml_77_0");
    c_msgnextloc("\\E0* Every Dark World is different./", "obj_dw_churchb_staircaseintro_slash_Step_0_gml_78_0");
    c_msgnextloc("\\EL* Let's go./%", "obj_dw_churchb_staircaseintro_slash_Step_0_gml_79_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_sprite(spr_susie_walk_right_dw_unhappy);
    c_wait_box(2);
    c_sprite(spr_susie_look_down_right_dw);
    c_wait_box(3);
    c_sprite(spr_susie_walk_left_dw_unhappy);
    c_wait_talk();
    c_panobj(kr_actor, 20);
    c_wait(20);
    c_sel(kr);
    c_facing("d");
    c_wait(1);
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 11 && !i_ex(obj_cutscene_master))
{
    con = 12;
    global.interact = 0;
    scr_tempsave();
}
for (var i = 0; i < array_length(glass); i++)
{
    with (glass[i])
    {
        var targalpha = 0.2;
        if (place_meeting(x, y, obj_mainchara) || place_meeting(x, y, obj_caterpillarchara) || place_meeting(x, y, obj_actor))
            targalpha = 0.8;
        image_alpha = lerp(image_alpha, targalpha, 0.125);
    }
}
if (con == 40)
{
    if (scr_trigcheck("rcut1"))
    {
        global.interact = 1;
        con = 41;
    }
}
if (con == 41)
{
    con++;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    with (obj_mainchara)
        setxy(999, 999);
    with (obj_caterpillarchara)
    {
        follow = false;
        setxy(999, 999);
    }
    var krpos = scr_heromarker("kris", "krstop");
    var krpos2 = scr_heromarker("kris", "krleave");
    var supos = scr_heromarker("susie", "sustop");
    var rapos = scr_heromarker("ralsei", "rastop");
    c_sel(kr);
    var krwalkspeed = max(round(abs(krpos[0] - kr_actor.x) / 4), 1);
    c_walkdirect(krpos[0], kr_actor.y, krwalkspeed);
    c_sel(su);
    c_walkdirect(supos[0], kr_actor.y - 16, krwalkspeed);
    c_sel(ra);
    c_walkdirect(rapos[0], kr_actor.y - 12, krwalkspeed);
    c_wait(krwalkspeed);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EQ* Well^1, this is it.../", "obj_dw_churchb_staircaseintro_slash_Step_0_gml_162_0");
    c_facenext("susie", "L");
    c_msgnextloc("\\EL* See ya in a sec./%", "obj_dw_churchb_staircaseintro_slash_Step_0_gml_164_0");
    c_talk();
    c_wait_box(2);
    c_sel(kr);
    c_facing("l");
    c_sel(su);
    c_facing("l");
    c_sel(ra);
    c_sprite(spr_ralsei_smile_up_right);
    c_wait_talk();
    var walk2 = max(round(abs(krpos[1] - krpos2[1]) / 2), 1);
    c_sel(kr);
    c_walkdirect(krpos2[0], krpos2[1], walk2);
    var supos2 = scr_heromarker("susie", "sucontinue");
    var supos3 = scr_heromarker("susie", "suleave");
    var suwait2 = scr_returnwait(supos[0], su_actor.y, supos2[0], su_actor.y, 2);
    var suwait3 = scr_returnwait(supos[0], su_actor.y, supos3[0], supos3[1], 2);
    c_sel(su);
    c_walkdirect(supos2[0], su_actor.y, suwait2);
    c_delaywalkdirect(suwait2 + 1, supos3[0], supos3[1], suwait3);
    c_customfunc(function()
    {
        mus_volume(global.currentsong[1], 0, 45);
    });
    c_wait(max(round(walk2 / 2), 1));
    c_fadeout(30);
    c_wait(45);
    c_customfunc(function()
    {
        snd_free_all();
    });
    c_var_instance(id, "con", 50);
}
if (con == 50)
    room_goto(room_dw_churchb_fountain);
