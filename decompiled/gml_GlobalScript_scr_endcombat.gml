scr_endcombat = function() //gml_Script_scr_endcombat
{
    global.fighting = false
    if (global.specialbattle == 0 || global.specialbattle == 2 || global.specialbattle == 3)
    {
        if (global.specialbattle == 2)
        {
            with (obj_mainchara)
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
            with (obj_caterpillarchara)
                scr_caterpillar_interpolate()
            scr_pan_to_obj(obj_mainchara, 30)
            with (obj_mainchara)
                visible = true
            with (obj_caterpillarchara)
                visible = true
        }
        instance_create(0, 0, obj_endbattle)
        with (obj_monsterparent)
            instance_destroy()
        with (obj_bulletparent)
            instance_destroy()
        with (obj_heroparent)
            instance_destroy()
        global.charinstance[0] = obj_mainchara
        global.charinstance[1] = global.cinstance[0]
        global.charinstance[2] = global.cinstance[1]
        instance_destroy()
    }
    return;
}

