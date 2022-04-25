if instance_exists(obj_lightfairy_ch1)
    obj_lightfairy_ch1.factor = (battlealpha * 2)
if instance_exists(obj_mainchara_ch1)
{
    obj_mainchara_ch1.battlemode = 0
    for (i = 0; i < areas; i += 1)
    {
        if (obj_mainchara_ch1.x > areax1[i] && obj_mainchara_ch1.x < areax2[i] && obj_mainchara_ch1.y > areay1[i] && obj_mainchara_ch1.y < areay2[i])
            obj_mainchara_ch1.battlemode = 1
    }
}
