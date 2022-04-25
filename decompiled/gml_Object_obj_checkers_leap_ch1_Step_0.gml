if (leapmode == false)
{
    if (jumpcon == 1)
    {
        if (vspeed >= 0)
        {
            if (y >= ((obj_growtangle_ch1.y + (obj_growtangle_ch1.sprite_height / 2)) - sprite_height))
            {
                snd_play_ch1(snd_impact_ch1)
                instance_create_ch1(0, 0, obj_shake_ch1)
                y = ((obj_growtangle_ch1.y + (obj_growtangle_ch1.sprite_height / 2)) - sprite_height)
                jumptimer = 0
                vspeed = 0
                gravity = 0
                hspeed = 0
                sprite_index = spr_checkers_crouch_ch1
                jumpcon = 0
            }
        }
    }
    if (jumpcon == 3)
    {
        if (vspeed >= 0)
        {
            if (y >= (floory - 2))
            {
                snd_play_ch1(snd_impact_ch1)
                instance_create_ch1(0, 0, obj_shake_ch1)
                y = floory
                x = xstart
                vspeed = 0
                gravity = 0
                hspeed = 0
                sprite_index = spr_checkers_crouch_ch1
                jumpcon = 4
            }
        }
    }
    if (jumpcon == 0)
    {
        sprite_index = spr_checkers_crouch_ch1
        jumptimer += 1
        jumpmax = 20
        if (amt >= 1)
            jumpmax = 10
        if (jumptimer >= jumpmax)
        {
            snd_play_ch1(snd_jump_ch1)
            floory = y
            jumptimer = 0
            jumpcon = 1
            amt += 1
            sprite_index = spr_checkers_leap_ch1
            targetx = ((obj_heart_ch1.x + 8) - (sprite_width / 2))
            vspeed = -15
            if (amt == 1)
                vspeed = -17
            gravity = 1
            hspeed = ((targetx - x) / 28)
            if (amt >= 4)
            {
                active = false
                jumpcon = 3
                targetx = xstart
                gravity = 2
                hspeed = ((targetx - x) / 16)
            }
        }
    }
    if (jumpcon == 4)
    {
        jumptimer += 1
        if (jumptimer >= 10)
        {
            global.turntimer = -1
            with (obj_checkers_enemy_ch1)
                visible = true
            instance_destroy()
        }
    }
}
if (leapmode == true)
{
    if (jumpcon == 7)
    {
        jumptimer += 1
        if (jumptimer >= 10)
        {
            with (obj_regularbullet_ch1)
            {
                active = false
                image_alpha -= 0.1
            }
        }
        if (jumptimer >= 20)
        {
            global.turntimer = -1
            with (obj_checkers_enemy_ch1)
                visible = true
            instance_destroy()
        }
    }
    if (jumpcon == 6)
    {
        if (y >= (floory - 2))
        {
            y = floory
            x = xstart
            vspeed = 0
            gravity = 0
            hspeed = 0
            sprite_index = spr_checkers_crouch_ch1
            jumpcon = 7
        }
    }
    if (jumpcon == 0)
    {
        sprite_index = spr_checkers_crouch_ch1
        jumptimer += 1
        if (jumptimer >= 20)
        {
            floory = y
            jumptimer = 0
            jumpcon = 1
            sprite_index = spr_checkers_leap_ch1
            targetx = ((obj_heart_ch1.x + 8) - (sprite_width / 2))
            hspeed = ((targetx - x) / 17)
            vspeed = -17
            snd_play_ch1(snd_jump_ch1)
            gravity = 1
            amt += 1
            if (amt >= 3)
            {
                active = false
                jumpcon = 6
                targetx = xstart
                gravity = 2
                hspeed = ((targetx - x) / 16)
            }
        }
    }
    if (jumpcon == 1)
    {
        if (vspeed >= 0)
        {
            gravity = 0
            vspeed = 0
            hspeed = 0
            jumpcon = 2
            snd_play_ch1(snd_boost_ch1)
        }
    }
    if (jumpcon == 2)
    {
        image_speed = 0.25
        jumptimer += 1
        if (jumptimer >= 15)
        {
            snd_play_ch1(snd_ultraswing_ch1)
            image_speed = 0
            image_index = 0
            vspeed = 32
            jumpcon = 3
            jumptimer = 0
        }
    }
    if (jumpcon == 3)
    {
        a = scr_afterimage_ch1()
        a.image_alpha = 0.7
        if (y >= ((obj_growtangle_ch1.y + (obj_growtangle_ch1.sprite_height / 2)) - sprite_height))
        {
            shrapmax = 6
            snd_play_ch1(snd_impact_ch1)
            instance_create_ch1(0, 0, obj_shake_ch1)
            for (i = 0; i < shrapmax; i += 1)
            {
                shrap = instance_create_ch1((((x + (sprite_width / 2)) - 15) + (i * 5)), (obj_growtangle_ch1.y + (obj_growtangle_ch1.sprite_height / 2)), obj_regularbullet_ch1)
                shrap.image_xscale = 1.5
                shrap.image_yscale = 1.5
                shrap.direction = ((130 - random(10)) - (70 * (i / (shrapmax - 1))))
                shrap.sprite_index = spr_checkershrapnel_ch1
                shrap.speed = (6 + random(1))
                shrap.gravity = 0.25
                shrap.target = target
                shrap.damage = damage
            }
            y = ((obj_growtangle_ch1.y + (obj_growtangle_ch1.sprite_height / 2)) - sprite_height)
            vspeed = 0
            gravity = 0
            hspeed = 0
            sprite_index = spr_checkers_crouch_ch1
            jumpcon = 0
        }
    }
}
if (leapmode == 2)
{
    if (jumpcon == 0)
    {
        sprite_index = spr_checkers_magnificent_ch1
        image_speed = 0.5
        jumpcon = 1
        magamt = 0
    }
    if (jumpcon == 1)
    {
        if (image_index == 2)
            snd_play_ch1(snd_ultraswing_ch1)
        if (image_index >= 4)
        {
            image_index = 4
            image_speed = 0
            hspeed = -4
            gravity = -0.12
            jumpcon = 2
            siner = 0
        }
    }
    if (jumpcon == 2)
    {
        siner += 1
        y += (sin((siner / 3)) * 4)
        s_timer += 1
        if (s_timer == 20)
            snd_play_ch1(snd_magicsprinkle_ch1)
        if (s_timer >= 24)
        {
            bul = instance_create_ch1((x + random((sprite_width / 2))), ((y + sprite_height) - 50), obj_regularbullet_ch1)
            bul.sprite_index = spr_checkershrapnel_ch1
            bul.vspeed = 3
            bul.image_xscale = 1.5
            bul.image_yscale = 1.5
            bul.depth = (depth + 1)
            bul.gravity_direction = (135 + random(180))
            bul.gravity = 0.06
            bul.target = target
            bul.damage = damage
            if (magamt == 6 || magamt == 12)
            {
                with (bul)
                {
                    gravity = 0
                    move_towards_point((obj_heart_ch1.x + 8), (obj_heart_ch1.y + 8), 3)
                }
            }
            s_timer = 21
            magamt += 1
        }
        if (y < (__view_get((1 << 0), 0) - 200))
        {
            speed = 0
            gravity = 0
            y = (ystart - 100)
            x = (xstart + 300)
            hspeed = -30
            vspeed = 10
            jumpcon = 3
        }
    }
    if (jumpcon == 3)
    {
        magamt = 0
        jumptimer += 1
        if (jumptimer >= 10)
        {
            snd_play_ch1(snd_impact_ch1)
            instance_create_ch1(0, 0, obj_shake_ch1)
            amt += 1
            s_timer = 0
            x = xstart
            y = ystart
            hspeed = 0
            vspeed = 0
            jumpcon = 0
            jumpcon = 4
            jumptimer = 0
            sprite_index = spr_checkers_idle_ch1
            image_index = 0
            image_speed = 0
        }
    }
    if (jumpcon == 4)
    {
        jumptimer += 1
        if (jumptimer >= 20)
        {
            with (obj_regularbullet_ch1)
            {
                active = false
                image_alpha -= 0.1
            }
        }
        if (jumptimer >= 30)
        {
            global.turntimer = -1
            instance_destroy()
            with (obj_checkers_enemy_ch1)
                visible = true
        }
    }
}
if (leapmode == 3)
{
    with (obj_regularbullet_ch1)
    {
        image_xscale += 0.01
        image_yscale += 0.01
    }
    if (jumpcon == 0)
    {
        sprite_index = spr_checkers_leg_ch1
        image_index = 0
        image_speed = 0.5
        jumpcon = 1
    }
    if (jumpcon == 1)
    {
        if (image_index == 3)
        {
            snd_play_ch1(snd_swing_ch1)
            snd_play_ch1(snd_magicsprinkle_ch1)
            for (i = 0; i < 4; i += 1)
            {
                bul = instance_create_ch1((x - 40), (y + 100), obj_regularbullet_ch1)
                bul.sprite_index = spr_checkershrapnel_ch1
                bul.direction = ((point_direction(bul.x, bul.y, (obj_heart_ch1.x + 8), (obj_heart_ch1.y + 8)) - (10 * i)) + random((i * 20)))
                bul.speed = (3.5 + random(1.8))
                bul.target = target
                bul.damage = damage
            }
        }
        if (image_index >= 5)
        {
            image_index = 5
            image_speed = 0
            jumpcon = 2
        }
    }
    if (jumpcon == 2)
    {
        jumptimer += 1
        if (jumptimer >= 10)
        {
            sprite_index = spr_checkers_idle_ch1
            image_index = 0
        }
        if (jumptimer >= 20)
        {
            jumptimer = 0
            jumpcon = 0
            amt += 1
            if (amt >= 4)
            {
                jumpcon = 3
                jumptimer = 0
            }
        }
    }
    if (jumpcon == 3)
    {
        jumptimer += 1
        if (jumptimer >= 20)
        {
            with (obj_regularbullet_ch1)
            {
                image_alpha -= 0.1
                active = false
            }
        }
        if (jumptimer >= 30)
        {
            global.turntimer = -1
            instance_destroy()
            with (obj_checkers_enemy_ch1)
                visible = true
        }
    }
}
if (leapmode == 4)
{
    if (jumpcon == 1)
    {
        if (y >= (floory - 2))
        {
            y = floory
            vspeed = 0
            gravity = 0
            hspeed = 0
            sprite_index = spr_checkers_crouch_ch1
            jumpcon = 0
            jumptimer = 10
        }
    }
    if (jumpcon == 3)
    {
        if (y >= (floory - 2))
        {
            y = floory
            x = xstart
            vspeed = 0
            gravity = 0
            hspeed = 0
            sprite_index = spr_checkers_crouch_ch1
            jumpcon = 4
        }
    }
    if (jumpcon == 0)
    {
        jumptimer += 1
        if (jumptimer >= 16)
        {
            floory = y
            jumptimer = 0
            jumpcon = 1
            sprite_index = spr_checkers_leap_ch1
            targetx = ((obj_heart_ch1.x + 8) - (sprite_width / 2))
            vspeed = -12
            gravity = 1
            hspeed = ((targetx - x) / 24)
            amt += 1
            if (amt >= 4)
            {
                active = false
                jumpcon = 3
                jumptimer = 0
                targetx = xstart
                gravity = 2
                hspeed = ((targetx - x) / 12)
            }
        }
    }
    if (jumpcon == 4)
    {
        jumptimer += 1
        if (jumptimer >= 10)
        {
            global.turntimer = -1
            with (obj_checkers_enemy_ch1)
                visible = true
            instance_destroy()
        }
    }
}
if (grazed == true)
{
    grazetimer += 1
    if (grazetimer >= 10)
    {
        grazetimer = 0
        grazed = false
    }
}
