void modloader_initialize()
{
    print("ModLoader :: Initializing...");
    
    ConfigFile cfg;
    if (!cfg.loadFile("../Cache/asu_modloader.cfg"))
    {
        error("ModLoader :: Configuration error");
        error("Couldn't load configuration from 'Cache/asu_modloader.cfg'.");
        error("This means you configured ModLoader incorrectly.");
        error("Please read the instructions in 'Mods/ModLoader/asu_modloader.cfg' and retry.");
        error("If you cannot fix the issue, ask for help on the ModLoader forum thread.");
        
        return;
    }
    
    string[] scripts;
    if (!cfg.readIntoArray_string(scripts, "scripts"))
    {
        error("ModLoader :: Configuration error");
        error("Couldn't read array from key 'scripts'.");
        error("This means your ModLoader configuration file might be corrupt.");
        error("Copy it from the sample file back and read instructions carefully.");
        return;
    }
    
    CRules@ rules = getRules();    
    for (int i = 0; i < scripts.size(); i++)
    {
        print("ModLoader :: Loading script from '" + scripts[i] + "'...");
        rules.AddScript(scripts[i]);
    }
    
    print("ModLoader :: Script loading done");
}
