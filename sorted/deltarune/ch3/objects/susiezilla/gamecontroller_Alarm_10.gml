var arr = [[0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0], [0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0], [0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0]];
perfect_counter = 0;
for (var i = 0; i < 16; i++)
{
    for (var j = 0; j < 5; j++)
    {
        if (arr[j][i])
        {
            house = instance_create(-10 + (i * 66), 190 + (j * 32), obj_susiezilla_house_single);
            house.delay = 5 + (j * 3);
            if (i == 6)
                house.delay = 5 + (j * 3);
            perfect_counter++;
        }
    }
}
perfect_timer = -1;
