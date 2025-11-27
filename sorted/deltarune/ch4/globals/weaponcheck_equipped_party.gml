function scr_weaponcheck_equipped_party(arg0)
{
    var __totalwearing = 0;
    for (var __weari = 0; __weari < 3; __weari++)
    {
        if (global.char[__weari] != 0)
            __totalwearing += scr_weaponcheck_equipped(global.char[__weari], arg0);
    }
    return __totalwearing;
}
