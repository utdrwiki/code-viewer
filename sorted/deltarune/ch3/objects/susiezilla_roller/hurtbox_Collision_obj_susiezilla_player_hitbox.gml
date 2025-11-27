/// Decompiler warnings:
// gml_Object_obj_susiezilla_roller_hurtbox_Collision_obj_susiezilla_player_hitbox: Data left over on VM stack at end of fragment (1 elements).

with (parent_id)
{
    if (!reflected)
    {
        obj_susiezilla.hitstun = 3;
        reflected = true;
        con = 1;
        speed = 0;
        if (obj_susiezilla.image_xscale > 0)
            px = 12;
        else
            px = -12;
        snd_stop(snd_damage);
        snd_play(snd_damage);
    }
}
event_user(0);
