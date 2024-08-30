local actionWheel = require("action_wheel")
actionWheel.loadFolders(actionWheel.pages["main"], {
    {"toggles","Toggles","textures.icons.icon_main",0,0,16,16},
    {"funsies","Funsies","textures.icons.icon_main",16,0,16,16},
    {"poses","Poses & Sits","textures.icons.icon_main",32,0,32,32},
    {"accessories","Outfits & Accessories","textures.icons.icon_main",0,16,32,32},
    {"expressions","Face Expressions","textures.icons.icon_main",16,48,16,16},
    {"emotes","Emotes & Meme Animations","textures.icons.icon_main",32,32,32,32}
})

local expressions = require("expressions")
expressions.eyeParts(
    models.model.root.Torso.Head.Face.LeftEye,
    models.model.root.Torso.Head.Face.RightEye
)
expressions.default("blinking",{"Default","None"},40)
expressions.loadFrames({
    {"Default","",0,0},
    {"None","",32,0},
    {"BSOD","",64,0},
    {"BSODBlink","",96,0},
    {"Pikachu","",0,16},
    {"PikachuBlink","",32,16},
    {"Happy","",64,16},
    {"Angry","",96,16},
    {"Unamused","",0,32},
    {"UnamusedBlink","",32,32},
    {"Dot","",64,32},
    {"AngryDot","",96,32},
    {"Fearful","",0,48},
    {"Shocked","",32,48},
    {"NeedSleep","",64,48},
    {"NeedSleepBlink","",96,48},

    {"Disturbed","",0,64},
    {"DisturbedBlink","",32,64},
    {"AnnoyedUp","",64,64},
    {"AnnoyedDown","",96,64},
    {"SweatUp","",0,80},
    {"SweatDown","",32,80},
    {"Posing","",64,80},
    {"Rawr","",96,80},
    {"DownloadUp","",0,96},
    {"DownloadDown","",32,96},
    {"UploadUp","",64,96},
    {"UploadDown","",96,96},
    {"Gremlin","",0,112},
    {"UNO","",32,112},
    {"WarnDown","",64,112},
    {"WarnUp","",96,112},

    {"Error","2",0,0},
    {"PopUp","2",32,0},
    {"PopUpGlitch","2",64,0},
    {"Eye","2",96,0},
    {"EyeBlink","2",0,16},
    {"Window","2",32,16},
    {"Sunglasses","2",64,16},
    {"Man","2",96,16},
    {"Toast","2",0,32},
    {"Load1","2",32,32},
    {"Load2","2",64,32},
    {"Load3","2",96,32},
    {"Load4","2",0,48},
    {"Load5","2",32,48},
    {"Load6","2",64,48},
    {"Load7","2",96,48}
})
expressions.loadExpressions({
    {{"Default",0,0},{"blinking",40},{"Default","None"}},
    {{"Blue Screen of Death",24,0},{"blinking",40},{"BSOD","BSODBlink"}},
    {{"Surprised Pikachu",48,0},{"blinking",40},{"Pikachu","PikachuBlink"}},
    {{"Happy",72,0},{"static"},{"Happy"}},
    {{"Angry",96,0},{"static"},{"Angry"}},
    {{"Unamused",120,0},{"blinking",40},{"Unamused","UnamusedBlink"}},
    {{"No thoughts, head empty",144,0},{"blinking",40},{"Dot","None"}},
    {{"Too many thoughts, head full",168,0},{"blinking",40},{"AngryDot","None"}},

    {{"Fearful",0,24},{"static"},{"Fearful"}},
    {{"Shocked",24,24},{"blinking",40},{"Shocked","None"}},
    {{"Sleep Deprived",48,24},{"blinking",20},{"NeedSleep","NeedSleepBlink"}},
    {{"Disturbed",72,24},{"blinking",40},{"Disturbed","DisturbedBlink"}},
    {{"Annoyed",96,24},{"animated",20},{"AnnoyedUp","AnnoyedDown"}},
    {{"Sweating",120,24},{"animated",5},{"SweatUp","SweatDown"}},
    {{"Posing",144,24},{"static"},{"Posing"}},
    {{"Rawr X3",168,24},{"static"},{"Rawr"}},

    {{"Downloading",0,48},{"animated",20},{"DownloadUp","DownloadDown"}},
    {{"Uploading",24,48},{"animated",20},{"UploadUp","UploadDown"}},
    {{"Gremlin >:3",48,48},{"static"},{"Gremlin"}},
    {{"NO-U",72,48},{"static"},{"UNO"}},
    {{"Warning",96,48},{"animated",10},{"WarnDown","WarnUp"}},
    {{"Error",120,48},{"static"},{"Error"}},
    {{"Popup-Attack",144,48},{"blinking",10},{"PopUp","PopUpGlitch"}},
    {{"THE ALLSEING.",168,48},{"blinking",40},{"Eye","EyeBlink"}},

    {{"Popup-Window",0,72},{"static"},{"Window"}},
    {{"Loading",24,72},{"animated",2},{
        "Load1",
        "Load1",
        "Load1",
        "Load1",
        "Load2",
        "Load3",
        "Load4",
        "Load5",
        "Load6",
        "Load7",
        "Load1",
        "Load1",
        "Load1",
        "Load1"
    }},
    {{"Bloodthirst",48,72},{"matchedBlinking",1},{{"Error","AngryDot"},{"BSOD","WarnDown"}}},
    {{"MLG God",72,72},{"static"},{"Sunglasses"}},
    {{"Beyond Handsome",96,72},{"static"},{"Man"}}
})

local toggles = require("toggles")
toggles.load({
    {{"cape","Custom Cape",{48,32,16,16},{32,32,16,16},true},{
        models.cape.Cape,
        models.cape.Elytra
    },{"vanilla"}},
    {{"tail","Tail",{16,32,16,16},{0,32,16,16},true},{models.model.root.Torso.Body.Tail},{}},
    {{"vanilla","Vanilla Elytra & Cape",{32,0,32,32},{0,0,32,32},false},{
        vanilla_model.ELYTRA,
        vanilla_model.CAPE
    },{"cape"}}
})

local poses = require("poses")
poses.load({
    {"Sit (Vanilla Style)",{0,0},"pose_sit_vanilla"},
    {"Sit (Cross-legged)",{32,0},"pose_sit_cross_legged"},
    {"Sit (Hanging)",{64,0},"pose_sit_hanging"},
    {"Sit (Shinji)",{96,0},"pose_sit_shinji"}
})

local emotes = require("emotes")
emotes.load({
    {"Dab (Slay)",{0,0},"emote_dab"},
    {"Peter Griffin",{32,0},"emote_family_guy"},
    {"Piec'a Paper",{64,0},"emote_paper"},
    {"Flshoaster",{96,0},"emote_toaster"},
    {"Default",{128,0},"emote_fortnite"},
    {"Get Weezer'd",{160,0},"emote_weezer"},
    {"Penguin Dance",{192,0},"emote_penguin"},
    {"Wave",{224,0},"emote_wave"},
    {"That One Burger King Guy Dance",{0,32},"emote_animatronic_dance"}
})

local funsies = require("funsies")
funsies.renderTypes({
    {"CUTOUT",0,0},
    {"LINES_STRIP",24,0},
    {"EYES",48,0}
})