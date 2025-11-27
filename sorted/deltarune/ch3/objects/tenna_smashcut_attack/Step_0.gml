timer++;
var make_random_lightning = 0;
if (type == 0)
{
    if (timer == 10)
    {
        make_random_lightning = 1;
        timer = 0;
    }
}
if (type >= 1)
{
    if (timer == 10)
    {
        timer = -20;
        var vside = choose(-1, 1);
        var hside;
        if (type == 1 || type == 3)
        {
            hside = choose(-1, 1);
            if (hside == sideprevious)
                hside = choose(-1, 1);
            if (hside == sideprevious)
                hside = choose(-1, 1);
            if (type == 3)
            {
                side *= -1;
                vside = side;
            }
            timer = -16;
        }
        if (type == 2)
        {
            hside = choose(-1, 1, 2);
            if (hside == sideprevious)
                hside = choose(-1, 1, 2);
            if (hside == sideprevious)
                hside = choose(-1, 1, 2);
            timer = -16;
        }
        sideprevious = hside;
        var makex = obj_growtangle.x;
        var amount = 5;
        var randomhoz;
        if (type == 3)
        {
            amount = 3;
            randomhoz = random_range(-30, 30);
        }
        for (var i = 0; i < amount; i++)
        {
            if (hside == 1 || hside == -1)
                makex = obj_growtangle.x + ((70 - (i * 16)) * hside);
            else if ((i % 2) == 0)
                makex = obj_growtangle.x - (i * 8);
            else
                makex = obj_growtangle.x + (i * 8);
            if (type == 3)
                makex = obj_growtangle.x + (((60 - (i * 60)) + randomhoz) * hside);
            with (scr_fire_bullet(makex, obj_growtangle.y + (140 * vside), obj_regularbullet, 180 - (90 * side), 0, spr_tenna_smash_lightning))
            {
                target = other.target;
                damage = other.damage;
                vspeed = vside * -(2 - (i / 4));
                friction = -0.08;
                grazepoints = 1.7;
                if (other.type == 3)
                    grazepoints = 4.5;
                mask_index = spr_tenna_smash_lightning_mask;
                image_xscale = 2;
                image_yscale = 2;
                if (other.type == 3)
                {
                    friction = -0.03;
                    image_alpha = 0;
                    scr_lerpvar("image_alpha", 4, 0, 100);
                    scr_lerpvar("image_alpha", 0, 1, 8);
                    scr_doom(id, 100);
                }
                else
                {
                    scr_doom(id, 70);
                    image_alpha = 0;
                    scr_lerpvar("image_alpha", 4, 0, 70);
                    scr_lerpvar("image_alpha", 0, 1, 8);
                }
            }
        }
    }
}
if (make_random_lightning)
{
    side *= -1;
    aim_counter++;
    var hoz = obj_growtangle.x + irandom_range(-85, 85);
    if (aim_counter >= 7 || (aim_counter > 4 && irandom(1)))
    {
        hoz = obj_heart.x + 10;
        aim_counter = 0;
    }
    with (scr_fire_bullet(hoz, obj_growtangle.y + (120 * side), obj_regularbullet, 180 - (90 * side), 0, spr_tenna_smash_lightning))
    {
        x += 4;
        scr_script_delayed(scr_var, 1, "x", x - 8);
        scr_script_delayed(scr_var, 2, "x", x + 7);
        scr_script_delayed(scr_var, 3, "x", x - 6);
        scr_script_delayed(scr_var, 4, "x", x + 5);
        scr_script_delayed(scr_var, 5, "x", x - 4);
        scr_script_delayed(scr_var, 6, "x", x + 3);
        scr_script_delayed(scr_var, 7, "x", x - 2);
        scr_script_delayed(scr_var, 8, "x", x + 1);
        scr_script_delayed(scr_lerpvar, 10, "speed", 2, 6, 20);
        visible = false;
        mask_index = spr_tenna_smash_lightning_mask;
        image_xscale = 2;
        image_yscale = 2;
        grazepoints = 2;
        target = other.target;
        damage = other.damage;
    }
}
