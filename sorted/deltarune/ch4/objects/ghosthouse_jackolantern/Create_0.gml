scr_bullet_init();
damage = 18;
target = 4;
inv = 3;
hits = 0;
image_alpha = 1;
if (!instance_exists(obj_heart))
    instance_destroy();
wall_destroy = 0;
destroyonhit = false;
timepoints = 0;
point_reached = 0;
squish = 1;
move_directly = false;
path = obj_dbulletcontroller.path;
direct_dir = 180;
direct_spd = 0;
direct_adjust = -1;
adjust_delay = 10;
image_speed = 0;
speed_scale = false;
politer = false;
polite = false;
pause = false;
small = false;
if (obj_growtangle.sprite_index != spr_ghost_house_chimney)
{
    scr_lerpvar("image_yscale", 0, 1, 19, -2, "out");
    scr_lerpvar("image_xscale", 0, 1, 19, -2, "out");
}
timer = -12;
obj_heart.wspeed = 0;
tutu = false;
fully_aggro = false;
draw_hand = false;
hand_x = x;
hand_y = y;
scaredy = false;
if (!instance_exists(obj_jackenstein_enemy) || !obj_jackenstein_enemy.scaredycat)
{
    with (obj_gh_fireball_bouncy)
    {
        store_hspd = hspeed;
        store_vspd = vspeed;
        store_image = image_speed;
        image_speed = 0;
        speed = 0;
        active = false;
    }
    with (obj_gh_fireball_linear)
    {
        rate = 0;
        active = false;
    }
    with (obj_gh_fireball_mobius)
    {
        rate = 0;
        active = false;
    }
    with (obj_gh_fireball_hop)
    {
        rate = 0;
        active = false;
    }
    with (obj_gh_fireball_square)
    {
        store_spd = path_speed;
        path_speed = 0;
    }
}
linked_block = -4;
grazepoints = 0;
if (instance_number(object_index) > 1)
    polite = 2;
