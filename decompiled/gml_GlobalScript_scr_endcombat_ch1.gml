scr_endcombat_ch1 = function() //gml_Script_scr_endcombat_ch1
{
    global.fighting = false
    if (global.specialbattle == 0 || global.specialbattle == 2 || global.specialbattle == 3)
    {
        if (global.specialbattle == 2)
        {
            with (obj_mainchara_ch1)
            {
                cutscene = true
                x = global.charinstance[0].x
                y = global.charinstance[0].y
            }
            with (global.cinstance[0])
            {
                x = global.charinstance[1].x
                y = global.charinstance[1].y
            }
            with (global.cinstance[1])
            {
                x = global.charinstance[2].x
                y = global.charinstance[2].y
            }
            with (obj_caterpillarchara_ch1)
                scr_caterpillar_interpolate_ch1()
            scr_pan_to_obj_ch1(obj_mainchara_ch1, 30)
            with (obj_mainchara_ch1)
                visible = true
            with (obj_caterpillarchara_ch1)
                visible = true
        }
        instance_create_ch1(0, 0, obj_endbattle_ch1)
        with (obj_monsterparent_ch1)
            instance_destroy()
        with (obj_bulletparent_ch1)
            instance_destroy()
        with (obj_heroparent_ch1)
            instance_destroy()
        instance_destroy()
    }
    return;
}

