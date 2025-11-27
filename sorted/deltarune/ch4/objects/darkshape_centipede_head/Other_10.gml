var point_to = id;
for (var a = 0; a < segment_max; a++)
{
    with (instance_create(x, y, obj_darkshape_centipede_segment))
    {
        guide = point_to;
        master = other.id;
        point_to = id;
        ds_list_add(other.segment_list, id);
        segment_distance = other.segment_distance;
        if (a == (other.segment_max - 1))
        {
            sprite_index = spr_darkshape_directed_tail_animated;
            shrink_sprite = spr_darkshape_directed_tail;
        }
        scalefactor = 0.9 - (0.05 * a);
        image_xscale = 0.9 - (0.05 * a);
        image_yscale = 0.9 - (0.05 * a);
        image_alpha = 0 - (0.1 * a);
    }
}
var temp_list = ds_list_create();
ds_list_copy(temp_list, segment_list);
ds_list_shuffle(temp_list);
var blobs = 12;
if (obj_darkshape_manager.phase_difficulty == 2)
    blobs = 6;
if (obj_darkshape_manager.phase_difficulty == 3)
    blobs = 4;
for (var aa = 0; aa < blobs; aa++)
{
    if (!ds_list_size(temp_list))
        break;
    ds_list_find_value(temp_list, aa % ds_list_size(temp_list)).blob_size++;
}
ds_list_destroy(temp_list);
