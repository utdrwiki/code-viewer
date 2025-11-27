origin_list = ds_list_create();
gap_list = ds_list_create();
ds_list_add(gap_list, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
ds_list_shuffle(gap_list);
interval = 20;
if (scr_monsterpop() == 3)
    simulnotes = 1;
else if (scr_monsterpop() == 2)
    simulnotes = 2;
else if (scr_monsterpop() == 1)
    simulnotes = 5;
if (sameattack == 1)
{
    ds_list_add(origin_list, 0, 0, 0, 1, 1, 1, 2, 2, 2);
    ds_list_add(origin_list, irandom(2));
}
else if (sameattack == 2)
{
    ds_list_add(origin_list, 0, 0, 1, 1, 2, 2);
    interval = 25;
    repeat (4)
        ds_list_delete(gap_list, 0);
}
ds_list_sort(gap_list, true);
ds_list_shuffle(origin_list);
bullet_list = ds_list_create();
