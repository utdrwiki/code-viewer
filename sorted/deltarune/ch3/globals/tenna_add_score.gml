function scr_tenna_add_score(arg0)
{
    if (i_ex(obj_tenna_enemy_bg))
    {
        var _multiplier = 1;
        var _multi_minigame_adjustment = 1;
        if (obj_tenna_enemy.minigameactivated)
        {
            if (obj_tenna_enemy.minigamecount >= 6)
                _multi_minigame_adjustment = 0.65;
            _multiplier = (obj_tenna_enemy.pointsmultiplierthisturn + obj_tenna_enemy.pointsmultiplier) * _multi_minigame_adjustment;
            obj_tenna_enemy.pointsmultiplierthisturn -= 1;
            if (obj_tenna_enemy.pointsmultiplierthisturn < 1)
                obj_tenna_enemy.pointsmultiplierthisturn = 1;
        }
        if (!i_ex(obj_tenna_zoom))
            obj_tenna_enemy_bg.addscore += round(arg0 * _multiplier);
        else if (i_ex(obj_tenna_minigame_ui))
            obj_tenna_minigame_ui.myscore += round(arg0 * _multiplier);
    }
}
