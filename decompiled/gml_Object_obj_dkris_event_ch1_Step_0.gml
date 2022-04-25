if (con == 0)
{
    con = 1
    alarm[4] = 90
}
if (con == 2)
{
    image_speed = 0.25
    con = 3
    alarm[4] = 12
}
if (con == 4)
{
    image_speed = 0
    image_index = 0
    con = 5
    alarm[4] = 70
}
if (con == 6)
{
    image_speed = 0.334
    con = 7
    alarm[4] = 20
}
if (con == 8)
{
    image_index = 0
    image_speed = 0
    con = 9
    alarm[4] = 70
    remx = x
    remy = y
    shaketimer = 0
}
if (con == 10)
{
    con = 11
    image_speed = 0.5
    alarm[4] = 60
}
if (con == 11)
{
    shaketimer += 0.05
    x = ((remx + random((shaketimer / 2))) - random((shaketimer / 2)))
    y = ((remy + random((shaketimer / 4))) - random((shaketimer / 4)))
}
if (con == 12)
{
    x = (remx + 10)
    y = (remy + 20)
    underbed = scr_marker_ch1(remx, remy, spr_dkris_bed2_ch1)
    underbed.depth = 100000
    sprite_index = spr_dkris_ground_ch1
    image_index = 2
    snd_play_ch1(snd_heavyswing_ch1)
    image_speed = 0
    hspeed = -6
    friction = 0.3
    con = 13
    alarm[4] = 7
}
if (con == 14)
{
    gravity = 1
    con = 15
    alarm[4] = 5
}
if (con == 16)
{
    gravity = 0
    friction = 0.4
    vspeed = 0
    image_index = 0
    snd_play_ch1(snd_impact_ch1)
    instance_create_ch1(0, 0, obj_shake_ch1)
    con = 17
    alarm[4] = 90
}
if (con == 18)
{
    sprite_index = spr_dkris_ground_ch1
    image_index = 1
    x = 180
    y = 119
    con = 19
    alarm[4] = 90
    scr_minishakeobj_ch1()
}
if (con == 20)
{
    snd_play_ch1(snd_noise_ch1)
    sprite_index = spr_dkris_dl_ch1
    x += 5
    y -= 12
    scr_minishakeobj_ch1()
    image_index = 0
    con = 21
    alarm[4] = 60
}
if (con == 22)
{
    con = 23
    goalx = 153
    goaly = 125
    stepcycle = 0
    stepmax = 8
    stepx = ((goalx - x) / stepmax)
    stepy = ((goaly - y) / stepmax)
    alarm[4] = 50
}
if (con == 24)
{
    x += stepx
    y += stepy
    snd_play_ch1(snd_step1_ch1)
    image_index = 1
    scr_minishakeobj_ch1()
    con = 25
    alarm[4] = 15
}
if (con == 26)
{
    image_index = 0
    stepcycle += 1
    if (stepcycle >= stepmax)
    {
        con = 27
        alarm[4] = 30
    }
    else
    {
        con = 23
        alarm[4] = 20
    }
}
if (con == 28)
{
    x = 158
    y = 125
    scr_minishakeobj_ch1()
    sprite_index = spr_dkris_dr_ch1
    snd_play_ch1(snd_step1_ch1)
    con = 29
    alarm[4] = 60
}
if (con == 30)
{
    sprite_index = spr_dkris_readyhand_ch1
    image_index = 0
    image_speed = 0.1
    con = 31
    alarm[4] = 150
}
if (con == 32)
{
    image_speed = 0
    con = 33
    alarm[4] = 30
}
if (con == 34)
{
    flashobj = 0
    image_index = 0
    sprite_index = spr_dkris_grabheart_ch1
    image_speed = 0.25
    animtimer = 0
    htimer = 0
    remx = x
    remy = y
    con = 33.1
    alarm[4] = 20
}
if (con == 33.1)
{
    animtimer += 1
    if (animtimer == 13)
        snd_play_ch1(snd_heavyswing_ch1)
    if (animtimer == 14)
    {
        snd_play_ch1(snd_grab_ch1)
        snd_play_ch1(snd_hurt1_ch1)
        instance_create_ch1(0, 0, obj_shake_ch1)
        scr_minishakeobj_ch1()
    }
}
if (con == 34.1)
{
    image_speed = 0.4
    sprite_index = spr_dkris_grabscream_ch1
    scr_minishakeobj_ch1()
    alarm[4] = 60
    con = 35
    shakeamt = 0
}
if (con == 35)
{
    htimer += 1
    if (htimer == 1)
        snd_play_ch1(snd_hurt1_ch1)
    if (htimer >= 8)
        htimer = 0
    x = ((remx + random(0.8)) - random(0.8))
    y = ((remy + random(0.8)) - random(0.8))
}
if (con == 36)
{
    x = remx
    y = remy
    gnoise = false
    image_index = 0
    sprite_index = spr_dkris_pullheart_ch1
    image_speed = 0.334
    con = 37
    alarm[4] = 20
}
if (con == 37)
{
    if (image_index >= 2 && gnoise == false)
    {
        burst = instance_create_ch1((x + 2), (y + 10), obj_heartburst_ch1)
        gnoise = true
        snd_play_ch1(snd_grab_ch1)
        snd_play_ch1(snd_break2_ch1)
    }
}
if (con == 38)
{
    image_speed = 0
    con = 37.1
    alarm[4] = 30
}
if (con == 38.1)
{
    sprite_index = spr_dkris_glowheart_ch1
    con = 37.2
    image_index = 0
    image_speed = 0.2
    snd_play_ch1(snd_break2_ch1)
    alarm[4] = 30
}
if (con == 38.2)
{
    image_speed = 0
    con = 39
    alarm[4] = 70
}
if (con == 40)
{
    x = 158
    y = 125
    sprite_index = spr_dkris_heartwalk_ch1
    image_speed = 0.1
    goalx = (wagon.x - 47)
    goaly = (wagon.y - 9)
    stepx = ((goalx - x) / 100)
    stepy = ((goaly - y) / 100)
    con = 41
    steps = 0
    samt = 0
}
if (con == 41)
{
    samt += 1
    if (samt == 10)
        snd_play_ch1(snd_step1_ch1)
    if (samt == 20)
        samt = 0
    steps += 1
    x += stepx
    y += stepy
    if (steps >= 100)
    {
        con = 52
        alarm[4] = 40
        x = goalx
        y = goaly
        image_speed = 0
        image_index = 0
    }
}
if (con == 53)
{
    with (wagon)
        visible = false
    sprite_index = spr_dkris_heartthrow_ch1
    image_index = 0
    image_speed = 0.25
    con = 54
    alarm[4] = 40
}
if (con == 54)
{
    if (image_index == 5)
    {
        snd_play_ch1(snd_impact_ch1)
        snd_play_ch1(snd_hurt1_ch1)
        snd_play_ch1(snd_locker_ch1)
        instance_create_ch1(0, 0, obj_shake_ch1)
    }
}
if (con == 55)
{
    heartwagon = 1
    sprite_index = spr_dkris_heartthrow_post_ch1
    con = 56
    alarm[4] = 30
}
if (con == 57)
{
    x = 158
    y = 125
    sprite_index = spr_dkris_ul_ch1
    image_speed = 0
    goalx = (wagon.x - 47)
    goaly = (wagon.y - 9)
    stepx = ((goalx - x) / 100)
    stepy = ((goaly - y) / 100)
    x = goalx
    y = goaly
    steps = 0
    samt = 0
    con = 58
    alarm[4] = 30
}
if (con == 59)
{
    samt += 1
    if (samt == 10)
        snd_play_ch1(snd_step1_ch1)
    if (samt == 20)
        samt = 0
    image_speed = 0.1
    x -= stepx
    y -= stepy
    steps += 1
    if (steps >= 100)
    {
        image_index = 0
        image_speed = 0
        con = 60
        alarm[4] = 30
    }
}
if (con == 61)
{
    sprite_index = spr_dkris_ur_pullknife_ch1
    image_speed = 0
    image_index = 0
    con = 62
    alarm[4] = 30
}
if (con == 63)
{
    image_speed = 0.1
    con = 64
    alarm[4] = 285
}
if (con == 65)
{
    eyeflash = scr_marker_ch1((x + 15), (y + 9), spr_asgore_eyeflash_serious_ch1)
    eyeflash.image_blend = c_red
    with (eyeflash)
        image_speed = 0.2
    image_speed = 0
    snd_play_ch1(snd_break2_ch1)
    con = 66
    alarm[4] = 25
}
if (con == 67)
{
    with (eyeflash)
        instance_destroy()
    con = 68
    alarm[4] = 60
}
if (con == 69)
{
    pix = scr_marker_ch1(-10, -10, spr_pixel_white_ch1)
    with (pix)
    {
        image_blend = c_black
        image_xscale = 700
        image_yscale = 700
    }
    con = 70
    alarm[4] = 60
}
if (con == 71)
    room_goto(PLACE_LOGO_ch1)
if (heartwagon == 1)
{
    if (left_p_ch1() && heartx > -4)
        heartx -= 1
    if (right_p_ch1() && heartx < 4)
        heartx += 1
    if (down_p_ch1() && hearty < 4)
        hearty += 1
    if (up_p_ch1() && hearty > -4)
        hearty -= 1
}
if (heartwagon == 2)
{
    moved = 0
    if left_p_ch1()
        moved = 1
    if right_p_ch1()
        moved = 1
    if down_p_ch1()
        moved = 1
    if up_p_ch1()
        moved = 1
    if (moved == 1 && shaketimer <= 0)
    {
        shaketimer = 24
        cageamt = 4
        snd_play_ch1(snd_noise_ch1)
    }
    if (cageamt > 0)
        cageamt -= 0.5
    else
        cageamt = 0
    shaketimer -= 1
}
