global.interact = 2
if (global.flag[9] == 1)
    snd_volume_ch1(global.currentsong[1], 0, 20)
scr_encountersetup_ch1(global.encounterno)
with (obj_mainchara_ch1)
    visible = false
with (global.cinstance[0])
    visible = false
with (global.cinstance[1])
    visible = false
count = 0
c[0] = scr_dark_marker_ch1(obj_mainchara_ch1.x, obj_mainchara_ch1.y, spr_krisr_dark_ch1)
if instance_exists(global.cinstance[0])
{
    count += 1
    c[1] = scr_dark_marker_ch1(global.cinstance[0].x, global.cinstance[0].y, global.cinstance[0].rsprite)
    if (global.cinstance[0].rsprite == spr_susier_dark_ch1)
        c[1].sprite_index = spr_susier_wall_ch1
}
if instance_exists(global.cinstance[1])
{
    count += 1
    c[2] = scr_dark_marker_ch1(global.cinstance[1].x, global.cinstance[1].y, global.cinstance[1].rsprite)
    if (global.cinstance[1].rsprite == spr_susier_dark_ch1)
        c[2].sprite_index = spr_susier_wall_ch1
}
for (i = 0; i < (count + 1); i += 1)
{
    c[i].direction = point_direction(c[i].x, c[i].y, global.heromakex[i], global.heromakey[i])
    c[i].speed = (point_distance(c[i].x, c[i].y, global.heromakex[i], global.heromakey[i]) / 10)
    c[i].depth = (200 - (i * 20))
}
fightcon = 1
counttimer = 0
