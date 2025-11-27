if (!init)
{
    var pos = scr_heromarker(undefined, "prophecy");
    prophecy = instance_create(pos[0] + 150, pos[1] + 90, obj_dw_church_prophecy);
    prophecy.extflag = "musicalprophecybig";
    prophecy.musickind = 3;
    prophecyactive = false;
    prophecy.depth = curtain_rope.depth + 10;
    init = 1;
}
if (rope_pull)
{
    rope_pull_count++;
    sound_play(snd_wing);
    if (rope_pull_count == 1)
    {
        curtain_open = true;
        scr_lerp_instance_var(curtain_rope, "y", curtain_rope.ystart, curtain_rope.ystart + 40, 10, 3, "out");
    }
    else
    {
        curtain_open_more = true;
        scr_lerp_instance_var(curtain_rope, "y", curtain_rope.ystart + 40, curtain_rope.ystart + 80, 10, 3, "out");
    }
    rope_pull = false;
}
if (curtain_open)
{
    scr_lerp_var_instance(id, "curtain_x_pos", 300, 500, 20, 4, "out");
    scr_lerpvar("curtspace", curtspace, 34, 20, 4, "out");
    prophecyactive = true;
    curtain_open = false;
}
if (curtain_open_more)
{
    scr_lerp_var_instance(id, "curtain_x_pos", 500, 900, 60, 4, "out");
    scr_lerpvar("curtspace", curtspace, 30, 20, 4, "out");
    curtain_open_more = false;
}
with (obj_dw_church_prophecy)
{
    var pos = scr_heromarker(undefined, "prophecy");
    setxy(pos[0] + 190, pos[1] + 100);
    active = other.prophecyactive;
}
