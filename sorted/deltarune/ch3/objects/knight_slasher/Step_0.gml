if (global.turntimer < 13)
{
    if (endAttack == false)
    {
        endAttack = true;
        sprite_index = spr_roaringknight_idle;
        image_index = 0;
        image_speed = 0;
    }
    if (i_ex(obj_knight_enemy))
    {
        x = lerp(x, obj_knight_enemy.x, (12 - global.turntimer) / 12);
        y = lerp(y, obj_knight_enemy.y, (12 - global.turntimer) / 12);
    }
    fade = scr_afterimage();
    fade.image_alpha = 0.6;
    fade.fadeSpeed = 0.04;
    if (i_ex(obj_knight_enemy))
    {
        with (obj_afterimage)
            depth = obj_knight_enemy.depth + 1;
    }
    fade.hspeed = 4;
    exit;
}
fulltimer++;
if (state == "slash")
{
    if (reverse)
    {
        if (image_index > 3)
            image_index = scr_approach(image_index, 3, 0.25);
        else
            image_index = scr_approach(image_index, 1, 1);
    }
    else if (image_index < 2)
    {
        image_index = scr_approach(image_index, 2, 0.5);
    }
    else if (image_index < 3)
    {
        image_index = scr_approach(image_index, 3, 0.1);
    }
    else if (image_index < 4)
    {
        image_index = scr_approach(image_index, 4, 0.25);
    }
    else
    {
        image_index = scr_approach(image_index, 5.99, 1);
    }
    if ((image_index == 3 && !reverse) || (image_index == 3.75 && reverse))
    {
        if (combo == 2 && !irandom(2))
            do_combo = true;
        if (irandom(1))
            snd_play(snd_knight_cut);
        else
            snd_play(snd_knight_cut2);
        var roarknight_slash = scr_fire_bullet(x + 40, ((y + (sprite_height * 0.5)) - 20) + 20, obj_bullet_knight_slash, 0, 0, spr_roaringknight_crescentbeam_halved);
        with (roarknight_slash)
        {
            arc_y = other.y + (other.sprite_height * 0.5);
            event_user(0);
            image_yscale = 6;
            speed = 4;
            scr_lerpvar_instance(id, "hspeed", hspeed, -16, 18);
            vspeed += (1.75 + (abs(x - ((scr_get_box(0) + 140) - (sprite_width * 0.5))) / 42));
            if (other.combo < 2)
                archeight *= 0.5;
        }
        roarknight_slash = scr_fire_bullet(x + 40, y + (sprite_height * 0.5) + 20 + 20, obj_bullet_knight_slash, 0, 0, spr_roaringknight_crescentbeam_halved);
        with (roarknight_slash)
        {
            arc_y = other.y + (other.sprite_height * 0.5);
            event_user(0);
            image_yscale = -6;
            speed = 4;
            scr_lerpvar_instance(id, "hspeed", hspeed, -16, 18);
            vspeed -= (1.75 + (abs(x - ((scr_get_box(0) + 140) - (sprite_width * 0.5))) / 42));
            if (other.combo < 2)
                archeight *= 0.5;
        }
    }
    if ((image_index == 5.99 && !reverse) || (image_index == 1 && reverse))
        timer++;
    if (timer == 1)
    {
        if (!((do_combo && combo == 2) || ((irandom(1) && combo < 2) && combo)))
        {
            state = "move";
            timer = 0;
        }
    }
    if (timer == (6 - diff))
    {
        reverse *= -1;
        if (reverse)
            image_index = 4;
        else
            image_index = 2.9;
        combo--;
        timer = 0;
    }
}
if (state == "move")
{
    timer++;
    if (timer == 1)
    {
        new_x = ((scr_get_box(0) + 140) - (sprite_width * 0.5)) + random(40);
        new_y = ((-sprite_height * 0.5) + scr_get_box(1) + (scr_get_box(5) * 0.5) + (((scr_get_box(5) * 0.15) + (scr_get_box(5) * random(0.25))) * side)) - 20;
        side *= -1;
        scr_lerpvar_instance(id, "x", x, new_x, (5 + movespeed) - diff, 2, "out");
        scr_lerpvar_instance(id, "y", y, new_y, (5 + movespeed) - diff, 2, "out");
    }
    if (timer == ((5 - diff) + movespeed))
    {
        state = "slash";
        timer = 0;
        image_speed = 0;
        if (diff == 4 && irandom(1))
            image_index = 2.5;
        else
            image_index = 1;
        reverse = -1;
        combo = 2;
        do_combo = false;
        movespeed = irandom(4);
    }
}
if ((timer % 2) == 0)
{
    fade = scr_afterimage();
    fade.image_alpha = 0.6;
    fade.fadeSpeed = 0.04;
    fade.hspeed = 4;
}
