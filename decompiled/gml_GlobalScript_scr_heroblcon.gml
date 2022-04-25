scr_heroblcon = function(argument0) //gml_Script_scr_heroblcon
{
    var heroobj = -69420
    switch argument0
    {
        case 1:
        case "kris":
        case "kr":
            heroobj = obj_herokris
            break
        case 2:
        case "susie":
        case "su":
            heroobj = obj_herosusie
            break
        case 3:
        case "ralsei":
        case "ra":
            heroobj = obj_heroralsei
            break
        case 4:
        case "noelle":
        case "no":
            heroobj = obj_heronoelle
            break
        default:
            heroobj = -69420
            break
    }

    if i_ex(heroobj)
    {
        var heroballoon = scr_enemyblcon((heroobj.x + 100), (heroobj.y + 40), 10)
        heroballoon.side = -1
        return heroballoon;
    }
    else
        return 0;
}

