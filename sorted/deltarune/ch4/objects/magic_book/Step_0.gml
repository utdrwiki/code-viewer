event_inherited();
timer++;
vspeed = scr_approach_curve(vspeed, 0, 12);
hspeed = scr_approach_curve(hspeed, 0, 10);
image_alpha = scr_approach(image_alpha, fadetarg, 0.08333333333333333);
if (timer == 8)
    image_index = 3;
if (timer == 12)
{
    if (dog)
        image_index = 7;
    else
        image_index = 4 + spell;
}
if (image_index > 3)
{
    if (spell == 0 && ((timer - 12) % (12 + ceil(9 * ratio))) == 6)
    {
        var lifetime = 25 + irandom(5);
        var bubble = scr_fire_bullet(x, y, obj_bullet_bubble, scr_at_player(x, y) + random_range(-15, 15), 8 + random(4), spr_magic_book_bubble, false, false, depth - 1);
        bubble.alarm[0] = lifetime;
        bubble.damage = 80;
        bubble.target = 4;
        bubble.grazepoints = 3;
        scr_lerpvar_instance(bubble, "speed", bubble.speed / 2, 0.5, lifetime - 3);
        scr_lerpvar_instance(bubble, "speed", bubble.speed, 1.35, 11);
    }
    if (spell == 1)
    {
        if (timer == 20)
        {
            var offset = -40;
            while (offset <= 40)
            {
                with (scr_fire_bullet(x, y, obj_book_bullet, scr_at_player(x, y) + offset, 5, spr_magic_book_wind))
                {
                    with (obj_book_bullet)
                    {
                        damage = 80;
                        target = 4;
                        grazepoints = 3.5;
                    }
                }
                offset += (80 / (3 - (ratio > 1)));
            }
        }
        if (timer == 35)
        {
            var offset = -52;
            while (offset <= 52)
            {
                with (scr_fire_bullet(x, y, obj_book_bullet, scr_at_player(x, y) + offset, 5, spr_magic_book_wind))
                {
                    with (obj_book_bullet)
                    {
                        damage = 80;
                        target = 4;
                        grazepoints = 3.5;
                    }
                }
                offset += (104 / (4 - (ratio > 1)));
            }
        }
    }
    if (spell == 2)
    {
        if (timer == 16)
        {
            if (sameattack == 1 || boost || irandom(4) < 2)
            {
                xtarg = obj_heart.x + 10;
                ytarg = obj_heart.y + 10;
            }
            else
            {
                xtarg = (obj_growtangle.x - 75) + random(150);
                ytarg = (obj_growtangle.y - 75) + random(150);
            }
            flip = choose(180, 0);
        }
        if ((timer % 3) == 1 && timer >= 16 && timer < 32)
        {
            with (instance_create(x, y, obj_book_bullet))
            {
                sprite_index = spr_magic_book_fire;
                vspeed = 10;
                gravity_direction = 90;
                gravity = 0.5;
                hspeed = (other.xtarg - x) / 15;
                vspeed += ((other.ytarg - y) / ((2 * vspeed) / gravity));
                damage = 80;
                target = 4;
                grazepoints = 1.5;
                timepoints = 1;
                bottomfade = 0;
                wall_destroy = false;
                scr_lerpvar("hspeed", hspeed, 0, 30, 3);
            }
        }
        if (boost && timer > 38 && (timer % round(3)) == sameattacker)
        {
            var _y = ((ytarg + 100) - ((timer - 38) * 10)) + 11;
            if (_y < (obj_growtangle.y + 100) && _y > (obj_growtangle.y - 80))
            {
                with (scr_fire_bullet(xtarg, (_y + random(5)) - 10, obj_book_bullet, flip, 2, spr_rouxls_fire))
                {
                    image_angle = direction;
                    scr_lerpvar("image_xscale", 0, 1, 9, 3);
                    scr_lerpvar("x", x, x + (hspeed * 15), 18, 3);
                    scr_lerpvar("hspeed", 0, hspeed * 5, 30, 3);
                    image_xscale = 0;
                    other.flip += 180;
                    damage = 80;
                }
            }
        }
        with (obj_book_bullet)
        {
            if (vspeed < -12)
                vspeed = -12;
        }
        if (timer == 32 && !boost)
            timer = 50;
    }
}
if (timer == (50 + (15 * boost)))
{
    image_index = 3;
    depth++;
}
if (timer == (54 + (15 * boost)))
    image_index = spell;
if (timer == (60 + (15 * boost)))
{
    vspeed = -10;
    hspeed = 4 * open_side;
    fadetarg = 0;
}
if (image_index > 2)
    image_xscale = open_side;
