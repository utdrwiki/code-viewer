event_inherited();

hide = function()
{
    if (!is_active)
        exit;
    is_active = false;
    visible = false;
    with (obj_mainchara)
        visible = true;
};

show = function()
{
    if (is_active)
        exit;
    is_active = true;
    visible = true;
    with (obj_mainchara)
    {
        visible = false;
        battlealpha = 0;
        battleheart.image_alpha = 0;
    }
};

battle_mode_start = function()
{
    if (battle_mode)
        exit;
    battle_mode = true;
    show();
    scr_lerp_var_instance(id, "battle_alpha", battle_alpha, 0.6, 15);
};

battle_mode_stop = function()
{
    if (!is_active)
        exit;
    is_active = false;
    scr_lerp_var_instance(id, "battle_alpha", battle_alpha, 0, 15);
    scr_delay_var("visible", false, 16);
    scr_delay_var("battle_mode", false, 16);
    with (obj_mainchara)
        scr_delay_var("visible", true, 16);
};
