function scr_enemyrecruitcheck(arg0)
{
    var _recruited = false;
    if (string_pos("star", arg0) != 0)
    {
        if (global.flag[254] > 0)
            _recruited = true;
    }
    if (string_pos("rud", arg0) != 0)
    {
        if (global.flag[605] == 1)
            _recruited = true;
    }
    if (string_pos("hat", arg0) != 0)
    {
        if (global.flag[606] == 1)
            _recruited = true;
    }
    if (string_pos("pon", arg0) != 0)
    {
        if (global.flag[611] == 1)
            _recruited = true;
    }
    if (string_pos("rab", arg0) != 0)
    {
        if (global.flag[613] == 1)
            _recruited = true;
    }
    if (string_pos("blo", arg0) != 0)
    {
        if (global.flag[614] == 1)
            _recruited = true;
    }
    if (arg0 == "jigsawry")
    {
        if (global.flag[615] == 1)
            _recruited = true;
    }
    if (string_pos("ran", arg0) != 0 || arg0 == "rudinn ranger" || arg0 == "rudinnranger")
    {
        if (global.flag[622] == 1)
            _recruited = true;
    }
    if (string_pos("hea", arg0) != 0)
    {
        if (global.flag[623] == 1)
            _recruited = true;
    }
    if (string_pos("amb", arg0) != 0)
    {
        if (global.flag[630] == 1)
            _recruited = true;
    }
    if (string_pos("pop", arg0) != 0)
    {
        if (global.flag[631] == 1)
            _recruited = true;
    }
    if (string_pos("tas", arg0) != 0)
    {
        if (global.flag[632] == 1)
            _recruited = true;
    }
    if (string_pos("wer", arg0) != 0)
    {
        if (global.flag[633] == 1)
            _recruited = true;
    }
    if (string_pos("mau", arg0) != 0)
    {
        if (global.flag[634] == 1)
            _recruited = true;
    }
    if (string_pos("vir", arg0) != 0)
    {
        if (global.flag[635] == 1)
            _recruited = true;
    }
    if (string_pos("swa", arg0) != 0)
    {
        if (global.flag[636] == 1)
            _recruited = true;
    }
    if (string_pos("wwr", arg0) != 0)
    {
        if (global.flag[640] == 1)
            _recruited = true;
    }
    if (arg0 == "werewerewire")
    {
        if (global.flag[640] == 1)
            _recruited = true;
    }
    if (string_pos("man", arg0) != 0)
    {
        if (global.flag[642] == 1)
            _recruited = true;
    }
    if (string_pos("whe", arg0) != 0)
    {
        if (global.flag[644] == 1)
            _recruited = true;
    }
    if (arg0 == "mauswheel")
    {
        if (global.flag[644] == 1)
            _recruited = true;
    }
    if (string_pos("sha", arg0) != 0)
    {
        if (global.flag[654] == 1)
            _recruited = true;
    }
    if (string_pos("shu", arg0) != 0)
    {
        if (global.flag[655] == 1)
            _recruited = true;
    }
    if (string_pos("zap", arg0) != 0)
    {
        if (global.flag[656] == 1)
            _recruited = true;
    }
    if (string_pos("rib", arg0) != 0)
    {
        if (global.flag[657] == 1)
            _recruited = true;
    }
    if (string_pos("wat", arg0) != 0)
    {
        if (global.flag[658] == 1)
            _recruited = true;
    }
    if (string_pos("pip", arg0) != 0)
    {
        if (global.flag[659] == 1)
            _recruited = true;
    }
    debug_message("enemy " + arg0 + " lost: " + string(_recruited));
    return _recruited;
}

function scr_enemylostcheck(arg0)
{
    var _lost = false;
    if (string_pos("rud", arg0) != 0)
    {
        if (global.flag[605] == -1)
            _lost = true;
    }
    if (string_pos("hat", arg0) != 0)
    {
        if (global.flag[606] == -1)
            _lost = true;
    }
    if (string_pos("pon", arg0) != 0)
    {
        if (global.flag[611] == -1)
            _lost = true;
    }
    if (string_pos("rab", arg0) != 0)
    {
        if (global.flag[613] == -1)
            _lost = true;
    }
    if (string_pos("blo", arg0) != 0)
    {
        if (global.flag[614] == -1)
            _lost = true;
    }
    if (arg0 == "jigsawry")
    {
        if (global.flag[615] == -1)
            _lost = true;
    }
    if (string_pos("ran", arg0) != 0 || arg0 == "rudinn ranger" || arg0 == "rudinnranger")
    {
        if (global.flag[622] == -1)
            _lost = true;
    }
    if (string_pos("hea", arg0) != 0)
    {
        if (global.flag[623] == -1)
            _lost = true;
    }
    if (string_pos("amb", arg0) != 0)
    {
        if (global.flag[630] == -1)
            _lost = true;
    }
    if (string_pos("pop", arg0) != 0)
    {
        if (global.flag[631] == -1)
            _lost = true;
    }
    if (string_pos("tas", arg0) != 0)
    {
        if (global.flag[632] == -1)
            _lost = true;
    }
    if (string_pos("wer", arg0) != 0)
    {
        if (global.flag[633] == -1)
            _lost = true;
    }
    if (string_pos("mau", arg0) != 0)
    {
        if (global.flag[634] == -1)
            _lost = true;
    }
    if (string_pos("vir", arg0) != 0)
    {
        if (global.flag[635] == -1)
            _lost = true;
    }
    if (string_pos("swa", arg0) != 0)
    {
        if (global.flag[636] == -1)
            _lost = true;
    }
    if (string_pos("wwr", arg0) != 0)
    {
        if (global.flag[640] == -1)
            _lost = true;
    }
    if (arg0 == "werewerewire")
    {
        if (global.flag[640] == -1)
            _lost = true;
    }
    if (string_pos("man", arg0) != 0)
    {
        if (global.flag[642] == -1)
            _lost = true;
    }
    if (string_pos("whe", arg0) != 0)
    {
        if (global.flag[644] == -1)
            _lost = true;
    }
    if (arg0 == "mauswheel")
    {
        if (global.flag[644] == -1)
            _lost = true;
    }
    if (string_pos("sha", arg0) != 0)
    {
        if (global.flag[654] == -1)
            _lost = true;
    }
    if (string_pos("shu", arg0) != 0)
    {
        if (global.flag[655] == -1)
            _lost = true;
    }
    if (string_pos("zap", arg0) != 0)
    {
        if (global.flag[656] == -1)
            _lost = true;
    }
    if (string_pos("rib", arg0) != 0)
    {
        if (global.flag[657] == -1)
            _lost = true;
    }
    if (string_pos("wat", arg0) != 0)
    {
        if (global.flag[658] == -1)
            _lost = true;
    }
    if (string_pos("pip", arg0) != 0)
    {
        if (global.flag[659] == -1)
            _lost = true;
    }
    debug_message("enemy " + arg0 + " lost: " + string(_lost));
    return _lost;
}
