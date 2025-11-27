pal_swap_set(spr_lw_church_palette, 2, false);
draw_sprite(bg_church_entrance_door_open, image_index, x, y);
pal_swap_reset();
if (is_cracked || is_open)
{
    var ballregionl = 310;
    var ballregionr = 330;
    var bally = 150;
    var timer_speed = 1;
    if (type == 2)
        bally = 100;
    if (is_cracked)
        bally = 100;
    if (is_open)
    {
        bally = 100;
        timer_speed = 0.2;
    }
    timer++;
    if (timer >= timer_speed)
    {
        timer = 0;
        var _y = is_open ? random_range(40, 100) : bally;
        var ball = scr_marker(random_range(ballregionl, ballregionr), _y, spr_ball);
        ball.image_blend = c_black;
        scr_doom(ball, 60);
        var randomscale = 0.3 + random(0.1);
        scr_lerpvar_instance(ball, "image_xscale", 0, randomscale, 10, -1, "out");
        scr_lerpvar_instance(ball, "image_yscale", 0, randomscale, 10, -1, "out");
        scr_lerpvar_instance(ball, "image_alpha", 0.4, 0, 60);
        ball.image_xscale = 0;
        ball.image_yscale = 0;
        ball.depth = depth - 100;
        var _gravity = is_open ? 0.1 : 0.2;
        ball.gravity = -_gravity;
        ball.friction = 0.1;
        var _range = is_open ? 6 : 3;
        ball.hspeed = random_range(-_range, _range);
    }
}
else
{
    var ballregionl = 310;
    var ballregionr = 330;
    var bally = 100;
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
