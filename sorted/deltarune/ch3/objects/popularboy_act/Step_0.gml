timer++;
if (timer <= 30)
{
    spotlight1_len = lerp(100, 0, timer / 30);
    spotlight2_len = lerp(100, 0, timer / 30);
    spotlight1_angle = lerp(0, 180, timer / 30);
    spotlight2_angle = lerp(-180, 0, timer / 30);
}
var alphaset = 0;
if (timer < 10)
    alphaset = lerp(0, 1, timer / 10);
else
    alphaset = 1;
spotlightmarker1.x = ralseix + lengthdir_x(spotlight1_len, spotlight1_angle);
spotlightmarker1.y = ralseiy + lengthdir_y(spotlight1_len, spotlight1_angle);
spotlightmarker1.image_alpha = 0.6 * alphaset;
spotlightmarker2.x = ralseix + lengthdir_x(spotlight2_len, spotlight2_angle);
spotlightmarker2.y = ralseiy + lengthdir_y(spotlight2_len, spotlight2_angle);
spotlightmarker2.image_alpha = 0.6 * alphaset;
if (timer == 50)
{
    repeat (26)
    {
        puff = instance_create((ralseix - 60) + irandom(80), ralseiy + 90 + irandom(100), obj_animation);
        puff.depth = depth - 1;
        puff.sprite_index = spr_susiezilla_houseexplosion;
        puff.image_speed = 0.5;
        puff.image_xscale = 1;
        puff.image_yscale = 1;
    }
    with (obj_heroralsei)
    {
        normalsprite = spr_gameshow_drowningRalsei_ralsei_origin_edit;
        idlesprite = spr_gameshow_drowningRalsei_ralsei_origin_edit;
        defendsprite = spr_gameshow_drowningRalsei_ralsei_origin_edit;
        hurtsprite = spr_gameshow_drowningRalsei_ralsei_origin_edit;
        attackreadysprite = spr_gameshow_drowningRalsei_ralsei_origin_edit;
        attacksprite = spr_gameshow_drowningRalsei_ralsei_origin_edit;
        itemsprite = spr_gameshow_drowningRalsei_ralsei_origin_edit;
        itemreadysprite = spr_gameshow_drowningRalsei_ralsei_origin_edit;
        spellreadysprite = spr_gameshow_drowningRalsei_ralsei_origin_edit;
        spellsprite = spr_gameshow_drowningRalsei_ralsei_origin_edit;
        defeatsprite = spr_gameshow_drowningRalsei_ralsei_origin_edit;
        victorysprite = spr_gameshow_drowningRalsei_ralsei_origin_edit;
        actreadysprite = spr_gameshow_drowningRalsei_ralsei_origin_edit;
        actsprite = spr_gameshow_drowningRalsei_ralsei_origin_edit;
    }
    obj_tenna_enemy.resetralsei = true;
    with (obj_tenna_enemy.ralseiplushmarker)
        scr_shakeobj();
    snd_play(snd_audience_aww);
    with (spotlightmarker1)
        instance_destroy();
    with (spotlightmarker2)
        instance_destroy();
    instance_destroy();
}
