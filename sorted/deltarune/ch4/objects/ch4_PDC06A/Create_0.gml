con = -1;
customcon = 0;
leave_con = -1;
susie_hide = false;
susie_shadow = 0;
ralsei_hide = false;
ralsei_shadow = 0;
tape_npc = scr_dark_marker(652, 224, spr_cautiontape_ralsei_castle);
with (tape_npc)
    depth = 100000;
if (scr_flag_get(710) == 0)
{
    tape_readable = instance_create(673, 260, obj_readable_room1);
    with (tape_readable)
    {
        image_yscale = 5;
        if (scr_flag_get(1514) == 0)
            extflag = "tea_party_prompt";
        else
            extflag = "ralsei_room_prompt";
    }
    tape_collider = instance_create(665, 260, obj_solidblockDark);
    with (tape_collider)
        image_yscale = 3;
    door_marker = scr_dark_marker(440, 158, spr_dw_door_ralsei_open);
    door_marker.depth = 700000;
    door_marker.visible = 0;
}
else
{
    tape_npc.sprite_index = spr_cautiontape_ralsei_castle_broken;
    instance_destroy();
}
