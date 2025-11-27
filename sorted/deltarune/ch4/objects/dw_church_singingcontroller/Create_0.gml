var make_choruses_sing = function()
{
    var arr = [false, false, false, false, false];
    for (var i = 0; i < argument_count; i++)
        arr[argument[i]] = true;
    return arr;
};

musichits = [[7.9, 1, make_choruses_sing(0)], [8.85, 1, make_choruses_sing(1)], [9.8, 1, make_choruses_sing(0)], [10.75, 1, make_choruses_sing(1)], [11.7, 1, make_choruses_sing(0)], [12.65, 1, make_choruses_sing(1)], [13.6, 1, make_choruses_sing(0)], [14.55, 15, make_choruses_sing(1)], [15.2, 110, make_choruses_sing(0, 1)], [19, 60, make_choruses_sing(0, 1, 2)], [21, 30, make_choruses_sing(0, 1, 3)], [22, 30, make_choruses_sing(1, 2, 3)], [23, 90, make_choruses_sing(2, 3, 4)], [26, 60, make_choruses_sing(0, 2, 4)], [28, 30, make_choruses_sing(0, 2, 3, 4)], [29, 15, make_choruses_sing(0, 1, 2, 3, 4)], [60.5, 60, make_choruses_sing(0, 1)], [62.8, 60, make_choruses_sing(2, 3)], [64.5, 45, make_choruses_sing(1, 4)], [66, 60, make_choruses_sing(0, 2)], [68.2, 60, make_choruses_sing(1, 4)], [70, 90, make_choruses_sing(3, 2)], [76, 45, make_choruses_sing(0, 1)], [77.5, 60, make_choruses_sing(2, 4)], [79.5, 45, make_choruses_sing(0, 3)], [81, 120, make_choruses_sing(1, 2, 4)], [85, 60, make_choruses_sing(2, 3, 4)], [87, 60, make_choruses_sing(0, 1, 2, 3)], [89, 60, make_choruses_sing(0, 1, 2)]];
trackpos = 0;
init = 0;
