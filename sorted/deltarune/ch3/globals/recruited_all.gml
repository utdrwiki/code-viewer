function scr_recruited_all()
{
    var recruited_all = true;
    var min_chapter = 1;
    var max_chapter = global.chapter + 1;
    for (var i = min_chapter; i < max_chapter; i++)
    {
        recruited_all = scr_recruited_all_in_chapter(i);
        if (!recruited_all)
            break;
    }
    return recruited_all;
}

function scr_recruited_all_previous()
{
    var recruited_all = true;
    var min_chapter = 1;
    var max_chapter = global.chapter;
    for (var i = min_chapter; i < max_chapter; i++)
    {
        recruited_all = scr_recruited_all_in_chapter(i);
        if (!recruited_all)
            break;
    }
    return recruited_all;
}

function scr_recruited_all_in_chapter(arg0)
{
    var chapter = arg0;
    var recruit_data = scr_get_chapter_recruit_data(chapter);
    var all_recruited = true;
    for (var i = 0; i < array_length_1d(recruit_data); i++)
    {
        if (global.flag[600 + recruit_data[i]] < 1)
        {
            all_recruited = false;
            break;
        }
    }
    return all_recruited;
}

function scr_get_chapter_recruit_data(arg0)
{
    var chapter = arg0;
    var recruit_ids = [];
    if (chapter == 1)
        recruit_ids = [5, 6, 11, 13, 14, 15, 22, 23];
    if (chapter == 2)
        recruit_ids = [30, 31, 32, 33, 34, 35, 36, 40, 42, 44];
    if (chapter == 3)
        recruit_ids = [54, 55, 56, 57, 58, 59, 60, 61];
    return recruit_ids;
}

function scr_get_total_recruits(arg0)
{
    var totalrecruits = 0;
    var chapter = arg0;
    var recruit_data = scr_get_chapter_recruit_data(chapter);
    for (var i = 0; i < array_length_1d(recruit_data); i++)
    {
        if (global.flag[600 + recruit_data[i]] == 1)
            totalrecruits++;
    }
    return totalrecruits;
}
