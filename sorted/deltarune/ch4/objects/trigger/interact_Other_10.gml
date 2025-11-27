var faceallowed = true;
if (!face0allowed && obj_mainchara.facing == 0)
    faceallowed = false;
if (!face1allowed && obj_mainchara.facing == 1)
    faceallowed = false;
if (!face2allowed && obj_mainchara.facing == 2)
    faceallowed = false;
if (!face3allowed && obj_mainchara.facing == 3)
    faceallowed = false;
if (faceallowed)
{
    if (strict)
    {
        if (global.interact == 0)
            myinteract = 3;
    }
    else
    {
        myinteract = 3;
    }
}
