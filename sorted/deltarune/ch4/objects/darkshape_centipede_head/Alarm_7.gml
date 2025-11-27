with (instance_create_depth(x, y, depth + 1, obj_darkshape_greenblob))
{
    size = other.blob_size;
    prime_me();
}
for (var b = 1; b < ds_list_size(segment_list); b++)
{
    var cur_segment = ds_list_find_value(segment_list, b);
    cur_segment.alarm[7] = b * 4;
}
instance_destroy();
