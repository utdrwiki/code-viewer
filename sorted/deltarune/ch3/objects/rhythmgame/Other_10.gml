if (replayversion && !tenna_boss)
{
    global.interact = 1;
    if (!i_ex(obj_minigame_quit_ui))
        instance_create(x, y, obj_minigame_quit_ui);
}
intro_con = 2;
y = 0;
loadsong = 1;
bg_con = 1;
image_blend = c_white;
floor_color = #24396D;
fade = 1;
with (performer)
    silhouette = false;
with (obj_rhythmgame_chart)
{
    with (performer)
        silhouette = false;
}
if (freeplay == -1)
    freeplay = 1;
if (freeplay == -2)
    freeplay = 0;
if (freeplay)
    difficulty = 5;
if (freeplay == 1 && hardmode)
{
    leniency = 1;
    bonus = 10;
}
else
{
    leniency = 1.6;
    bonus = 0;
}
fame = 6000;
total_fame = 6000;
max_score = 25000;
points = 0;
max_combo = 0;
combo = 0;
looptimer = 0;
trackpos = 0;
effects.con = 2;
show_chart = 1;
if (tutorial == 0 && !tenna_boss)
    button_alpha = 9;
