scr_populatechars();
if (!init)
{
    var pos = scr_heromarker(undefined, "prop3");
    prophecy3 = instance_create(scr_even(pos[0] + 150), scr_even(pos[1] + 90), obj_dw_church_prophecy);
    prophecy3.extflag = "angel";
    init = 1;
}
propact = scr_trigcheck("propact");
obj_dw_church_prophecy.active = propact;
roomglow.active = propact;
if (cutscene == 0)
{
    if (scr_trigcheck("cut"))
    {
        global.interact = 1;
        cutscene = 1;
        var hiimgalp = 0;
        var stren = 0;
        with (obj_sprhighlight)
        {
            if (target == 1049)
            {
                stren = strength;
                hiimgalp = image_alpha;
            }
        }
        scr_cutscene_make();
        scr_maincharacters_actors();
        with (roomglow)
        {
            var actors = [];
            with (obj_actor)
                array_push(actors, id);
            for (var i = 0; i < array_length(actors); i++)
                create_highlight(actors[i]);
        }
        var krpos = scr_heromarker("kris", "cut");
        var supos = scr_heromarker("susie", "cut");
        var rapos = scr_heromarker("ralsei", "cut");
        var campos = scr_genmarker("campos");
        var walkspeed = 4;
        var krdist = scr_returnwait_instance(kr_actor, krpos[2], walkspeed);
        var radist = scr_returnwait_instance(ra_actor, rapos[2], walkspeed);
        var sudist = scr_returnwait_instance(su_actor, supos[2], walkspeed);
        var waittime = max(krdist, radist, sudist);
        c_pannable(1);
        c_pan(campos.x, campos.y, 12);
        c_sel(kr);
        c_walkdirect(krpos[0], krpos[1], krdist);
        c_delayfacing(krdist + 1, "u");
        c_sel(su);
        c_walkdirect(supos[0], supos[1], sudist);
        c_delayfacing(sudist + 1, "u");
        c_sel(ra);
        c_walkdirect(rapos[0], rapos[1], radist);
        c_delayfacing(radist + 1, "u");
        c_wait(waittime + 1);
        c_wait(15);
        c_msgside("bottom");
        c_msgruncheck(true);
        c_speaker("susie");
        c_msgsetloc(0, "\\EZ* Hey^1, below the words^1, that picture.../", "obj_dw_churchc_angelprophecy_slash_Step_0_gml_84_0");
        c_msgnextloc("\\Eh* ..^1. What the hell..^1. is that supposed to be...?/", "obj_dw_churchc_angelprophecy_slash_Step_0_gml_85_0");
        c_facenext("ralsei", "Q");
        c_msgnextloc("\\EQ* That..^1. that's the Angel^1, Susie./", "obj_dw_churchc_angelprophecy_slash_Step_0_gml_87_0");
        c_msgnextloc("\\EQ* What..^1. to my understanding^1, it actually looks like./", "obj_dw_churchc_angelprophecy_slash_Step_0_gml_88_0");
        c_facenext("susie", "Z");
        c_msgnextloc("\\EZ* .../", "obj_dw_churchc_angelprophecy_slash_Step_0_gml_90_0");
        c_msgnextloc("\\Eh* I..^1. I dunno about that^1, man./%", "obj_dw_churchc_angelprophecy_slash_Step_0_gml_91_0");
        c_talk();
        c_wait_box(1);
        c_sel(su);
        c_sprite(spr_susie_up_look_left);
        c_wait_box(6);
        c_sel(su);
        c_facing("u");
        c_wait_talk();
        c_wait(1);
        c_sel(kr);
        c_facing("d");
        c_wait(1);
        c_pannable(0);
        c_actortokris();
        c_actortocaterpillar();
        c_terminatekillactors();
    }
}
if (cutscene == 1)
{
    if (!instance_exists(obj_cutscene_master))
    {
        makenpcarea = true;
        global.flag[1596] = 1;
        cutscene = 2;
        scr_caterpillar_interpolate("all");
        global.interact = 0;
    }
}
if (makenpcarea)
{
    if (!i_ex(npcarea))
    {
        var spritesArray = layer_get_all_elements("DEBUG_ASSETS");
        for (var i = 0; i < array_length(spritesArray); i++)
        {
            if (layer_sprite_get_sprite(spritesArray[i]) == 1779)
                npcarea = scr_makenpc_fromasset(spritesArray[i]);
        }
        npcarea.marker.visible = false;
    }
    makenpcarea = false;
}
with (npcarea)
{
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a prophecy...)/", "obj_dw_churchc_angelprophecy_slash_Step_0_gml_150_0");
        msgnextloc("* (..^1. Looking at it made you feel strange. You did not investigate further.)/%", "obj_dw_churchc_angelprophecy_slash_Step_0_gml_151_0");
        d_make(1);
        myinteract = 999;
    }
    if (myinteract == 999 && !d_ex())
    {
        myinteract = 0;
        global.interact = 0;
    }
}
