if (i_ex(obj_battleblcon))
    exit;
scroll_timer++;
if (scroll_timer == 60)
{
    if (i_ex(obj_tenna_board4_enemy))
    {
        var battle_tenna = obj_tenna_board4_enemy.tenna_actor;
        with (battle_tenna)
            scr_lerpvar("x", x, camerax() + view_wport[0] + 200, 15, 2, "out");
    }
}
if (scroll_timer == 76)
    screen_active = true;
if (scroll_timer == 77)
{
    with (obj_tenna_board4_enemy)
        instance_destroy();
    snd_free(global.batmusic[0]);
    snd_volume(global.currentsong[1], 0, 0);
    snd_resume(global.currentsong[1]);
    snd_volume(global.currentsong[1], 1, 20);
    with (obj_battleback)
        destroy = 1;
    with (obj_monsterparent)
        instance_destroy();
    with (obj_bulletparent)
        instance_destroy();
    with (obj_heroparent)
        instance_destroy();
    with (obj_battlecontroller)
        instance_destroy();
}
if (scroll_timer == 80)
    room_goto(room_dw_backstage);
if (scroll_timer == 81)
    scr_lerpvar("screen_x_offset", screen_x_offset, screen_x_offset - 640, 30);
if (scroll_timer >= 171)
{
    if (battle_screenshot != -4)
        sprite_delete(battle_screenshot);
    screen_active = false;
    persistent = false;
    instance_destroy();
}
