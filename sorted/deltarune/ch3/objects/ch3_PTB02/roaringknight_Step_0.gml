if (!reach_interrupt && stopsiner2 == false)
    siner2++;
if (!hover_pause)
    y = ystart + (cos(siner2 / 8) * 8);
if (scr_debug())
{
    if (keyboard_check_pressed(ord("K")))
    {
        state = 2;
        static_timer = 0;
        snd_play(snd_weaponpull);
    }
}
var ignoreaetimer = 0;
if (state == 2)
    ignoreaetimer = 1;
if (state == 3)
    ignoreaetimer = 1;
aetimer++;
if ((aetimer % move_speed) == 0 && image_alpha != 0 && ignoreaetimer == 0)
{
    if (state == 0)
    {
        if (draw_sword)
        {
            draw_timer++;
            if (draw_timer == 1)
            {
                sword_active = true;
                sprite_index = spr_roaringknight_sword_appear;
                image_index = 0;
                image_speed = 0.3;
            }
            if (draw_timer == 3)
            {
                image_speed = 0;
                sword_appear = true;
                scr_lerpvar("sword_alpha", 0, 1, 15, 4, "out");
                scr_lerpvar("y_base_pos", y_base_pos, y_base_pos - 266, 15, -1, "out");
            }
            if (draw_timer == 8)
            {
                sword_flash = false;
                sword_appear = false;
            }
            if (draw_timer == 12)
            {
                sprite_index = spr_roaringknight_sword_appear_new;
                image_index = 0;
                sword_draw_timer = sword_draw_timestamps[sword_draw_index];
                grab_hand = true;
            }
            if (grab_hand)
            {
                if (!battle_ready)
                {
                    sword_draw_timer--;
                    if (sword_draw_timer <= 0)
                    {
                        sword_draw_index++;
                        if (sword_draw_index >= array_length(sword_draw_timestamps))
                        {
                            battle_ready = true;
                        }
                        else
                        {
                            sword_draw_timer = sword_draw_timestamps[sword_draw_index];
                            image_index = sword_draw_index;
                        }
                    }
                }
            }
        }
        if (after_active)
        {
            afterimage = instance_create_depth(x, y, depth + 1, obj_afterimage);
            afterimage.sprite_index = sprite_index;
            afterimage.image_alpha = 0.6;
            afterimage.fadeSpeed = 0.02;
            afterimage.hspeed = after_image_rate * after_image_dir;
            afterimage.image_index = image_index;
            afterimage.image_speed = 0;
            afterimage.image_xscale = image_xscale;
            afterimage.image_yscale = image_yscale;
        }
    }
    if (state == 1)
    {
        if (after_active)
        {
            afterimage = instance_create_depth(x, y, depth + 1, obj_afterimage);
            afterimage.sprite_index = reach_sprite;
            afterimage.image_alpha = 0.6;
            afterimage.fadeSpeed = 0.02;
            afterimage.hspeed = after_image_rate * after_image_dir;
            afterimage.image_index = 3;
            afterimage.image_speed = 0;
            afterimage.image_xscale = image_xscale;
            afterimage.image_yscale = image_yscale;
        }
    }
    if (state == 4)
    {
        if (i_ex(obj_ch3_PTB02_roaringknight_pull_test))
        {
            afterimage = instance_create_depth(obj_ch3_PTB02_roaringknight_pull_test.hand_x_pos, obj_ch3_PTB02_roaringknight_pull_test.hand_y_pos, depth + 1, obj_afterimage);
            afterimage.sprite_index = spr_roaringknight_arm_reach_grow;
            afterimage.image_alpha = 0.6;
            afterimage.fadeSpeed = 0.02;
            afterimage.hspeed = after_image_rate * after_image_dir;
            afterimage.image_index = obj_ch3_PTB02_roaringknight_pull_test.handframe;
            afterimage.image_speed = 0;
            afterimage.image_xscale = image_xscale;
            afterimage.image_yscale = image_yscale;
            afterimage = instance_create_depth(obj_ch3_PTB02_roaringknight_pull_test.x, obj_ch3_PTB02_roaringknight_pull_test.y, depth + 1, obj_afterimage);
            afterimage.sprite_index = obj_ch3_PTB02_roaringknight_pull_test.base_sprite;
            afterimage.image_alpha = 0.6;
            afterimage.fadeSpeed = 0.02;
            afterimage.hspeed = after_image_rate * after_image_dir;
            afterimage.image_index = obj_ch3_PTB02_roaringknight_pull_test.image_index;
            afterimage.image_speed = 0;
            afterimage.image_xscale = image_xscale;
            afterimage.image_yscale = image_yscale;
        }
    }
    if (shakeamt > 0)
    {
        shaketimer--;
        if (shaketimer <= 0)
        {
            shakex = random_range(-shakeamt, shakeamt);
            shakey = random_range(-shakeamt, shakeamt);
            shaketimer = shaketime;
        }
    }
    else
    {
        shakex = 0;
        shakey = 0;
    }
}
if (state == 2)
{
    static_timer++;
    if (static_timer == 1)
    {
        snd_stop(snd_tv_static);
        snd_play(snd_tv_static);
        sprite_index = spr_roaring_knight_overworld_warp;
        image_speed = 0;
        image_index = 5;
        shakeamt = 4;
        scr_delay_var("static_timer", 0, 12);
        scr_delay_var("state", 0, 12);
    }
    if (static_timer == 2)
        image_index = 6;
    snd_pitch(snd_tv_static, 0.5 + random(1));
    if (static_timer == 3)
        image_index = 7;
    if (static_timer == 4)
        image_index = 8;
    if (static_timer >= 5)
        image_index = choose(6, 7, 8);
    if (static_timer == 10)
    {
        image_index = 6;
        snd_stop(snd_tv_static);
    }
    if (static_timer == 11)
        image_index = 5;
    if (static_timer >= 12)
        image_index = 0;
    var after = scr_afterimage();
    after.depth = depth + 1;
    after.image_alpha = 0.5;
    after.direction = random(360);
    after.speed = 1;
}
if (state == 3)
{
    static_timer++;
    if (static_timer == 1)
    {
        sprite_index = spr_roaring_knight_overworld_warp;
        image_speed = 0;
        static_fx_looping = true;
        snd_stop(snd_tv_static);
        snd_loop(snd_tv_static);
    }
    else if ((static_timer % 2) == 0)
    {
        image_index = 5 + floor(random(3) + 2.8);
        shakex = choose(-2, -1, 0, 1, 2);
        shakey = choose(-2, -1, 0, 1, 2);
        var after = scr_afterimage();
        after.depth = depth - 1;
        after.image_alpha = 0.3;
        after.direction = random(360);
        after.speed = 1;
        after = scr_afterimage();
        after.depth = depth + 1;
        after.image_alpha = 0.5;
        after.direction = random(360);
        after.speed = 1;
        if (floor(random(10)) == 0)
            snd_pitch(snd_tv_static, 0.5 + random(1));
    }
}
else if (static_fx_looping)
{
    static_fx_looping = false;
    snd_stop(snd_tv_static);
}
if (undyne_hat)
{
    undyne_hat = false;
    undyne_hat_release = true;
    var hat_marker = scr_dark_marker(x + 48, y + 20, spr_undyne_dw_hat);
    hat_marker.depth = depth - 100;
    with (hat_marker)
    {
        hspeed = -8;
        gravity = 1;
    }
    scr_doom(hat_marker, 60);
}
if (susie_grab)
{
    susie_grab_timer++;
    if (susie_grab_timer == 1)
    {
        reach_interrupt = true;
        reach_anim_pause = true;
        if (i_ex(obj_ch3_PTB02))
        {
            susie_grab_x = obj_ch3_PTB02.su_actor.x;
            susie_grab_y = obj_ch3_PTB02.su_actor.y;
        }
    }
}
