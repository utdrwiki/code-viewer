if (is_cracked || is_open)
{
    var ballregionl = 153;
    var ballregionr = 182;
    var bally = 150;
    var timer_speed = 2;
    if (type == 2)
    {
        ballregionl = 290;
        ballregionr = 300;
        bally = 265;
    }
    if (is_cracked)
    {
        ballregionl = 290;
        ballregionr = 300;
        bally = 265;
    }
    if (is_open)
    {
        ballregionl = 280;
        ballregionr = 310;
        bally = 265;
        timer_speed = 0.5;
    }
    timer++;
    if (timer >= timer_speed)
    {
        timer = 0;
        var ball = scr_marker(random_range(ballregionl, ballregionr), bally, spr_ball);
        ball.image_blend = c_black;
        scr_doom(ball, 60);
        var randomscale = 0.3 + random(0.1);
        scr_lerpvar_instance(ball, "image_xscale", 0, randomscale, 10, -1, "out");
        scr_lerpvar_instance(ball, "image_yscale", 0, randomscale, 10, -1, "out");
        scr_lerpvar_instance(ball, "image_alpha", 0.4, 0, 60);
        ball.image_xscale = 0;
        ball.image_yscale = 0;
        ball.depth = 80000;
        ball.gravity = -0.2;
        ball.friction = 0.1;
        ball.hspeed = random_range(-3, 3);
    }
}
draw_self();
