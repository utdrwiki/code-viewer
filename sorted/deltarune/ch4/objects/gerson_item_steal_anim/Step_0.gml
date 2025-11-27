timer++;
if (timer == 3)
    sprite_index = spr_nothing;
if (timer == 13)
{
    sprite_index = spr_gerson_item_steal2;
    image_index = 0;
    direction = 270;
    speed = 4;
    friction = 0.4;
    x = (obj_gerson_item_throw.x - 96) + 6;
    y = obj_gerson_item_throw.y - 89;
    snd_stop(motor_swing_down);
    snd_play_pitch(motor_swing_down, 1.4);
}
if (timer == 15)
    image_speed = 0;
if (timer == 22)
{
    with (obj_gerson_item_throw)
        instance_destroy();
    with (obj_gerson_item_throw_particle)
        instance_destroy();
    snd_play(snd_item);
}
if (timer == 24)
{
    sprite_index = spr_gerson_item_steal2;
    image_index = 1;
    image_speed = 1;
    snd_stop(motor_swing_down);
    snd_play_pitch(motor_swing_down, 1.4);
}
if (timer == 25)
    sprite_index = spr_nothing;
if (timer == 31)
{
    x = obj_hammer_of_justice_enemy.x + 20 + 24;
    y = obj_hammer_of_justice_enemy.y - 30;
    sprite_index = spr_gerson_smear;
    image_index = 1;
    image_speed = 0;
}
if (timer == 32)
{
    x = (obj_hammer_of_justice_enemy.x - 10) + 24;
    y = obj_hammer_of_justice_enemy.y;
    snd_stop(motor_swing_down);
    snd_play_pitch(motor_swing_down, 1.4);
    sprite_index = spr_gerson_laugh;
    image_index = 0;
    image_speed = 0.25;
    direction = 180;
    speed = 2;
    friction = 0.2;
}
if (timer > 50 && !i_ex(obj_writer))
{
    if (con == 0)
    {
        with (obj_hammer_of_justice_enemy)
        {
            global.typer = 50;
            msgsetloc(0, "Woah there!&I ain't usin' items,&so fair's fair,&ain't it!?/%", "obj_gerson_item_steal_anim_slash_Step_0_gml_71_0");
            scr_enemyblcon(x - 10, global.monstery[myself], 10);
        }
        con = 1;
    }
    else if (con == 1)
    {
        instance_destroy();
    }
}
with (obj_spellphase)
    spelltimer = 290;
