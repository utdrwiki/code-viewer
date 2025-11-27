if (con < 0)
    exit;
if (con == 0 && global.interact == 0 && abs((quiz_screen.x + 220) - obj_mainchara.x) < 20 && obj_mainchara.y >= quiz_screen.y && obj_mainchara.y < (quiz_screen.y + 320))
{
    con = 1;
    global.interact = 1;
    scr_flag_set(7, 1);
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(kr);
    c_facing("u");
    c_sel(su);
    c_facing("u");
    c_sel(ra);
    c_facing("u");
    c_pannable(1);
    c_pan(quiz_screen.x - 80, quiz_screen.y - 40, 8);
    c_var_instance(id, "quiz_start", true);
    c_wait(30);
    c_var_instance(id, "quiz_display", true);
    c_snd_play(snd_jump);
    c_sel(kr);
    c_autowalk(0);
    c_jump_sprite(base_x_pos + 220, base_y_pos + 232, 20, 15, spr_kris_jump_ball, spr_krisu_dark);
    c_sel(su);
    c_autowalk(0);
    c_jump_sprite(base_x_pos + 15, base_y_pos + 215, 20, 15, spr_susie_dw_jump_ball, spr_susie_walk_up_dw);
    c_sel(ra);
    c_autowalk(0);
    c_jump_sprite(base_x_pos + 420, base_y_pos + 220, 20, 15, spr_ralsei_jump_ball, spr_ralsei_walk_up);
    c_wait(20);
    c_var_instance(id, "show_spikes", true);
    c_var_instance(id, "show_buttons", true);
    c_wait(20);
    c_wait_if(quiz_screen, "quiz_display", "=", true);
    c_var_instance(id, "regain_control", true);
    c_waitcustom();
}
if (correct_answer && customcon == 1)
{
    correct_answer = false;
    customcon = 0;
    c_waitcustom_end();
    c_wait(60);
    c_snd_play(snd_won);
    c_sel(kr);
    c_sprite(spr_kris_pose);
    c_sel(su);
    c_sprite(spr_susie_pose);
    c_sel(ra);
    c_sprite(spr_ralsei_pose);
    c_wait(30);
    c_snd_play(snd_wing);
    c_sel(kr);
    c_autowalk(0);
    c_facing("u");
    c_var_lerp_to_instance(kr_actor, "x", base_x_pos + 220, 10, 3, "out");
    c_var_lerp_to_instance(kr_actor, "y", base_y_pos + 232, 10, 3, "out");
    c_sel(su);
    c_autowalk(0);
    c_facing("u");
    c_var_lerp_to_instance(su_actor, "x", base_x_pos + 15, 10, 3, "out");
    c_var_lerp_to_instance(su_actor, "y", base_y_pos + 215, 10, 3, "out");
    c_sel(ra);
    c_autowalk(0);
    c_facing("u");
    c_var_lerp_to_instance(ra_actor, "x", base_x_pos + 420, 10, 3, "out");
    c_var_lerp_to_instance(ra_actor, "y", base_y_pos + 220, 10, 3, "out");
    if (room == room_dw_teevie_maze_quiz)
        c_wait(15);
    else
        c_wait(30);
    if (quiz_screen.can_continue_quiz())
    {
        c_var_instance(id, "quiz_static_show", true);
        c_wait(15);
        c_var_instance(id, "quiz_static_hide", true);
        c_var_instance(id, "quiz_display", true);
        c_var_instance(id, "regain_control", true);
    }
    else
    {
        c_var_instance(id, "quiz_static_show", true);
        c_wait(15);
        c_var_instance(id, "quiz_complete", true);
    }
    c_waitcustom();
}
if (wrong_answer && customcon == 1)
{
    wrong_answer = false;
    customcon = 0;
    c_waitcustom_end();
    c_snd_play(snd_error);
    c_sel(su);
    c_sprite(spr_susie_shock_r);
    c_sel(ra);
    c_sprite(spr_ralsei_shocked_left);
    if (room == room_dw_teevie_maze_quiz)
        c_wait(15);
    else
        c_wait(45);
    if (abs(abs(kr_actor.x) - abs(base_x_pos + 220)) > 10)
        c_snd_play(snd_wing);
    c_sel(kr);
    c_autowalk(0);
    c_facing("u");
    c_var_lerp_to_instance(kr_actor, "x", base_x_pos + 220, 10, 3, "out");
    c_var_lerp_to_instance(kr_actor, "y", base_y_pos + 232, 10, 3, "out");
    c_sel(su);
    c_autowalk(0);
    c_facing("u");
    c_var_lerp_to_instance(su_actor, "x", base_x_pos + 15, 10, 3, "out");
    c_var_lerp_to_instance(su_actor, "y", base_y_pos + 215, 10, 3, "out");
    c_sel(ra);
    c_autowalk(0);
    c_facing("u");
    c_var_lerp_to_instance(ra_actor, "x", base_x_pos + 420, 10, 3, "out");
    c_var_lerp_to_instance(ra_actor, "y", base_y_pos + 220, 10, 3, "out");
    c_wait(10);
    c_var_instance(id, "quiz_bullets", true);
    c_waitcustom();
}
if (quiz_bullets)
{
    if (customcon == 1)
    {
        customcon = 0;
        hide_kris_actor();
        with (quiz_screen)
            start_bullets();
    }
    else if (quiz_screen.is_bullet_finished())
    {
        if (quiz_bullets_con == 0)
        {
            global.interact = 1;
            quiz_bullets_con = 1;
            quiz_static_show = true;
            show_kris_actor();
            scr_lerp_instance_var(kr_actor, "x", kr_actor.x, base_x_pos + 220, 10, 3, "out");
            scr_lerp_instance_var(kr_actor, "y", kr_actor.y, base_y_pos + 232, 10, 3, "out");
            scr_var_delay("quiz_bullets_con", 2, 16);
        }
        if (quiz_bullets_con == 2)
        {
            quiz_bullets_con = 0;
            quiz_bullets = false;
            customcon = 1;
            quiz_static_hide = true;
            if (quiz_screen.can_continue_quiz())
            {
                quiz_display = true;
                regain_control = true;
            }
            else
            {
                show_kris_actor();
                quiz_complete = true;
            }
        }
    }
}
if (quiz_complete && customcon == 1)
{
    quiz_complete = false;
    customcon = 0;
    con = 99;
    global.facing = 0;
    c_waitcustom_end();
    c_var_instance(id, "hide_spikes", true);
    c_var_instance(id, "hide_buttons", true);
    c_var_instance(id, "hide_overlay", true);
    c_snd_play(snd_jump);
    c_sel(kr);
    c_autowalk(0);
    c_facing("u");
    c_sel(su);
    c_autowalk(0);
    c_facing("u");
    c_sel(ra);
    c_autowalk(0);
    c_facing("u");
    c_sel(kr);
    c_jump_sprite(base_x_pos + 271, base_y_pos + 232, 20, 15, spr_kris_jump_ball, spr_krisu_dark);
    c_sel(su);
    c_jump_sprite(base_x_pos + 210, base_y_pos + 215, 20, 15, spr_susie_dw_jump_ball, spr_susie_walk_up_dw);
    c_sel(ra);
    c_jump_sprite(base_x_pos + 167, base_y_pos + 220, 20, 15, spr_ralsei_jump_ball, spr_ralsei_walk_up);
    c_wait(20);
    c_var_instance(id, "quiz_finish", true);
    c_pannable(1);
    c_panobj(kr_actor, 15);
    c_wait(15);
    c_pannable(0);
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 99 && !i_ex(obj_cutscene_master))
{
    con = -1;
    global.interact = 0;
    global.facing = 0;
    scr_flag_set(7, 0);
    with (obj_caterpillarchara)
        scr_caterpillar_interpolate();
}
if (quiz_start)
{
    quiz_start = false;
    var _id = quiz_id;
    with (quiz_screen)
        init_quiz(_id);
}
if (quiz_ready)
{
    quiz_ready = false;
    with (quiz_screen)
        quiz_ready = true;
}
if (quiz_display)
{
    quiz_display = false;
    reset_button_tiles();
    with (quiz_screen)
        display_next_question();
}
if (quiz_static_show)
{
    quiz_static_show = false;
    with (quiz_screen)
        show_static();
}
if (quiz_static_hide)
{
    quiz_static_hide = false;
    with (quiz_screen)
        hide_static();
}
if (quiz_finish)
{
    quiz_finish = false;
    scr_flag_set(quiz_flag, 1);
    with (quiz_screen)
        end_quiz();
}
if (regain_control)
{
    if (quiz_screen.quiz_display)
    {
        regain_control = false;
        press_wait = true;
        hide_kris_actor();
    }
}
if (press_wait)
{
    var time_up = quiz_screen.countdown_timer <= 0;
    if (time_up)
    {
        press_wait = false;
        show_kris_actor();
        scr_delay_var("wrong_answer", true, 30);
    }
    else
    {
        var _is_pressed = false;
        var _selected_char = -1;
        for (var i = 0; i < array_length_1d(button_tiles_player); i++)
        {
            _is_pressed = button_tiles_player[i].is_pressed;
            if (_is_pressed)
            {
                _selected_char = button_tiles_player[i].char_string;
                break;
            }
        }
        if (_is_pressed)
        {
            press_wait = false;
            show_kris_actor();
            var _susie_delay = 6;
            var _ralsei_delay = 2;
            caterpillar_press_button(su_actor, _selected_char, _susie_delay);
            caterpillar_press_button(ra_actor, _selected_char, _ralsei_delay);
            with (quiz_screen)
            {
                select_char(_selected_char);
                scr_delay_var("susie_select", true, _susie_delay);
                scr_delay_var("ralsei_select", true, _ralsei_delay);
            }
            if (_selected_char == quiz_screen.answer_correct)
                correct_answer = true;
            else
                scr_delay_var("wrong_answer", true, 60);
        }
    }
}
if (show_spikes)
{
    show_spikes = false;
    for (var i = 0; i < array_length_1d(spikes); i++)
    {
        with (spikes[i])
            show_tiles();
    }
}
if (hide_spikes)
{
    hide_spikes = false;
    for (var i = 0; i < array_length_1d(spikes); i++)
    {
        with (spikes[i])
            hide_tiles();
    }
}
if (show_buttons)
{
    show_buttons = false;
    show_button_tiles();
}
if (hide_buttons)
{
    hide_buttons = false;
    hide_button_tiles();
}
