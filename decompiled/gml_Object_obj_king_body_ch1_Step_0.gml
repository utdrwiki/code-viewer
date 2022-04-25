if (keyboard_check(vk_return) && active == true && scr_debug_ch1())
{
    attackno += 1
    active = false
    if (attackno <= 11)
        attack = attackno
    else
        attack = choose(7, 8, 9, 10, 11)
    if (attack == 1)
    {
        box = instance_create_ch1((xx + 340), (yy + 170), obj_growtangle_ch1)
        scr_moveheart_ch1()
        dd = instance_create_ch1(0, 0, obj_dbulletcontroller_ch1)
        dd.type = 21
        timeruse = true
        faketimermax = 190
        faketimer = 0
    }
    if (attack == 2)
    {
        visible = false
        chainking = instance_create_ch1(x, y, obj_chainking_ch1)
        chainking.type = 1
        chainking.subtype = 0
        box = instance_create_ch1((xx + 200), (yy + 175), obj_nonsolid_growtangle_ch1)
        box.sprite_index = spr_battlebg_wavechain_ch1
        scr_moveheart_ch1()
    }
    if (attack == 3)
    {
        box = instance_create_ch1((xx + 340), (yy + 170), obj_growtangle_ch1)
        scr_moveheart_ch1()
        dd = instance_create_ch1(0, 0, obj_dbulletcontroller_ch1)
        dd.type = 34
        timeruse = true
        faketimermax = 200
        faketimer = 0
    }
    if (attack == 4)
    {
        box = instance_create_ch1((xx + 310), (yy + 165), obj_growtangle_ch1)
        box.sprite_index = spr_battlebg_2_ch1
        scr_moveheart_ch1()
        damagebox = instance_create_ch1(box.x, box.y, obj_growtangle_bouncer_ch1)
        damagebox.type = 0
    }
    if (attack == 5)
    {
        visible = false
        chainking = instance_create_ch1(x, y, obj_chainking_ch1)
        chainking.type = 1
        chainking.subtype = 1
        box = instance_create_ch1((xx + 200), (yy + 175), obj_nonsolid_growtangle_ch1)
        box.sprite_index = spr_battlebg_wavechain_ch1
        scr_moveheart_ch1()
    }
    if (attack == 6)
    {
        visible = false
        timeruse = false
        chainking = instance_create_ch1(x, y, obj_chainking_ch1)
        chainking.type = 2
        chainking.subtype = 2
        box = instance_create_ch1((xx + 205), (yy + 170), obj_nonsolid_growtangle_ch1)
        box.sprite_index = spr_battlebg_1_ch1
        scr_moveheart_ch1()
    }
    if (attack == 7)
    {
        box = instance_create_ch1((xx + 340), (yy + 170), obj_growtangle_ch1)
        scr_moveheart_ch1()
        dd = instance_create_ch1(0, 0, obj_dbulletcontroller_ch1)
        dd.type = 35
        timeruse = true
        faketimermax = 220
        faketimer = 0
    }
    if (attack == 8)
    {
        box = instance_create_ch1((xx + 310), (yy + 165), obj_growtangle_ch1)
        box.sprite_index = spr_battlebg_2_ch1
        scr_moveheart_ch1()
        damagebox = instance_create_ch1(box.x, box.y, obj_growtangle_bouncer_ch1)
        damagebox.type = 3
    }
    if (attack == 9)
    {
        box = instance_create_ch1((xx + 340), (yy + 170), obj_growtangle_ch1)
        scr_moveheart_ch1()
        dd = instance_create_ch1(0, 0, obj_dbulletcontroller_ch1)
        dd.type = 23
        timeruse = true
        faketimermax = 190
        faketimer = 0
    }
    if (attack == 10)
    {
        visible = false
        chainking = instance_create_ch1(x, y, obj_chainking_ch1)
        chainking.type = 1
        chainking.subtype = 2
        box = instance_create_ch1((xx + 200), (yy + 175), obj_nonsolid_growtangle_ch1)
        box.sprite_index = spr_battlebg_wavechain_ch1
        scr_moveheart_ch1()
    }
    if (attack == 11)
    {
        visible = false
        timeruse = false
        chainking = instance_create_ch1(x, y, obj_chainking_ch1)
        chainking.type = 2
        chainking.subtype = 1
        box = instance_create_ch1((xx + 205), (yy + 170), obj_nonsolid_growtangle_ch1)
        box.sprite_index = spr_battlebg_1_ch1
        scr_moveheart_ch1()
    }
}
if (timeruse == true)
{
    faketimer += 1
    if (faketimer >= faketimermax)
    {
        with (obj_bulletparent_ch1)
            instance_destroy()
        with (obj_dbulletcontroller_ch1)
            instance_destroy()
        with (obj_growtangle_ch1)
            growcon = 3
        with (obj_heart_ch1)
            instance_destroy()
        active = true
        timeruse = false
        faketimer = 0
    }
}
if (keyboard_check_pressed(vk_space) && scr_debug_ch1())
    attackno += 1
if (keyboard_check_pressed(vk_shift) && scr_debug_ch1())
    attackno -= 1
