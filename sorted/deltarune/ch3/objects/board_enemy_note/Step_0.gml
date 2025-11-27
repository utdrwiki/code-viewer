if (place_meeting(x, y, obj_board_enemy_deer_ice_spell))
{
    instance_create(x, y, obj_board_enemydefeatsplash);
    snd_stop(snd_board_damage);
    snd_play(snd_board_damage);
    instance_destroy();
    exit;
}
timer++;
if (timer == 2)
{
    visible = true;
    snd_stop(snd_crow);
    snd_play_pitch(snd_crow, 0.95 + (irandom(35) / 100));
}
if (timer == 5)
    active_hitbox = true;
if (timer == 120)
    instance_destroy();
if (type == 1 && timer == 45)
    instance_destroy();
updatetimer++;
if (updatetimer == 3)
    updatetimer = 0;
else
    exit;
for (i = 5; i > 0; i -= 1)
{
    remx[i] = remx[i - 1];
    remy[i] = remy[i - 1];
}
remx[0] = x;
remy[0] = y;
x = savex + lengthdir_x(len, place);
y = savey + lengthdir_y(len, place);
place += place_speed;
len += len_speed;
