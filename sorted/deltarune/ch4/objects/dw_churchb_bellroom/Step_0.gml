if (!init)
{
    with (obj_genmarker)
    {
        if (extflag == "prop1")
        {
            var offset = [];
            offset[0] = [150, 90];
            offset[1] = [150, 90];
            offset[2] = [150, 90];
            var ind = 0;
            if (image_angle == 90)
                ind = 1;
            if (image_angle == 180)
                ind = 2;
            var prophecy = instance_create(x + offset[ind][0], y + offset[ind][1], obj_dw_church_prophecy);
            prophecy.angle = image_angle;
            prophecy.extflag = "heroes2";
            if (image_angle == 180)
                prophecy.extflag = "love";
            prophecy.depth = layer_get_depth("BELL_FLOOR_ALT_FRONTROW") + 1;
            prophecy.fade_edges = true;
        }
    }
    var supos = scr_heromarker("susie", "supos1");
    susie = scr_marker_ext(supos[0], supos[1], spr_susie_walk_up_dw, 2, 2, 0, undefined, undefined, undefined, 1);
    susie.name = "susie";
    with (roomglow)
        create_highlight(other.susie);
    with (susie)
    {
        pos1 = scr_heromarker("susie", "supos1");
        pos2 = scr_heromarker("susie", "supos2");
        pos3 = scr_heromarker("susie", "supos3");
        con = 0;
        timer = 0;
        switch (global.flag[1572])
        {
            case 1:
                setxy(pos2[0], pos2[1]);
                con = 1;
                break;
            case 2:
                setxy(pos3[0], pos3[1]);
                con = 2;
                break;
        }
    }
    init = 1;
}
with (susie)
{
    var walkspeed = 10;
    var trigspace = 120;
    if (con == 0)
    {
        if (obj_mainchara.x < (bbox_right + trigspace))
        {
            con = -1;
            var movewait = scr_returnwait_instance(id, pos2[2], walkspeed);
            scr_lerpvar("x", x, pos2[0], movewait);
            scr_lerpvar("y", y, pos2[1], movewait);
            sprite_index = spr_susie_walk_left_dw;
            image_speed = 0.25;
            scr_delay_var("con", 1, movewait + 1);
            scr_delay_var("image_speed", 0, movewait + 1);
            scr_delay_var("image_index", 0, movewait + 1);
            scr_delay_var("sprite_index", 430, movewait + 1);
            global.flag[1572] = 1;
        }
    }
    if (con == 1)
    {
        if (obj_mainchara.x < (bbox_right + trigspace))
        {
            con = -1;
            var movewait = scr_returnwait_instance(id, pos3[2], walkspeed);
            scr_lerpvar("x", x, pos3[0], movewait);
            scr_lerpvar("y", y, pos3[1], movewait);
            sprite_index = spr_susie_walk_left_dw;
            image_speed = 0.25;
            scr_delay_var("con", 2, movewait + 1);
            scr_delay_var("image_speed", 0, movewait + 1);
            scr_delay_var("image_index", 0, movewait + 1);
            scr_delay_var("sprite_index", 430, movewait + 1);
            global.flag[1572] = 2;
        }
    }
}
if (econ == 0)
{
    if (makeenemy)
    {
        var spritesArray = layer_get_all_elements("BELL_ENEMYBELL");
        for (var i = 0; i < array_length(spritesArray); i++)
        {
            if (layer_sprite_get_sprite(spritesArray[i]) == 4549)
                chaseloc = scr_assetgetinfo(spritesArray[i]);
            if (layer_sprite_get_sprite(spritesArray[i]) == 5175)
            {
                fakebellbit = scr_marker_fromasset(spritesArray[i], 899999);
                fakebellbit.image_alpha = 1;
                fakebellbit.image_blend = #679CBC;
                if (!i_ex(blacklay))
                {
                    blacklay = scr_marker_fromasset(spritesArray[i], 899999);
                    blacklay.image_alpha = 1;
                    blacklay.image_blend = c_black;
                    blacklay.depth = layer_get_depth("BELL_FLOOR_ALT_FRONTROW") - 1;
                }
            }
            if (layer_sprite_get_sprite(spritesArray[i]) == 4860)
            {
                if (!instance_exists(fakebelloverlay))
                {
                    fakebelloverlay = scr_marker_fromasset(spritesArray[i], 899990);
                    fakebelloverlay.image_alpha = 1;
                    fakebelloverlay.image_blend = c_white;
                }
            }
        }
        chaseenemy = instance_create(chaseloc[2], chaseloc[3], obj_dw_churchb_bellchaser);
        scr_size(2, chaseloc[4], chaseenemy);
        chaseenemy.depth = fakebelloverlay.depth + 1;
        chaseenemy.con = 0;
        chaseenemy.image_blend = c_black;
        chaseenemy.image_alpha = 0;
        chaseenemy.encounterno = encounterno;
        chaseenemy.encounterflag = encounterflag;
        chaseenemy.sprite_index = spr_bell_enemy;
        makeenemy = false;
        econ = 1;
    }
}
if (econ == 1)
{
    if (scr_trigcheck("enem"))
    {
        econ = 2;
        etimer = 0;
    }
}
if (econ == 2)
{
    etimer++;
    if (etimer == 1)
    {
        var lifetime = 8;
        scr_lerp_imageblend(fakebellbit, image_blend, c_black, lifetime);
        scr_doom(fakebellbit, lifetime);
    }
    if (etimer == 8)
    {
        with (chaseenemy)
        {
            scr_lerpvar("image_alpha", 0, 1, 3);
            scr_lerpvar("image_yscale", image_yscale, 2, 3);
            image_blend = c_white;
            var movetime = 24;
            var delaytime = 8;
            if (global.flag[encounterflag] == 0)
            {
                movetime = 16;
                delaytime = 6;
            }
            snd_play(snd_churchbell_short);
            scr_lerpvar("y", y, 200, movetime, -1, "out");
            scr_delay_var("con", 1, movetime + delaytime);
        }
        econ = 3;
        etimer = 0;
    }
}
if (econ == 3)
{
    if (i_ex(chaseenemy))
    {
        if (chaseenemy.donebattle == false)
        {
            if (scr_trigcheck("enemygoaway"))
            {
                with (chaseenemy)
                {
                    with (scr_afterimage())
                        gravity = -0.5;
                    instance_destroy();
                }
                econ = 0;
                makeenemy = true;
            }
        }
    }
    else
    {
        econ = 99;
    }
}
var propactive = scr_trigcheck("propact");
roomglow.active = propactive;
with (obj_dw_church_prophecy)
    active = propactive;
scr_populatechars();
if (!instance_exists(obj_cutscene_master))
{
    if (stepped == false)
    {
        if (kris.image_index == 1)
            stepped = true;
        if (kris.image_index == 3)
            stepped = true;
    }
    if (stepped)
    {
        if (kris.image_index == 2 || kris.image_index == 0)
            stepped = false;
    }
}
else
{
    var kractor = -4;
    with (obj_actor)
    {
        if (name == "kris")
            kractor = id;
    }
    with (kractor)
        debug_message("image_index=" + string(image_index));
    if (i_ex(kractor))
    {
        if (stepped == false)
        {
            if (round(kractor.image_index) == 1)
            {
                stepped = true;
                snd_play(snd_churchbell_short, 0.25);
            }
            if (round(kractor.image_index) == 3)
            {
                stepped = true;
                snd_play(snd_churchbell_short, 0.25, 0.9);
            }
        }
        if (stepped)
        {
            if (round(kractor.image_index) == 2 || round(kractor.image_index) == 0)
                stepped = false;
        }
    }
}
