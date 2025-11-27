if (con == 1)
{
    timer++;
    if (!tower2)
    {
        cameray_set(camy);
        if (timer == 30)
        {
            whiteout = scr_marker_ext(0, 0, spr_pxwhite, room_width, room_height, undefined, undefined, c_white, obj_rotating_kris_controller_new.depth + 1);
            with (whiteout)
            {
                image_alpha = 0;
                scr_lerpvar("image_alpha", 0, 1, 30);
            }
        }
        if (timer == 80)
        {
            con = 2;
            timer = 0;
            krsmarker = instance_create_depth(camerax() + (0.5 * camerawidth()), obj_climb_kris.y, obj_rotating_kris_controller_new.depth, obj_marker);
            krsmarker.sprite_index = spr_kris_climb_new_slip_fall;
            scr_darksize(krsmarker);
            with (krsmarker)
                scr_lerpvar("vspeed", 0, 8, 10);
            with (obj_climb_kris)
            {
                visible = 0;
                image_alpha = 0;
                climb_finished = true;
            }
            blackout = scr_marker_ext(0, 0, spr_pxwhite, room_width, room_height, undefined, undefined, c_black, obj_rotating_kris_controller_new.depth + 2);
        }
        global.interact = 1;
    }
    else
    {
        with (obj_climb_kris)
        {
            forceclimb = true;
            climb_finished = true;
        }
    }
}
else if (con == 2)
{
    timer++;
    if (!tower2)
    {
        cameray_set(camy);
        var delay = 65;
        var duration = 60;
        if (timer >= delay && timer < (delay + duration))
        {
            if (timer == delay)
                obj_climb_kris.y = krsmarker.y;
            var t = min((timer - delay) / (duration - 5), 1);
            krsmarker.vspeed = 0;
            krsmarker.x = lerp(camerax() + (0.5 * camerawidth()), camerax() + 400 + 4, t);
            krsmarker.y = lerp(obj_climb_kris.y, (cameray() + (0.5 * cameraheight())) - 18, t);
        }
        else if (timer < 30)
        {
            krsmarker.vspeed *= 0.85;
        }
        if (timer == (delay + duration))
        {
            snd_play(snd_noise);
            krsmarker.sprite_index = spr_kris_dw_landed;
            krsmarker.image_speed = 0;
            krsmarker.x -= 20;
            krsmarker.y -= 26;
            with (krsmarker)
                scr_shakeobj();
        }
        if (timer == (delay + duration + 10))
        {
            with (whiteout)
            {
                scr_lerpvar("image_alpha", 1, 0, 30);
                scr_doom(self, 30);
            }
            with (instance_create(krsmarker.x, krsmarker.y, obj_marker_screen))
            {
                sprite_index = spr_kris_dw_landed;
                image_speed = 0;
                scr_darksize();
                persistent = true;
                scr_doom(self, 60);
            }
            with (krsmarker)
                instance_destroy();
        }
        if (timer == (delay + duration + 60))
            room_goto(room_dw_churchc_titanclimb1_post);
    }
    else
    {
        if (timer == 30)
            scr_fadeout(15);
        if (timer == 50)
        {
            global.interact = 0;
            if (tower2)
                room_goto(room_dw_churchc_titanclimb1);
            else
                room_goto(room_dw_churchc_titanclimb2);
        }
    }
}
