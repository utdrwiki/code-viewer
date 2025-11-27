timer = 0;
side = -1;
aim_counter = 0;
type = 1;
if (obj_tenna_enemy.smashcutwithouttakingdamage == 1)
    type = 3;
sideprevious = -2;
target = 4;
damage = 4;
if (instance_exists(obj_tenna_enemy))
{
    instance_create(x, y, obj_tenna_smashcutter);
}
else
{
    scr_shakescreen();
    instance_create(0, 0, obj_tenna_smashcut_manager);
    snd_volume(snd_rumble, 0.5, 0);
    snd_loop(snd_rumble);
}
