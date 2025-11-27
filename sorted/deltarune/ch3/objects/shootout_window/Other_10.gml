switch (char_state)
{
    case "init":
        duration = 60;
        if (timer >= duration)
        {
            char_state = "outro";
            timer = 0;
        }
        break;
    case "outro":
        state = "closing";
        timer = 0;
        char_state = "none";
        break;
}
