event_inherited();
digits = 1;
my_score = 0;
flip1 = false;
flip2 = false;
flip3 = false;
flip1_scale = 1;
flip2_scale = 1;
flip3_scale = 1;

score_change = function(arg0)
{
    var old_score1, old_score2, old_score3;
    switch (string_length(string(my_score)))
    {
        case 1:
            old_score1 = string_char_at(string(my_score), 1);
            old_score2 = -1;
            old_score3 = -1;
            break;
        case 2:
            old_score1 = string_char_at(string(my_score), 1);
            old_score2 = string_char_at(string(my_score), 2);
            old_score3 = -1;
            break;
        case 3:
            old_score1 = string_char_at(string(my_score), 1);
            old_score2 = string_char_at(string(my_score), 2);
            old_score3 = string_char_at(string(my_score), 3);
            break;
    }
    my_score += arg0;
    my_score = min(my_score, 999);
    var new_score1, new_score2, new_score3;
    switch (string_length(string(my_score)))
    {
        case 1:
            new_score1 = string_char_at(string(my_score), 1);
            new_score2 = -1;
            new_score3 = -1;
            break;
        case 2:
            new_score1 = string_char_at(string(my_score), 1);
            new_score2 = string_char_at(string(my_score), 2);
            new_score3 = -1;
            break;
        case 3:
            new_score1 = string_char_at(string(my_score), 1);
            new_score2 = string_char_at(string(my_score), 2);
            new_score3 = string_char_at(string(my_score), 3);
            break;
    }
    if ((old_score1 != new_score1 || old_score1 == -1) && !flip1)
    {
        flip1 = true;
        scr_lerpvar("flip1_scale", 1, 0, 3, 0);
        scr_script_delayed(scr_lerpvar, 3, "flip1_scale", 0, 1, 3, 0);
        scr_script_delayed(scr_var, 6, "flip1", false);
    }
    if ((old_score2 != new_score2 || old_score2 == -1) && !flip2)
    {
        flip2 = true;
        scr_lerpvar("flip2_scale", 1, 0, 3, 0);
        scr_script_delayed(scr_lerpvar, 3, "flip2_scale", 0, 1, 3, 0);
        scr_script_delayed(scr_var, 6, "flip2", false);
    }
    if ((old_score3 != new_score3 || old_score3 == -1) && !flip3)
    {
        flip3 = true;
        scr_lerpvar("flip3_scale", 1, 0, 3, 0);
        scr_script_delayed(scr_lerpvar, 3, "flip3_scale", 0, 1, 3, 0);
        scr_script_delayed(scr_var, 6, "flip3", false);
    }
};
