--- ============================ HEADER ============================
--- ======= LOCALIZE =======
  -- Addon
  local addonName, addonTable = ...;
  -- HeroRotation
  local HR = HeroRotation;
  -- HeroLib
  local HL = HeroLib;
  -- File Locals
  local GUI = HL.GUI;
  local CreateChildPanel = GUI.CreateChildPanel;
  local CreatePanelOption = GUI.CreatePanelOption;
  local CreateARPanelOption = HR.GUI.CreateARPanelOption;
  local CreateARPanelOptions = HR.GUI.CreateARPanelOptions;

--- ============================ CONTENT ============================
  -- Default settings
  HR.GUISettings.APL.Shaman = {
    Commons = {
      OffGCDasOffGCD = {
	    WindShear = true,
	    Racials = true,
      },
      OnUseTrinkets = false,

      ShowPotions = false,
      ShowRunes = false,
      ConsumableMinHPThreshHold = 2500,

      ShowHSHP = false,
      HealingSurgeEnabled = false,
      HealingHPThreshold = 40
    },

    Enhancement = {
      EnableFS = true,
      EnableEE = true
	}
  };

  HR.GUI.LoadSettingsRecursively(HR.GUISettings);

  -- Child Panels
  local ARPanel = HR.GUI.Panel;
  local CP_Shaman = CreateChildPanel(ARPanel, "Shaman");
  local CP_Enhancement = CreateChildPanel(CP_Shaman, "Enhancement");
  -- local CP_Elemental = CreateChildPanel(CP_Shaman, "Elemental");

  -- Shared Shaman settings
  CreateARPanelOptions(CP_Shaman, "APL.Shaman.Commons");
  CreatePanelOption("CheckButton", CP_Shaman, "APL.Shaman.Commons.OnUseTrinkets", "Show on use trinkets", "Enable this if you want to show supported on use trinkets when they are ready.");

  CreatePanelOption("CheckButton", CP_Shaman, "APL.Shaman.Commons.ShowPotions", "Show potions", "Enable this if you want it to show you when to use Battle Potion of Agility, etc.");
  CreatePanelOption("CheckButton", CP_Shaman, "APL.Shaman.Commons.ShowRunes", "Show runes", "Enable this if you want it to show you when to use Battle-Scarred Augment Rune, etc.");
  CreatePanelOption("Slider", CP_Shaman, "APL.Shaman.Commons.ConsumableMinHPThreshHold", {0, 5000, 25}, "Consumable HP threshold (k)", "Minimum amount of health (times x1000) the target needs to have to show consumables.");

  CreatePanelOption("CheckButton", CP_Shaman, "APL.Shaman.Commons.ShowHSHP", "Show healthstones & health potions", "Enable this if you want to show Healthstones and health potions when you're low on health.");
  CreatePanelOption("CheckButton", CP_Shaman, "APL.Shaman.Commons.HealingSurgeEnabled", "Show healing surge", "Enable this if you want to show Healing Surge when you're low on health.");
  CreatePanelOption("Slider", CP_Shaman, "APL.Shaman.Commons.HealingHPThreshold", {0, 100, 1}, "Healing surge / health pot HP threshold", "Healing Surge and/or health pot HP percent threshold.");

  -- Enhancement settings
  CreateARPanelOptions(CP_Enhancement, "APL.Shaman.Enhancement");
  CreatePanelOption("CheckButton", CP_Enhancement, "APL.Shaman.Enhancement.EnableFS", "Show Feral Spirit in rotation", "Uncheck this if you don't want to see Feral Spirit in the rotation.");
  CreatePanelOption("CheckButton", CP_Enhancement, "APL.Shaman.Enhancement.EnableEE", "Show Earth Elemental in rotation", "Uncheck this if you don't want to see Earth Elemental in the rotation.");

  -- Elemental settings
  -- CreateARPanelOptions(CP_Elemental, "APL.Shaman.Elemental");
