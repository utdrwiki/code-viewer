difficulty = 0;
bullet_list = ds_list_create();
timer = -7;
big = -1;
num = 2;
damage = 5;
snd_loop(snd_crowd_laughter_loop);
fadetype = 0;
fade = 2.5;
fademax = 1;
opaq = 0;
my_surface = -4;
my_surface2 = -4;

spawn_new = function(arg0)
{
    var dir = -1;
    if (arg0 == 1)
        dir = 1;
    var total_length = 240;
    var init_length = 70;
    if (num == 2)
        num = 3;
    else
        num = 2;
    var interval = total_length / num;
    var cent = interval * 0.5;
    var range = cent - 12;
    for (a = 0; a < num; a++)
    {
        with (scr_fire_bullet(x - ((init_length + (interval * a) + cent + random_range(-range, range)) * dir), y, obj_tenna_allstars_bullet, 0, 0))
        {
            target = other.target;
            damage = other.damage;
            if (other.big)
                size = 1;
            else
                size = 0.5;
            ds_list_add(other.bullet_list, id);
            if (other.big)
                mydir = dir * 1.3;
            else
                mydir = dir * 0.7;
            other.big *= -1;
        }
    }
};
