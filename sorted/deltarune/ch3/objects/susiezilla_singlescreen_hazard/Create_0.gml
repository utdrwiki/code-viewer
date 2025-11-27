destroy_onhit = true;
unstoppable = false;
facing = 0;
change_sides = false;
friendly = false;
damage = 10;
knockback = 10;
draw_angle = 0;
bounce_off_dir = -100;
myxcenter = x;
myycenter = y;
myhitscale = 4;
force_depth = -999999;

bounce_off = function()
{
    with (instance_create_depth(x, y, depth, obj_dozer_parts))
    {
        sprite_index = other.sprite_index;
        image_angle = irandom(360);
        scr_lerpvar("image_angle", image_angle, image_angle + ((90 + irandom(270)) * choose(-1, 1)), 30 + irandom(60));
        image_speed = 0;
        image_index = 0;
        image_xscale = other.image_xscale;
        image_yscale = image_xscale;
        if (other.bounce_off_dir == -100)
            h_speed = (-sign(other.facing) * 1) + (random(5) * -sign(other.facing));
        else
            h_speed = other.bounce_off_dir + (random(5) * other.bounce_off_dir);
        v_speed = -4 - random(8);
        do_shadow = true;
        ground = other.y + 60;
    }
};
