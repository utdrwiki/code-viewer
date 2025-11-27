if (con == 1)
{
    timer++;
    if ((timer % 2) == 0)
    {
    }
    if ((timer % 8) == 0)
    {
    }
    var endme = false;
    var target = 27;
    if (extflag == "susie")
        target = 731;
    if (always_break_on_timer)
    {
        with (climbarea)
        {
            if (!place_meeting(x, y, target))
            {
                if (!other.only_break_upwards || target.y < y)
                {
                    other.con = 2;
                    endme = true;
                }
                else
                {
                    other.con = 0;
                }
            }
        }
    }
    if (dangerous && timer >= dangertime)
    {
        con = 2;
        with (target)
            fallingcon = 1;
        endme = true;
    }
    if (endme)
    {
        safe_delete(climbarea);
        if (animation_idx > 0)
        {
            with (obj_rotating_tower_animation)
            {
                if (index == other.animation_idx)
                {
                    targetx = other.x + 20;
                    targety = other.y - 20;
                    con = 2;
                    break;
                }
            }
            instance_destroy();
        }
        else
        {
            snd_play(snd_heavyswing);
            if (i_ex(obj_rotating_tower_controller_new) && gravity != 1)
            {
                with (obj_rotating_tower_controller_new)
                    set_tile_sprite_ext(other, spr_nothing, false);
            }
            scr_doom(id, 30);
            gravity = 1;
        }
    }
}
