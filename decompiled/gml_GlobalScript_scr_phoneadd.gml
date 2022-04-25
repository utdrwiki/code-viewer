scr_phoneadd = function(argument0) //gml_Script_scr_phoneadd
{
    i = 0
    loop = true
    noroom = false
    global.phone[8] = 999
    while (loop == true)
    {
        if (global.phone[i] == 0)
        {
            global.phone[i] = argument0
            break
        }
        else if (i == 8)
        {
            noroom = true
            break
        }
        else
        {
            i += 1
            continue
        }
    }
    scr_phonename()
    return;
}

