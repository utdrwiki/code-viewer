if (chaincon == 0)
{
    if (chain_noise == 0)
    {
        chain_noise = 1
        chainsnd = snd_loop_ch1(snd_chain_extend_ch1)
    }
    sons += 1
    son[sons] = instance_create_ch1(x, y, obj_chainpiece_ch1)
    if (x <= obj_nonsolid_growtangle_ch1.x)
    {
        snd_stop_ch1(chainsnd)
        snd_play_ch1(snd_locker_ch1)
        snd_play_ch1(snd_screenshake_ch1)
        speed = 0
        chaincon = 1
        shakeamt = 12
        remx = obj_heart_ch1.x
        remy = obj_heart_ch1.y
        remx_box = obj_nonsolid_growtangle_ch1.x
        remy_box = obj_nonsolid_growtangle_ch1.y
        chaincon = 2.1
        with (obj_growtangle_ch1)
            megakeep = 1
    }
}
if (chaincon == 2.1)
{
    obj_heart_ch1.x = remx
    obj_heart_ch1.y = remy
    obj_nonsolid_growtangle_ch1.x = remx_box
    obj_nonsolid_growtangle_ch1.y = remy_box
    shakedir = random(360)
    xshake = lengthdir_x(shakeamt, shakedir)
    yshake = lengthdir_y(shakeamt, shakedir)
    obj_heart_ch1.x += xshake
    obj_heart_ch1.y += yshake
    obj_nonsolid_growtangle_ch1.x += xshake
    obj_nonsolid_growtangle_ch1.y += yshake
    shakeamt -= 2
    if (shakeamt < 0)
        chaincon = 3
}
if (chaincon == 3)
{
    if (chain_noise == 1)
    {
        chain_noise = 2
        wavenoise = snd_loop_ch1(snd_chain_wave_ch1)
    }
    if (type == 0)
    {
        siner += 1
        obj_chainking_ch1.y = (initkingy + (sin((siner / 12)) * 80))
        btimer += 1
        if (btimer >= 20)
        {
            regbul = instance_create_ch1((__view_get((0 << 0), 0) - 20), initboxy, obj_regularbullet_ch1)
            regbul.sprite_index = spr_spadebullet_ch1
            regbul.hspeed = 4
            scr_bullet_inherit_ch1(regbul)
            btimer = 0
        }
        if (chain_noise == 2)
            snd_pitch_ch1(wavenoise, (0.8 - (sin((siner / 12)) / 2)))
    }
    if (type == 1)
    {
        siner += 1
        obj_chainking_ch1.y = (initkingy + (sin((siner / 10)) * 80))
        btimer += 1
        if (btimer >= 18)
        {
            regbul = instance_create_ch1((__view_get((0 << 0), 0) - 20), initboxy, obj_regularbullet_ch1)
            regbul.sprite_index = spr_spadebullet_ch1
            regbul.hspeed = 4
            scr_bullet_inherit_ch1(regbul)
            btimer = 0
        }
        if (chain_noise == 2)
            snd_pitch_ch1(wavenoise, (0.9 - (sin((siner / 10)) / 2)))
    }
    if (type == 2)
    {
        siner += 1
        obj_chainking_ch1.y = (initkingy + (sin((siner / 9)) * 80))
        btimer += 1
        if (btimer >= 16)
        {
            regbul = instance_create_ch1((__view_get((0 << 0), 0) - 20), initboxy, obj_regularbullet_ch1)
            regbul.sprite_index = spr_spadebullet_ch1
            regbul.hspeed = 4
            scr_bullet_inherit_ch1(regbul)
            btimer = 0
        }
        if (chain_noise == 2)
            snd_pitch_ch1(wavenoise, (1 - (sin((siner / 9)) / 2)))
    }
    if (type == 3)
    {
        siner += 1
        obj_chainking_ch1.y = (initkingy + ((sin((siner / 7)) * 80) * wavefactor))
        btimer += 1
        if (btimer >= 14)
        {
            regbul = instance_create_ch1((__view_get((0 << 0), 0) - 20), initboxy, obj_regularbullet_ch1)
            regbul.sprite_index = spr_spadebullet_ch1
            regbul.hspeed = 4
            scr_bullet_inherit_ch1(regbul)
            btimer = 0
        }
        if (chain_noise == 2)
            snd_pitch_ch1(wavenoise, (1 - (sin((siner / 7)) / 2)))
    }
}
if instance_exists(obj_chainking_ch1)
{
    kingx[0] = (obj_chainking_ch1.x - initkingx)
    kingy[0] = (obj_chainking_ch1.y - initkingy)
    for (i = 40; i > 0; i -= 1)
    {
        kingx[i] = kingx[(i - 1)]
        kingy[i] = kingy[(i - 1)]
    }
    for (i = 0; i <= sons; i += 1)
    {
        son[i].x = (kingx[i] + son[i].xstart)
        son[i].y = (kingy[i] + son[i].ystart)
    }
    if (chaincon >= 3)
    {
        x = son[sons].x
        y = son[sons].y
        obj_nonsolid_growtangle_ch1.x = (kingx[sons] + initboxx)
        obj_nonsolid_growtangle_ch1.y = (kingy[sons] + initboxy)
    }
}
t += 1
if (t >= (tmax - 10))
{
    wavefactor *= 0.8
    with (obj_chainpiece_ch1)
        image_alpha -= 0.1
    with (obj_regularbullet_ch1)
    {
        active = false
        image_alpha -= 0.1
    }
}
if (t >= tmax)
{
    if (chain_noise == 2)
    {
        chain_noise = 3
        snd_stop_ch1(wavenoise)
    }
    global.turntimer = 3
    with (obj_regularbullet_ch1)
        instance_destroy()
    with (obj_chainking_ch1)
        sprite_index = spr_chainking_receive_ch1
    with (obj_chainking_ch1)
        instance_destroy()
    instance_destroy()
}
