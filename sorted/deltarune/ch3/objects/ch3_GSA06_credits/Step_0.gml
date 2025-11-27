if (text_scroll)
{
    text_scroll_timer++;
    if (text_scroll_timer == 1)
        scr_lerp_var_instance(blackall, "image_alpha", 0, 0.5, 30 / credits_speed);
    if (text_scroll_timer >= (80 / credits_speed))
        y_pos_base = scr_movetowards(y_pos_base, cameray() + 80, 1.5 * credits_speed);
}
if (text_kick)
{
    text_kick = false;
    text_scroll = false;
    scr_lerpvar("text_angle", text_angle, 20, 2.5);
    scr_lerpvar("x_pos", x_pos, camerax() - 260, 15);
    scr_lerpvar("y_pos_base", y_pos_base, cameray() - 260, 5);
}
if (credits_stop)
{
    credits_stop = false;
    text_scroll = false;
    scr_lerp_var_instance(blackall, "image_alpha", 0.5, 0, 15);
}
if (word_mode)
{
    if (credits_mode)
        credits_mode = false;
    if (rouxls_mode)
        credits_mode = false;
    if (blackall.image_alpha == 0)
    {
        blackall.image_blend = c_white;
        blackall.image_alpha = 1;
    }
}
if (rouxls_mode)
{
    if (credits_mode)
        credits_mode = false;
    if (word_mode)
        credits_mode = false;
    if (blackall.image_alpha == 0)
    {
        blackall.image_blend = c_white;
        blackall.image_alpha = 1;
    }
}
