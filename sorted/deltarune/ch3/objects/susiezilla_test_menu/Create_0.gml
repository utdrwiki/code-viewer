just_created = true;
mode = 0;
name[0] = "0: Protect the statue";
name[1] = "1: Destroy the statue";
name[2] = "2: Protect Ralsei";
name[3] = "3: Vs. the statue";
name[4] = "4: Vs. the statue TURBO";
desc[0] = "Normal minigame version where you protect the statue from waves of enemies.";
desc[1] = "Battle minigame where you have to hit the statue while enemies interfere.";
desc[2] = "Battle minigame where you have to protect Ralsei from the enemies.";
desc[3] = "Battle minigame where the statue comes alive and you have to fight it.";
desc[4] = "Battle minigame where the statue comes alive and you have to fight it, but starts faster.";

start = function(arg0)
{
    with (instance_create(0, 0, obj_susiezilla_gamecontroller))
    {
        setup(arg0);
        if (mode == 0)
        {
            susie.visible = true;
            statue.visible = true;
            krisandsusie.visible = true;
            start();
        }
    }
    instance_destroy();
};
