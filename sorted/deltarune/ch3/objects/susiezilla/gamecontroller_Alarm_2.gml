var arr = [[0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0], [0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0], [0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0]];
perfect_counter = 0;
for (var i = 0; i < 16; i++)
{
    for (var j = 0; j < 5; j++)
    {
        if (arr[j][i])
        {
            instance_create(50 + (i * 76), 190 + (j * 32), obj_susiezilla_house_single);
            perfect_counter++;
        }
    }
}
perfect_timer = -1;
