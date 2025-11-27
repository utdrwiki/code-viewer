difficulty = 0;
grazed = 1;
grazepoints = 0;
instance_create(0, 0, obj_darkshape_light_aura);
image_alpha = 0;
scr_lerpvar("image_alpha", 0, 1, 30);
timer = 0;
depth = obj_growtangle.depth - 2;
hands_surface = surface_create(640, 480);
base_speed = 0.13;
base_angle_speed = 0.05;
counter = irandom(999);
counter_speed = 0;
angle_counter = irandom(999);
angle_counter_speed = 0;
scr_lerpvar("counter_speed", counter_speed, base_speed, 30);
scr_lerpvar("angle_counter_speed", counter_speed, choose(base_angle_speed, -base_angle_speed), 30);
hand_distance = 280;
hand_direction = 0;
wave_counter = 0;
hand_1 = scr_fire_bullet(x, y, obj_regularbullet, 0, 0, spr_titan_battle_hand);
hand_2 = scr_fire_bullet(x, y, obj_regularbullet, 0, 0, spr_titan_battle_hand);
hand_1_overload = -1;
hand_2_overload = -1;
hand_1.grazed = 1;
hand_2.grazed = 1;
hand_1.grazepoints = 0;
hand_2.grazepoints = 0;
with (hand_1)
{
    master = other.id;
    fingers_broken = 0;
    visible = false;
    image_index = 0;
    image_speed = 0;
    image_xscale = 2;
    image_yscale = -2;
    active = false;
    destroyonhit = false;
    wall_destroy = false;
    image_angle = 270;
    image_alpha = 0;
    scr_lerpvar("image_alpha", 0, 1, 30);
    scr_var_delay("active", true, 30);
    finger_1 = scr_fire_bullet(x, y, obj_titan_battle_finger, 0, 0);
    finger_2 = scr_fire_bullet(x, y, obj_titan_battle_finger, 0, 0);
    finger_3 = scr_fire_bullet(x, y, obj_titan_battle_finger, 0, 0);
    finger_4 = scr_fire_bullet(x, y, obj_titan_battle_finger, 0, 0);
    finger_1.master = id;
    finger_2.master = id;
    finger_3.master = id;
    finger_4.master = id;
    finger_1.grazed = 1;
    finger_2.grazed = 1;
    finger_3.grazed = 1;
    finger_4.grazed = 1;
    finger_1.grazepoints = 0;
    finger_2.grazepoints = 0;
    finger_3.grazepoints = 0;
    finger_4.grazepoints = 0;
    finger_1.break_store = "hand1_finger1";
    finger_2.break_store = "hand1_finger2";
    finger_3.break_store = "hand1_finger3";
    finger_4.break_store = "hand1_finger4";
    finger_1.depth = depth - 1;
    finger_2.depth = depth - 1;
    finger_3.depth = depth - 1;
    finger_4.depth = depth - 1;
    for (var aa = 0; aa < 8; aa++)
        finger_1.weak_off[aa] *= 0.75;
    for (var aa = 0; aa < 8; aa++)
        finger_3.weak_off[aa] *= 0.75;
    finger_1.weak_dist = 0;
    finger_2.weak_dist = 43;
    finger_3.weak_dist = 0;
    finger_4.weak_dist = 43;
    with (obj_titan_enemy)
    {
        var h1f1 = true;
        var h1f2 = true;
        var h1f3 = true;
        var h1f4 = true;
        if (variable_instance_exists(id, "hand1_finger1"))
        {
            if (hand1_finger1)
                h1f1 = false;
        }
        if (variable_instance_exists(id, "hand1_finger2"))
        {
            if (hand1_finger2)
                h1f2 = false;
        }
        if (variable_instance_exists(id, "hand1_finger3"))
        {
            if (hand1_finger3)
                h1f3 = false;
        }
        if (variable_instance_exists(id, "hand1_finger4"))
        {
            if (hand1_finger4)
                h1f4 = false;
        }
        if (h1f1 || h1f2 || h1f3 || h1f4)
        {
            if (!h1f1)
            {
                other.fingers_broken++;
                instance_destroy(other.finger_1);
            }
            if (!h1f2)
            {
                other.fingers_broken++;
                instance_destroy(other.finger_2);
            }
            if (!h1f3)
            {
                other.fingers_broken++;
                instance_destroy(other.finger_3);
            }
            if (!h1f4)
            {
                other.fingers_broken++;
                instance_destroy(other.finger_4);
            }
        }
        else
        {
            hand1_finger1 = false;
            hand1_finger2 = false;
            hand1_finger3 = false;
            hand1_finger4 = false;
        }
    }
}
with (hand_2)
{
    master = other.id;
    fingers_broken = 0;
    visible = false;
    image_index = 0;
    image_speed = 0;
    image_xscale = 2;
    image_yscale = 2;
    active = false;
    destroyonhit = false;
    wall_destroy = false;
    image_angle = 90;
    image_alpha = 0;
    scr_lerpvar("image_alpha", 0, 1, 30);
    scr_var_delay("active", true, 30);
    finger_1 = scr_fire_bullet(x, y, obj_titan_battle_finger, 0, 0);
    finger_2 = scr_fire_bullet(x, y, obj_titan_battle_finger, 0, 0);
    finger_3 = scr_fire_bullet(x, y, obj_titan_battle_finger, 0, 0);
    finger_4 = scr_fire_bullet(x, y, obj_titan_battle_finger, 0, 0);
    finger_1.master = id;
    finger_2.master = id;
    finger_3.master = id;
    finger_4.master = id;
    finger_1.grazed = 1;
    finger_2.grazed = 1;
    finger_3.grazed = 1;
    finger_4.grazed = 1;
    finger_1.grazepoints = 0;
    finger_2.grazepoints = 0;
    finger_3.grazepoints = 0;
    finger_4.grazepoints = 0;
    finger_1.break_store = "hand2_finger1";
    finger_2.break_store = "hand2_finger2";
    finger_3.break_store = "hand2_finger3";
    finger_4.break_store = "hand2_finger4";
    finger_1.depth = depth - 1;
    finger_2.depth = depth - 1;
    finger_3.depth = depth - 1;
    finger_4.depth = depth - 1;
    finger_1.image_yscale *= -1;
    finger_2.image_yscale *= -1;
    finger_3.image_yscale *= -1;
    finger_4.image_yscale *= -1;
    for (var aa = 0; aa < 8; aa++)
        finger_2.weak_off[aa] *= 0.75;
    for (var aa = 0; aa < 8; aa++)
        finger_4.weak_off[aa] *= 0.75;
    finger_1.weak_dist = 43;
    finger_2.weak_dist = 0;
    finger_3.weak_dist = 43;
    finger_4.weak_dist = 0;
    with (obj_titan_enemy)
    {
        var h2f1 = true;
        var h2f2 = true;
        var h2f3 = true;
        var h2f4 = true;
        if (variable_instance_exists(id, "hand2_finger1"))
        {
            if (hand2_finger1)
                h2f1 = false;
        }
        if (variable_instance_exists(id, "hand2_finger2"))
        {
            if (hand2_finger2)
                h2f2 = false;
        }
        if (variable_instance_exists(id, "hand2_finger3"))
        {
            if (hand2_finger3)
                h2f3 = false;
        }
        if (variable_instance_exists(id, "hand2_finger4"))
        {
            if (hand2_finger4)
                h2f4 = false;
        }
        if (h2f1 || h2f2 || h2f3 || h2f4)
        {
            if (!h2f1)
            {
                other.fingers_broken++;
                instance_destroy(other.finger_1);
            }
            if (!h2f2)
            {
                other.fingers_broken++;
                instance_destroy(other.finger_2);
            }
            if (!h2f3)
            {
                other.fingers_broken++;
                instance_destroy(other.finger_3);
            }
            if (!h2f4)
            {
                other.fingers_broken++;
                instance_destroy(other.finger_4);
            }
        }
        else
        {
            hand2_finger1 = false;
            hand2_finger2 = false;
            hand2_finger3 = false;
            hand2_finger4 = false;
        }
    }
}
alarm[0] = 30;

finger_vector = function(arg0, arg1 = id, arg2 = 0, arg3 = 0)
{
    arg0.x = arg1.x + lengthdir_x(arg3, arg1.image_angle) + lengthdir_x(arg2, arg1.image_angle + 90);
    arg0.y = arg1.y + lengthdir_y(arg3, arg1.image_angle) + lengthdir_y(arg2, arg1.image_angle + 90);
};

curl_fingers = function(arg0 = 0.5)
{
    with (hand_1)
    {
        with (finger_1)
            scr_var_delayed("image_speed", arg0, 2);
        with (finger_2)
            scr_var_delayed("image_speed", arg0, 4);
        with (finger_3)
            scr_var_delayed("image_speed", arg0, 6);
        with (finger_4)
            scr_var_delayed("image_speed", arg0, 8);
    }
    with (hand_2)
    {
        with (finger_1)
            scr_var_delayed("image_speed", arg0, 2);
        with (finger_2)
            scr_var_delayed("image_speed", arg0, 4);
        with (finger_3)
            scr_var_delayed("image_speed", arg0, 6);
        with (finger_4)
            scr_var_delayed("image_speed", arg0, 8);
    }
};

wibbly_bullets = function(arg0, arg1, arg2)
{
    with (scr_fire_bullet(arg0.x + lengthdir_x(arg2, image_angle + 180) + lengthdir_x(arg1, image_angle - 90), arg0.y + lengthdir_y(arg2, image_angle + 180) + lengthdir_y(arg1, image_angle - 90), obj_regularbullet, arg0.image_angle + irandom_range(-25, 25), 0, spr_wibblywobbly_dark_bullet))
    {
        grazed = 1;
        grazepoints = 0;
        damage = 90;
        target = 4;
        parent_id = arg0.id;
        image_speed = 0.5;
        scr_lerpvar("speed", 1, 2, 60);
        image_xscale = 0;
        image_yscale = 0;
        scr_lerpvar("image_xscale", 0, 2, 15, 1, "out");
        scr_lerpvar("image_yscale", 0, 2, 15, 1, "out");
    }
};

wibbly_bullets2 = function(arg0, arg1, arg2)
{
    with (scr_fire_bullet(arg0.x + lengthdir_x(arg2, image_angle) + lengthdir_x(arg1, image_angle + 90), arg0.y + lengthdir_y(arg2, image_angle) + lengthdir_y(arg1, image_angle + 90), obj_regularbullet, arg0.image_angle + irandom_range(-25, 25), 0, spr_wibblywobbly_dark_bullet))
    {
        grazed = 1;
        grazepoints = 0;
        damage = 90;
        target = 4;
        parent_id = arg0.id;
        image_speed = 0.5;
        scr_lerpvar("speed", 1, 2, 60);
        image_xscale = 0;
        image_yscale = 0;
        scr_lerpvar("image_xscale", 0, 2, 15, 1, "out");
        scr_lerpvar("image_yscale", 0, 2, 15, 1, "out");
    }
};

selfdestruct = function(arg0)
{
    if (arg0 == hand_1)
    {
        scr_lerpvar("hand_1_overload", 0, 1, 30);
        scr_lerpvar_instance(hand_1, "x", hand_1.x, hand_1.x + 80, 30, 3, "out");
    }
    if (arg0 == hand_2)
    {
        scr_lerpvar("hand_2_overload", 0, 1, 30);
        scr_lerpvar_instance(hand_2, "x", hand_2.x, hand_2.x - 80, 30, 3, "out");
    }
};
