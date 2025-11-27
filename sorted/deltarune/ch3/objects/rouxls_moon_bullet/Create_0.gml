scr_bullet_init();
destroyonhit = 0;
grazepoints = 3;
image_xscale = 2;
image_yscale = 2;
timer = 0;
con = 1;
start_x = x;
start_y = y;
target_x = x;
target_y = y + 79;
move_count = 0;
n = 3;
sun = 0;
slowing = 30;
owner = -4;
suntimer = 17;
slowing = 30;
owner = -4;
if (sun == 1)
{
    sprite_index = spr_lanino_sun;
    image_xscale = 1;
    image_yscale = 1;
}
else
{
    sprite_index = spr_lanino_moon;
    image_xscale = 0.5;
    image_yscale = 0.5;
    tilt = random(pi);
    image_angle = sin(tilt) * 12;
    interval = -1;
    base = random(360);
    repeat (5)
    {
        obj_dbulletcontroller.n++;
        with (instance_create(x, y, obj_bullet_submoon))
        {
            mydist = 0;
            rotspd = 1;
            mydir = (72 * obj_dbulletcontroller.n) + obj_dbulletcontroller.basedir;
            master = obj_rouxls_moon_bullet.id;
            sprite_index = spr_lanino_moon;
            image_xscale = 0.5;
            image_yscale = 0.5;
        }
    }
}
