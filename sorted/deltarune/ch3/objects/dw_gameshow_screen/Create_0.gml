screen_alpha = 1;
current_screen = 2980;
screen_state = "default";
current_screen_state = screen_state;
screen_sub_state = "";
screenwidth = view_wport[0] * 6;
screenheight = view_hport[0];
crttimer = 0;
crt_glitch = 0;
chromStrength = 0.25;
star_anim = 0;
star_anim_speed = 0.5;
bg_speed = 1;
bg_speed_y = 1;
bg_speed_max = 3;
bg_speed_y_max = 3;
star_bg_active = true;
screen_anim = 0;
screen_anim_speed = 0.2;
shakey_active = false;
shakey_x = 0;
shakey_y = 0;
shakey_siner = 0;
news_speed = 0;
news_speed_max = 3;
cancelled = false;
custom_text_timer = 0;
white_overlay = false;
white_overlay_alpha = 0;
round_text = "?";
rank_text = "?";
switch_game_screen = false;
switch_game_screen_timer = 0;
switch_game_screen_target = "round_complete";
evaluation_screen = instance_find(obj_round_evaluation, 0);
bonus_sprite = -4;
bonus_confirmed_sprite = -4;
bg_surface = -4;
siner = 0;
text_bonus = stringsetloc("BONUS", "obj_dw_gameshow_screen_slash_Create_0_gml_59_0");
text_bonus_round = stringsetloc("BONUS ROUND", "obj_dw_gameshow_screen_slash_Create_0_gml_60_0");
text_confirmed = stringsetloc("CONFIRMED", "obj_dw_gameshow_screen_slash_Create_0_gml_61_0");
text_round = stringsetloc("ROUND", "obj_dw_gameshow_screen_slash_Create_0_gml_62_0");
text_complete = stringsetloc("COMPLETE", "obj_dw_gameshow_screen_slash_Create_0_gml_63_0");
text_next = stringsetloc("NEXT:", "obj_dw_gameshow_screen_slash_Create_0_gml_64_0");
text_you_got = stringsetloc("YOU GOT", "obj_dw_gameshow_screen_slash_Create_0_gml_65_0");
text_tv_time = stringsetloc("TV TIME", "obj_dw_gameshow_screen_slash_Create_0_gml_66_0");
text_the_end = stringsetloc("THE END", "obj_dw_gameshow_screen_slash_Create_0_gml_67_0");
bonus_wiggle_timer = 0;
bonus_wiggle_speed = 1;
bonus_color_speed = 0.025;
_uniUV = 0;
_uniTime = 0;
_uniSpeed = 0;
_time = 0.025;
_speed = 0.75;

is_bg_active = function(arg0)
{
    var _logo_active_states = ["default", "tv_logo", "breaking", "board_bonus", "bonus_confirmed", "round_complete", "next_board_2", "round_complete_2", "board_bonus_bonus"];
    var _logo_active = false;
    for (var i = 0; i < array_length(_logo_active_states); i++)
    {
        if (arg0 == _logo_active_states[i])
        {
            _logo_active = true;
            break;
        }
    }
    return _logo_active;
};

is_logo_active = function(arg0)
{
    return arg0 == "tv_logo" || arg0 == "breaking";
};

transition_to_state = function(arg0, arg1)
{
    white_overlay = true;
    white_overlay_alpha = 1;
    var _letter_grade = evaluation_screen._lettergrade;
    rank_text = _letter_grade + "-" + stringsetloc("RANK", "obj_dw_gameshow_screen_slash_Create_0_gml_123_0");
    scr_lerpvar("white_overlay_alpha", 1, 0, arg1);
    screen_state = arg0;
    scr_var_delay("white_overlay", false, arg1 + 1);
};
