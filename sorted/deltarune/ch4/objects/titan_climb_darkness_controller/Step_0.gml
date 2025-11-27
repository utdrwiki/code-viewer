if (!is_active)
    exit;
timer--;
if (timer <= 0)
{
    timer = 60;
    var left_threshold = random_range(camerax() - 40, (camerax() + (view_wport[0] / 2)) - 80);
    var right_threshold = random_range(camerax() + (view_wport[0] / 2) + 80, camerax() + view_wport[0] + 40);
    var x_pos = choose(left_threshold, right_threshold);
    var ball = instance_create(x_pos, cameray() + view_hport[0], obj_titan_climb_darkness);
    with (ball)
    {
        radius = choose(2, 4, 6);
        depth = 9000;
        vspeed = choose(-1.5, -2.5);
        scr_lerpvar("radius", radius, radius + 10, 180, 3, "in");
    }
}
