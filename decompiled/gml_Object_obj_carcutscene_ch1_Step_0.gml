if (con > 0)
{
    if (con == 2)
    {
        persistent = true
        __view_set((9 << 0), 0, -4)
        with (k)
        {
            fun = true
            cutscene = true
        }
        with (t)
            sprite_index = spr_toriel_u_ch1
        global.fc = 4
        global.fe = 2
        global.typer = 7
        global.msg[0] = scr_84_get_lang_string_ch1("obj_carcutscene_slash_Step_0_gml_17_0")
        dd = instance_create_ch1(0, 0, obj_dialoguer_ch1)
        dd.side = 0
        con = 3
    }
    if (con == 3 && instance_exists(obj_dialoguer_ch1) == 0)
    {
        mus_play_ch1(global.currentsong[0])
        alarm[5] = 20
        with (t)
        {
            image_speed = 0
            image_index = 0
        }
        scr_pan_ch1(0, 1, 60)
        con = 2.1
        alarm[4] = 40
        with (k)
        {
            sprite_index = spr_krisl_ch1
            image_speed = 0.25
            hspeed = -1
        }
    }
    if (con == 3.1)
    {
        with (t)
            sprite_index = spr_toriel_l_ch1
        with (k)
            scr_halt_ch1()
        with (k)
        {
            sprite_index = spr_krisd_ch1
            vspeed = 1
            image_speed = 0.2
        }
        con = 4
        alarm[4] = 60
    }
    if (con == 5)
    {
        with (t)
            sprite_index = spr_toriel_l_ch1
        with (k)
        {
            scr_halt_ch1()
            sprite_index = spr_krisr_ch1
        }
        con = 8
        alarm[4] = 40
    }
    if (con == 9)
    {
        with (c)
            depth = 6000
        with (t)
        {
            hspeed = -1
            image_speed = 0.2
        }
        with (k)
        {
            sprite_index = spr_krisr_ch1
            hspeed = 1
            vspeed = 0
            image_speed = 0.2
        }
        con = 10
        alarm[4] = 32
    }
    if (con == 11)
    {
        con = 12
        alarm[4] = 30
        ckx = (c.x - k.x)
        cky = (c.y - k.y)
        ctx = (c.x - t.x)
        cty = (c.y - t.y)
        with (t)
            visible = false
        with (k)
            visible = false
    }
    if (con == 13)
    {
        with (c)
        {
            sprite_index = spr_torcar_l_ch1
            hspeed = 1
            image_speed = 0.25
        }
        con = 14
        alarm[4] = 80
    }
    if (con == 15)
    {
        with (c)
            scr_halt_ch1()
        con = 16
        alarm[4] = 30
    }
    if (con == 17)
    {
        with (c)
        {
            hspeed = -1
            image_speed = 0.25
        }
        con = 18
        alarm[4] = 80
    }
    if (con == 19)
    {
        scr_pan_ch1(0, 0.5, 100)
        with (c)
        {
            sprite_index = spr_torcar_d_ch1
            hspeed = 0
            vspeed = 2
        }
        fade = instance_create_ch1(0, 0, obj_fadeout_ch1)
        fade.depth = 4000
        fade.height = 400
        fade.fadespeed = 0.01
        con = 20
        alarm[4] = 190
    }
    if (con == 21)
    {
        fade = instance_create_ch1(0, 0, obj_fadeout_ch1)
        fade.depth = -200
        fade.height = 400
        fade.fadespeed = 0.025
        fade.image_blend = c_white
        con = 22
        alarm[4] = 45
    }
    if (con == 23.1)
    {
        car = scr_marker_ch1(390, 0, spr_torcar_d_ch1)
        with (car)
        {
            scr_depth_ch1()
            image_speed = 0.25
            vspeed = 3
        }
        __view_set((9 << 0), 0, -4)
        with (obj_mainchara_ch1)
        {
            visible = false
            cutscene = true
        }
        __view_set((0 << 0), 0, 180)
        scr_pan_ch1(2.5, 0, 900)
        global.interact = 1
        con = 24
        alarm[4] = (140 / car.vspeed)
        carcon = 1
        with (obj_npc_room_ch1)
            instance_destroy()
        catty = scr_marker_ch1(486, 68, spr_npc_catty_ch1)
        cattydad = scr_marker_ch1(574, 64, spr_npc_cattydad_ch1)
        bratty = scr_marker_ch1(744, 174, spr_npc_bratty_ch1)
        froggit = scr_marker_ch1(800, 114, spr_npc_froggit_ch1)
        with (froggit)
        {
            scr_depth_ch1()
            image_speed = 0.2
        }
        with (catty)
            scr_depth_ch1()
        with (cattydad)
            scr_depth_ch1()
        with (bratty)
            scr_depth_ch1()
    }
    if (con == 23)
    {
        with (obj_writer_ch1)
            instance_destroy()
        fade2 = instance_create_ch1(0, 0, obj_persistentfadein_ch1)
        fade2.image_blend = c_white
        con = 23.1
        room_goto(room_town_north_ch1)
    }
    if (carcon == 1)
    {
        if (car.y >= 100)
        {
            with (catty)
            {
                sprite_index = spr_npc_catty_wave_ch1
                image_speed = 0.2
            }
        }
        if (car.x >= 550)
        {
            with (cattydad)
            {
                sprite_index = spr_npc_cattydad_wave_ch1
                image_speed = 0.2
            }
        }
    }
    if (con == 24)
        global.interact = 1
    if (con == 25)
    {
        with (car)
        {
            sprite_index = spr_torcar_r_ch1
            vspeed = 0
            hspeed = 3
        }
        con = 26
        alarm[4] = (240 / car.hspeed)
    }
    if (con == 27)
    {
        with (car)
        {
            sprite_index = spr_torcar_d_ch1
            hspeed = 0
            vspeed = 3
        }
        carcon = 0
        con = 133
        instance_create_ch1(0, 0, obj_fadeout_ch1)
        alarm[4] = 30
    }
    if (con == 130)
    {
        car = scr_marker_ch1(790, -60, spr_torcar_d_ch1)
        with (car)
        {
            scr_depth_ch1()
            image_speed = 0.25
            vspeed = 3
        }
        __view_set((9 << 0), 0, -4)
        with (obj_mainchara_ch1)
        {
            visible = false
            cutscene = true
        }
        __view_set((0 << 0), 0, 670)
        global.interact = 1
        con = 131
        alarm[4] = (200 / car.vspeed)
    }
    if (con == 29)
    {
        instance_create_ch1(0, 0, obj_persistentfadein_ch1)
        room_goto(room_town_mid_ch1)
        con = 130
    }
    if (con == 131)
        global.interact = 1
    if (con == 132)
    {
        instance_create_ch1(0, 0, obj_fadeout_ch1)
        alarm[4] = 30
        con = 133
    }
    if (con == 140)
    {
        car = scr_marker_ch1(810, 0, spr_torcar_d_ch1)
        with (car)
        {
            scr_depth_ch1()
            image_speed = 0.25
            vspeed = 3
        }
        with (obj_npc_room_ch1)
            instance_destroy()
        with (obj_npc_facing_ch1)
            instance_destroy()
        __view_set((9 << 0), 0, -4)
        with (obj_mainchara_ch1)
        {
            visible = false
            cutscene = true
        }
        __view_set((0 << 0), 0, 660)
        scr_pan_ch1(2, 0, 300)
        global.interact = 1
        con = 141
        alarm[4] = (140 / car.vspeed)
        carcon = 2
        qc = scr_marker_ch1(764, 85, spr_npc_qc_stand_ch1)
        undyne = scr_marker_ch1(905, 80, spr_undyne_dt_ch1)
        bear = scr_marker_ch1(710, 82, spr_npc_politicsbear_ch1)
        with (bear)
            scr_depth_ch1()
        with (qc)
            scr_depth_ch1()
        with (undyne)
            scr_depth_ch1()
    }
    if (con == 134)
    {
        instance_create_ch1(0, 0, obj_persistentfadein_ch1)
        room_goto(room_town_south_ch1)
        con = 140
    }
    if (carcon == 2)
    {
        if (car.y >= 100)
        {
            with (qc)
            {
                sprite_index = spr_npc_qc_wave_ch1
                image_speed = 0.2
            }
            with (undyne)
            {
                sprite_index = spr_undyne_d_wave_ch1
                image_speed = 0.2
            }
        }
        if (car.x >= 1000)
        {
        }
    }
    if (con == 141)
        global.interact = 1
    if (con == 142)
    {
        with (car)
        {
            vspeed = 0
            hspeed = 3
            sprite_index = spr_torcar_r_ch1
        }
        con = 143
        alarm[4] = (260 / car.hspeed)
    }
    if (con == 144)
    {
        carcon = 0
        instance_create_ch1(0, 0, obj_fadeout_ch1)
        alarm[4] = 30
        con = 145
    }
    if (con == 161)
    {
        car = scr_marker_ch1(0, 220, spr_torcar_r_ch1)
        with (car)
        {
            scr_depth_ch1()
            image_speed = 0.25
            hspeed = 2
        }
        __view_set((9 << 0), 0, -4)
        with (obj_mainchara_ch1)
        {
            visible = false
            cutscene = true
        }
        __view_set((0 << 0), 0, 0)
        __view_set((1 << 0), 0, (room_height - __view_get((3 << 0), 0)))
        global.interact = 1
        con = 162
        scr_pan_ch1(1, 0, 100)
        alarm[4] = (240 / car.hspeed)
    }
    if (con == 146)
    {
        instance_create_ch1(0, 0, obj_persistentfadein_ch1)
        room_goto(room_town_school_ch1)
        con = 161
    }
    if (con == 162)
        global.interact = 1
    if (con == 163)
    {
        with (car)
        {
            vspeed = -2
            hspeed = 0
            sprite_index = spr_torcar_u_ch1
        }
        con = 164
        alarm[4] = 30
    }
    if (con == 165)
    {
        with (car)
            scr_halt_ch1()
        con = 36
        alarm[4] = 30
    }
    if (con == 37)
    {
        v = 0
        with (car)
        {
            speed = 0
            image_speed = 0
        }
        con = 38
        alarm[4] = 15
    }
    if (con == 39)
    {
        scr_pan_ch1(1, -0.334, 100)
        with (car)
            depth = 500
        k = scr_marker_ch1(((car.x - ctx) + 10), (car.y - cty), spr_krisr_ch1)
        t = scr_marker_ch1((car.x - ckx), (car.y - cky), spr_toriel_l_ch1)
        with (k)
        {
            depth = 50000
            visible = true
            image_speed = 0.2
            sprite_index = spr_krisr_ch1
            hspeed = 1
        }
        with (t)
        {
            image_speed = 0.2
            depth = 50000
            visible = true
            sprite_index = spr_toriel_l_ch1
            hspeed = -1
        }
        con = 40
        alarm[4] = 30
    }
    if (con == 41)
    {
        with (car)
            depth = 600000
        with (k)
        {
            speed = 0
            sprite_index = spr_krisd_ch1
            image_index = 0
            image_speed = 0
        }
        with (t)
        {
            vspeed = 2
            hspeed = 0
            depth = 10000
            sprite_index = spr_toriel_d_ch1
            image_speed = 0.25
        }
        con = 42
        alarm[4] = 15
    }
    if (con == 43)
    {
        with (t)
        {
            sprite_index = spr_toriel_r_ch1
            vspeed = 0
            hspeed = 2
        }
        con = 44
        alarm[4] = 51
    }
    if (con == 45)
    {
        with (k)
            sprite_index = spr_krisr_ch1
        with (t)
        {
            hspeed = 0
            vspeed = -2
            sprite_index = spr_toriel_u_ch1
        }
        con = 46
        alarm[4] = 22
    }
    if (con == 47)
    {
        with (t)
        {
            speed = 0
            sprite_index = spr_toriel_l_ch1
            image_speed = 0
            image_index = 0
        }
        con = 48
        alarm[4] = 30
    }
    if (con == 49)
    {
        with (k)
            visible = false
        with (t)
            sprite_index = spr_toriel_handhold_r_ch1
        con = 50
        alarm[4] = 30
    }
    if (con == 51)
    {
        with (t)
        {
            hspeed = 1
            image_speed = 0.1
        }
        con = 52
        alarm[4] = 44
    }
    if (con == 53)
    {
        scr_pan_ch1(0, -0.5, 999)
        with (t)
        {
            vspeed = -0.25
            hspeed = 0
            sprite_index = spr_toriel_handhold_u_ch1
        }
        fade = instance_create_ch1(0, 0, obj_fadeout_ch1)
        with (fade)
            fadespeed = 0.03
        con = 56
        persistent = false
        alarm[4] = 40
    }
    if (con == 55)
        alarm[4] = 40
    if (con == 56)
        fade.y = 0
    if (con == 57)
    {
        pf = instance_create_ch1(0, 0, obj_persistentfadein_ch1)
        with (pf)
            image_alpha = 1.2
        room_goto(room_schoollobby_ch1)
    }
}
