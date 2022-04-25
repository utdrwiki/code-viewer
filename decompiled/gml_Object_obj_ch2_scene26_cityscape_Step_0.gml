if fade_away
{
    if (main_alpha > 0)
        main_alpha -= 0.1
    else
    {
        fade_away = 0
        beam_offset = 0
        show_laser_outline = 0
        show_laser_beam = 0
    }
}
if show_lightners
{
    show_lightners = 0
    kris_screen = instance_create((camerax() + screen_offset), (cameray() + 80), obj_queenscreen)
    kris_screen.image_index = 38
    kris_screen.aligned = 1
    sus_screen = instance_create((camerax() + (screen_offset * 2)), (cameray() + 80), obj_queenscreen)
    sus_screen.image_index = 39
    sus_screen.aligned = 1
    no_screen = instance_create((camerax() + (screen_offset * 3)), (cameray() + 80), obj_queenscreen)
    no_screen.image_index = 7
    no_screen.aligned = 1
}
if merge_lightners
{
    make_new = 1
    merge_lightners = 0
    beam_offset = 0
    with (kris_screen)
        scr_move_to_point_over_time(other.sus_screen.x, other.sus_screen.y, other.merge_timer)
    with (no_screen)
        scr_move_to_point_over_time(other.sus_screen.x, other.sus_screen.y, other.merge_timer)
}
if make_new
{
    merge_timer--
    if (merge_timer <= 0)
    {
        make_new = 0
        fade_screens = 1
        show_mini_fountains = 0
        main_alpha = 1
        beam_offset = 0
        show_laser_beam = 1
        show_laser_outline = 1
    }
}
if fade_screens
{
    screen_alpha -= 0.1
    with (obj_queenscreen)
        image_alpha = other.screen_alpha
    if (screen_alpha <= 0)
    {
        fade_screens = 0
        with (obj_queenscreen)
            instance_destroy()
    }
}
if show_hands
{
    if (!hand_init)
    {
        hand_init = 1
        hand_right_xpos = (camerax() + view_wport[0])
    }
    if hand_both_reveal
    {
        hand_right_xpos = lerp(hand_right_xpos, ((camerax() + (view_wport[0] / 2)) + 60), 0.2)
        if (hand_right_xpos <= ((camerax() + (view_wport[0] / 2)) + 60))
        {
            hand_both_reveal = 0
            hand_both_reveal_finish = 1
        }
    }
    if knife_reveal
    {
        knife_alpha = lerp(knife_alpha, 1, 0.2)
        knife_ypos = lerp(knife_ypos, 10, 0.2)
        if (knife_ypos >= 9)
        {
            knife_reveal = 0
            knife_hover = 1
        }
    }
    if knife_hover
    {
        knife_siner += 0.075
        knife_ypos = (10 + (sin((knife_siner / 0.65)) * 5))
    }
    if knife_stab
    {
        knife_hover = 0
        stab_timer += 0.05
        knife_ypos = lerp_ease_ext(knife_ypos, 200, 1, 0, stab_timer, -1)
        if (stab_timer >= 0.5 && (!hand_retreat))
            hand_retreat = 1
        if (stab_timer >= 1)
        {
            stab_timer = 0
            knife_stab = 0
            show_laser_beam = 1
        }
    }
    if hand_retreat
    {
        retreat_timer += 0.05
        hand_right_xpos = lerp_ease_ext(hand_right_xpos, (camerax() + view_wport[0]), 1, 0, retreat_timer, 4)
        if (retreat_timer >= 1)
        {
            retreat_timer = 0
            hand_retreat = 0
            show_hands = 0
        }
    }
}
