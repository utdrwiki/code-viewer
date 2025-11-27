function scr_spareanim()
{
    spareanim = instance_create(x, y, obj_spareanim);
    spareanim.sprite_index = sprite_index;
    spareanim.sprite_index = sparedsprite;
    spareanim.image_index = 0;
    spareanim.image_xscale = image_xscale;
    spareanim.image_yscale = image_yscale;
    if (global.chapter == 3 && i_ex(obj_tennabattleconvo_controller))
    {
        obj_tennabattleconvo_controller.enemyspared = true;
        snd_play(snd_crowd_ooh);
    }
}
