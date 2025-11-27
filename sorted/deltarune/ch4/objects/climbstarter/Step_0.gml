if (con == 0)
{
    var trig = 0;
    if (global.flag[23] && !i_ex(obj_climb_kris))
    {
        with (obj_climbstartertrig)
        {
            if (exitmarkerflag == other.exitmarkerflag)
            {
                if (myinteract == 3)
                {
                    trig = 10;
                    myinteract++;
                }
            }
        }
    }
    if (forcetoclimb == true)
        trig = 10;
    if (i_ex(obj_climb_kris))
        trig = -1;
    if (!global.flag[23])
        trig = -1;
    if (trig == 10)
    {
        forcetoclimb = false;
        con = 1;
        timer = 0;
    }
}
if (con == 1)
{
    timer++;
    if (timer == 1)
    {
        obj_mainchara.visible = false;
        obj_mainchara.freeze = true;
        obj_mainchara.cutscene = true;
        endtime = 8;
        if (i_ex(obj_rotating_tower_controller_new) && center_if_tower == 1)
        {
            with (obj_rotating_tower_controller_new)
                scr_pan_lerp(tower_x - (0.5 * camerawidth()), cameray(), other.endtime);
        }
        with (obj_caterpillarchara)
        {
            visible = 1;
            image_alpha = 1;
            var me = id;
            with (obj_lerpvar)
            {
                if (target == me)
                    instance_destroy();
            }
            scr_lerp_imageblend(id, c_white, c_gray, 7);
            scr_lerpvar("image_alpha", 1, 0, 7);
            shadow_force_off = true;
        }
        jumpmarker = scr_marker_ext(obj_mainchara.x, obj_mainchara.y, spr_kris_jump_ball_fixed, 2, 2, 0.25, 0, c_white, obj_mainchara.depth);
        with (obj_mainchara)
            scr_stickto(other.jumpmarker, 0);
        with (jumpmarker)
            scr_jump_to_point(other.x - 2, other.y - 22, 8, other.endtime, true);
        snd_play(snd_wing);
    }
    if (timer == (1 + endtime))
    {
        global.interact = 0;
        snd_play(snd_noise);
        safe_delete(jumpmarker);
        with (instance_create(x + 20, y + 20, obj_climb_kris))
        {
            if (other.e_up)
                yclimb = 1;
        }
        con = 0;
    }
}
if (susieball != -4)
{
    susietimer++;
    if (susietimer >= 20)
    {
        snd_play(snd_noise);
        safe_delete(susieball);
        instance_create(x + 20, y + 20, obj_climb_susie);
        susietimer = 0;
        susieball = -4;
    }
}
