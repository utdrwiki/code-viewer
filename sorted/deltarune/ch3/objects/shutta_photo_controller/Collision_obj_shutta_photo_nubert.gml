if (state == "capture")
{
    array_push(subjects, other.id);
    if ((other.image_index >= 3 && other.sprite_index == spr_npc_nubert_appear) || (other.image_index < 4 && other.sprite_index == spr_npc_nubert_hide))
        endmessage = stringsetloc("* Great shot of Nubert!", "obj_shutta_photo_controller_slash_Collision_obj_shutta_photo_nubert_gml_7_0");
    else
        endmessage = stringsetloc("* Nubert was underground in that shot...", "obj_shutta_photo_controller_slash_Collision_obj_shutta_photo_nubert_gml_11_0");
    with (other)
    {
        con = 1;
        image_speed = 0;
    }
}
else
{
    with (other)
    {
        if (con == 0 && sprite_index != spr_npc_nubert_hide)
        {
            image_speed = 0.5;
            sprite_index = spr_npc_nubert_hide;
            image_index = 0;
        }
    }
}
