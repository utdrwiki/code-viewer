if (type == 0)
{
    timer++;
    var smokeamount = 0;
    if (i_ex(obj_mainchara))
    {
        var _room_width = room_width;
        var _offset = 400;
        smokeamount = clamp((obj_mainchara.x - _offset) / _room_width, 0, 1);
    }
    depth = 5000;
}
if (type == 1 || type == 2)
{
    if (init == 0)
        init = 1;
    depth = 400000;
    var ballregionl = 153;
    var ballregionr = 182;
    var bally = 150;
    if (type == 1)
    {
        draw_set_color(c_black);
        ossafe_fill_rectangle(153, 142, 182, 189, false);
    }
    if (type == 2)
    {
        ballregionl = 300;
        ballregionr = 330;
        bally = 100;
    }
    timer++;
    if (timer >= 4)
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
        ball.depth = 300000;
        ball.gravity = -0.2;
        ball.friction = 0.1;
        ball.hspeed = random_range(-3, 3);
    }
}
