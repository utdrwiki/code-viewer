event_inherited();
gameshowblue = 15245824;
quizstring = "";
quiz_timer = 0;
quiz_intro = false;
quiz_ready = false;
quiz_display = false;
quiz_result = false;
quiz_index = 0;
quiz_question_list = [];
quiz_question_text = "";
quiz_answer_a = "";
quiz_answer_b = "";
question_visual = "none";
result_icon = 2416;
result_icon_index = 0;
word_scale_timer = 0;
word_max_scale = 9;
word_siner = false;
word_alpha = 1;
darkamt = 0;
countdown_timer = 0;
max_time = 90;
_is_paused = false;
answer_correct = "";
answer_selected = false;
answer_color = 16777215;
answer = "";
susie_select = false;
ralsei_select = false;
overlay = -4;
screen_anim = 0;
bullet_mode = false;
bullet_timer = 0;
bullet_max_time = 180;
bullet_screen_sprite = 4886;
bullet_screen_index = 0;
bullet_finish = false;
bullet_screen_list = [];
bullet_pos_list = [];
bullet_pos_index = 0;
bullet_con = 0;
shoot_sequence = false;
shoot_sequence_timer = 0;
current_screen_tile = -4;
shooter_list = [];
show_static_display = false;
image_xscale = 2;
image_yscale = 2;
tvheight = 40 * image_yscale;
tvwidth = 40 * image_xscale;

init_quiz = function(arg0)
{
    mode = 1;
    tvbasesprite = spr_dw_teevie_tv_base_thin;
    quiz_intro = true;
    quiz_question_list = scr_teevie_quiz(arg0);
};

display_next_question = function()
{
    var _current_question = quiz_question_list[quiz_index];
    quiz_question_text = _current_question.question_text;
    quiz_answer_a = _current_question.answer_a;
    quiz_answer_b = _current_question.answer_b;
    answer_correct = _current_question.correct_answer;
    max_time = _current_question.max_time_limit;
    question_visual = _current_question.question_visual;
    quiz_result = false;
    answer_selected = false;
    countdown_timer = max_time;
    answer = "";
    answer_color = 16777215;
    _is_paused = false;
    susie_select = false;
    ralsei_select = false;
    quiz_ready = true;
    quiz_timer = 0;
    quiz_index++;
};

can_continue_quiz = function()
{
    return quiz_index < array_length_1d(quiz_question_list);
};

select_char = function(arg0)
{
    answer = arg0;
    answer_selected = true;
    answer_color = 65535;
    pause();
    alarm[0] = 60;
};

darken_screen = function()
{
    overlay = scr_dark_marker(camerax() - 40, cameray() - 40, spr_pixel_white);
    overlay.image_xscale = 999;
    overlay.image_yscale = 999;
    overlay.depth = depth + 10;
    overlay.image_blend = c_black;
    overlay.image_alpha = 0;
    scr_lerp_instance_var(overlay, "image_alpha", 0, 0.75, 15);
    with (obj_dw_ch3_teevie_floor_light_controller)
        pause_lights();
};

hide_overlay = function()
{
    scr_lerp_instance_var(overlay, "image_alpha", overlay.image_alpha, 0, 15);
    scr_doom(overlay, 20);
    with (obj_dw_ch3_teevie_floor_light_controller)
        unpause_lights();
};

pause = function()
{
    _is_paused = true;
};

validate_answer = function()
{
    result_icon = (answer == answer_correct) ? 2416 : 4886;
    quiz_result = true;
};

show_static = function()
{
    snd_stop(snd_tv_static);
    snd_play(snd_tv_static);
    show_static_display = true;
};

hide_static = function()
{
    snd_stop(snd_tv_static);
    show_static_display = false;
};

end_quiz = function()
{
    snd_stop(snd_tv_static);
    scr_lerpvar("image_alpha", image_alpha, 1, 5);
    hide_overlay();
    mode = 0;
    tvbasesprite = spr_dw_teevie_tv_base;
    with (obj_darkcontroller)
        charcon = 0;
};

start_bullets = function()
{
    bullet_mode = true;
    bullet_timer = 0;
    bullet_finish = false;
    shooter_list = [];
    bullet_screen_list = [];
    for (var i = 0; i < width; i++)
    {
        for (var j = 0; j < height; j++)
            bullet_screen_list[i][j] = 4886;
    }
};

generate_faces = function()
{
    bullet_pos_list = [];
    bullet_pos_index = 0;
    var face_count = 0;
    var max_face_count = 12;
    while (face_count < max_face_count)
    {
        var random_i = floor(random(width));
        var random_j = floor(random(height));
        var _tile_pos = new Vector2(random_i, random_j);
        var _exists = false;
        for (var i = 0; i < array_length_1d(bullet_pos_list); i++)
        {
            if (bullet_pos_list[i].x == _tile_pos.x && bullet_pos_list[i].y == _tile_pos.y)
            {
                _exists = true;
                break;
            }
        }
        if (!_exists)
        {
            bullet_pos_list[array_length_1d(bullet_pos_list)] = _tile_pos;
            face_count++;
            if (face_count >= max_face_count)
                break;
        }
    }
};

is_bullet_finished = function()
{
    return bullet_finish;
};
