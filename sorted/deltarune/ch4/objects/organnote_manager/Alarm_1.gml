var v_pos;
if (sameattacker == 0)
    v_pos = scr_get_box(1) - 40;
else
    v_pos = scr_get_box(3) + 40;
if (bullet_counter < ds_list_size(origin_list))
{
    special = choose(-3, -2, -1, 0, 1, 2);
    with (scr_fire_bullet(creatorid.x, creatorid.y, obj_regularbullet, 0, 0, spr_musical_notes))
    {
        sprite_index = spr_musical_notes;
        image_index = ds_list_find_value(other.origin_list, other.bullet_counter);
        image_speed = 0;
        damage = other.damage;
        target = other.target;
        grazepoints = 8;
        scr_lerpvar("x", x, (scr_get_box(2) - 20) + (20 * ds_list_find_value(other.gap_list, other.bullet_counter)), 12, 0, "out");
        scr_lerpvar("y", y, v_pos + (10 * other.special), 12, -3, "out");
        active = false;
        ds_list_add(other.bullet_list, id);
        if (other.special == -3)
            snd_play(snd_organikk_note_f);
        if (other.special == -2)
            snd_play(snd_organikk_note_e);
        if (other.special == -1)
            snd_play(snd_organikk_note_d);
        if (other.special == 0)
            snd_play(snd_organikk_note_c);
        if (other.special == 1)
            snd_play(snd_organikk_note_b);
        if (other.special == 2)
            snd_play(snd_organikk_note_a);
    }
    bullet_counter++;
    if (repeating)
        alarm[1] = 2;
    else
        alarm[1] = 3;
}
else
{
    ds_list_shuffle(bullet_list);
    if (repeating)
        alarm[2] = 1;
    else
        alarm[2] = 12;
}
