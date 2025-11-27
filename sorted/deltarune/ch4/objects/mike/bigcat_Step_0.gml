if (meowsnd == 1)
{
    meow = snd_play(snd_meow);
    sound_pitch(meow, 0.75);
    meowsnd = 2;
}
if (!place_meeting(x, y, obj_hand_collision))
    meowsnd = 0;
if (action == 0)
{
    x = scr_approach(x, xstart, 4);
    if (x == xstart)
        action = 1;
}
if (action == 1)
    happiness = scr_approach(happiness, 0, happiness_speed);
if (action == 2)
{
    x = scr_approach(x, oldx, 12);
    act = 0;
    if (x == oldx)
        instance_destroy();
}
xscale2 = 1 + (sin(current_time / 120) * 0.1);
yscale = 1 + (sin(32 + (current_time / 120)) * 0.1);
timer += 1;
if (act == 1)
{
    act = 2;
    timer = 0;
    xscale = scr_approach(xscale, 2, 0.01);
    image_yscale = scr_approach(image_yscale, 2, 0.01);
}
if (act == 2)
{
    xscale += ((xscale2 - xscale) * 0.9);
    image_yscale += ((yscale - image_yscale) * 0.9);
    if (timer > 30)
    {
        act = 0;
        timer = irandom_range(0, -120);
    }
}
if (action == 1)
{
    if (happiness <= 0 && act < 3)
    {
        act = 3;
        timer = 0;
        xscale = 1;
        image_yscale = 1;
        timer = 90;
    }
    if (act == 3)
    {
        image_blend = merge_color(c_white, c_red, timer / 90);
        timer += 1;
        if (timer >= 90)
        {
            var bullet_space = 25;
            var my_x = x + (56 * image_xscale);
            var my_y = y - 36;
            var my_dir = point_direction(my_x, my_y, obj_mike_controller.x, obj_mike_controller.y) - bullet_space;
            timer = 0;
            sound_play(snd_meow_angry);
            for (i = 0; i < 3; i++)
            {
                var ob = instance_create_depth(my_x, my_y, depth - 1, obj_mike_hairball);
                ob.speed = 5;
                ob.direction = my_dir;
                my_dir += bullet_space;
            }
        }
    }
}
if (act > 2)
    image_index = 1;
else
    image_index = 0;
