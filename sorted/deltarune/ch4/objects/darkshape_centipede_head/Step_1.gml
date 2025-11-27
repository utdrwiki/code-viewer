speed_remainder += abs(myspeed);
while (speed_remainder >= 1)
{
    x += lengthdir_x(1, direction);
    y += lengthdir_y(1, direction);
    ds_list_insert(point_list, 0, [x, y]);
    while (ds_list_size(point_list) > (segment_length + floor((abs(myspeed) - 2) * (segment_length * 0.125))))
        ds_list_delete(point_list, ds_list_size(point_list) - 1);
    speed_remainder--;
}
