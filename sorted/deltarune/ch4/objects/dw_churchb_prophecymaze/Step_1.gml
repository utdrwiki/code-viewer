if (!followerinit)
{
    var elements = layer_get_all_elements("FOLLOWER_SPRITES");
    for (var i = 0; i < array_length(elements); i++)
    {
        if (layer_get_element_type(elements[i]) == 4)
        {
            var sprite = layer_sprite_get_sprite(elements[i]);
            var xloc = scr_even(layer_sprite_get_x(elements[i]));
            var yloc = scr_even(layer_sprite_get_y(elements[i]));
            var xscale = layer_sprite_get_xscale(elements[i]);
            var yscale = layer_sprite_get_yscale(elements[i]);
            var mark = scr_marker_ext(xloc, yloc, sprite, xscale, yscale, 0, 0, undefined, undefined, 1);
            with (mark)
                mask_index = spr_npc_organik_spritemask;
            array_push(followers, mark);
        }
    }
    roomglow = instance_create(x, y, obj_roomglow);
    roomglow.actind = 1;
    with (roomglow)
    {
        var tr = 0;
        with (obj_treasure_room)
            tr = id;
        create_highlight(tr);
    }
    for (var i = 0; i < array_length(followers); i++)
    {
        followertrig[i] = instance_create(x, y, obj_trigger_interact);
        followertrig[i].sprite_index = spr_pxwhite;
        followertrig[i].x = followers[i].bbox_left;
        followertrig[i].y = followers[i].bbox_top;
        var wid = abs(followers[i].bbox_right - followers[i].bbox_left) + 1;
        var hei = abs(followers[i].bbox_bottom - followers[i].bbox_top) + 1;
        scr_sizeexact(wid, hei, followertrig[i]);
        followertrig[i].image_blend = c_orange;
        followertrig[i].issolid = true;
        followertrig[i].strict = true;
        with (followers[i])
        {
            switch (sprite_index)
            {
                case spr_organ_enemy:
                    sprite_index = spr_npc_organik_0_talk_baked;
                    break;
                case spr_npc_organik_1:
                    sprite_index = spr_npc_organik_1_talk_baked;
                    break;
                case spr_npc_organik_2:
                    sprite_index = spr_npc_organik_2_talk_baked;
                    break;
                case spr_npc_organik_3:
                    sprite_index = spr_npc_organik_3_talk_baked;
                    break;
            }
            image_index = random(360);
            image_speed = random_range(0.125, 0.16666666666666666);
        }
        scr_marker_ext(followers[i].x, (followers[i].y + (followers[i].sprite_height * 3)) - 18, followers[i].sprite_index, followers[i].image_xscale, -4, followers[i].image_speed, followers[i].image_index, c_black, 999000);
    }
    proptext[0] = "heroes3";
    proptext[1] = "heavenandhell1";
    proptext[2] = "heroes4";
    proptext[3] = "heavenandhell2";
    proptext[4] = "heroes1";
    proptext[5] = "heroes2";
    for (var i = 0; i < 6; i++)
    {
        var pos = scr_heromarker(undefined, "prop" + string(i + 1));
        prop[i] = instance_create(pos[0] + 150, pos[1] + 90, obj_dw_church_prophecy);
        prop[i].depth = 5000;
        prop[i].drawback = true;
        prop[i].extflag = proptext[i];
        prop[i].notext = true;
    }
    if (makera == 2)
    {
        var pos = scr_heromarker("ralsei", "pos1");
        ra1 = scr_marker_ext(pos[0], pos[1], spr_ralsei_walk_up_sad, 2, 2, 0, 0, c_white, undefined, 1);
        with (roomglow)
            create_highlight(other.ra1, true, true, -18);
    }
    if (makera >= 1)
    {
        var pos = scr_heromarker("ralsei", "pos3");
        ra2 = scr_marker_ext(pos[0], pos[1], spr_ralsei_walk_up_sad, 2, 2, 0, 0, c_white, undefined, 1);
        with (roomglow)
            create_highlight(other.ra2, true, true, -18);
    }
    followerinit = 1;
}
