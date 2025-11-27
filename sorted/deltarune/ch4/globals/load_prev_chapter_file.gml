function scr_load_prev_chapter_file(arg0 = 0)
{
    var _chapter = arg0;
    switch (_chapter)
    {
        case 1:
            scr_load_chapter1();
            break;
        case 2:
            scr_load_chapter2();
            break;
        case 3:
            scr_load_chapter3();
            break;
        default:
            break;
    }
}
