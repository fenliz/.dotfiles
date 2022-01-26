/* See LICENSE file for copyright and license details. */

#define XF86MonBrightnessDown   0x1008ff03
#define XF86MonBrightnessUp     0x1008ff02
#define XF86AudioLowerVolume    0x1008ff11
#define XF86AudioMute           0x1008ff12
#define XF86AudioRaiseVolume    0x1008ff13
#define XF86AudioPlay           0x1008ff14
#define XF86AudioPrev           0x1008ff16
#define XF86AudioNext           0x1008ff17

/* appearance */
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int default_border = 0;  // to switch back to default border after dynamic border resizing via keybinds
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int gappih    = 10;       /* horiz inner gap between windows */
static const unsigned int gappiv    = 10;       /* vert inner gap between windows */
static const unsigned int gappoh    = 10;       /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 10;       /* vert outer gap between windows and screen edge */
static       int smartgaps          = 0;        /* 1 means no outer gap when there is only one window */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayspacing = 2;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails,display systray on the 1st monitor,False: display systray on last monitor*/
static const int showsystray        = 1;     /* 0 means no systray */
static const int showbar            = 1;        /* 0 means no bar */
enum showtab_modes { showtab_never, showtab_auto, showtab_nmodes, showtab_always };
static const int showtab            = showtab_auto;
static const int toptab             = True;
static const int topbar             = 1;        /* 0 means bottom bar */
static const int horizpadbar        = 5;
static const int vertpadbar         = 11;
static const int vertpadtab         = 33;
static const int horizpadtabi       = 15;
static const int horizpadtabo       = 15;
static const int scalepreview       = 4;
static       int tag_preview        = 0;        /* 1 means enable, 0 is off */

static const char *fonts[]          = { "Caskaydia Cove Nerd Font:style:medium:size=10",
                                        "Material Design Icons-Regular:size=10",
                                      };
static const int colorfultag        = 1;  /* 0 means use SchemeSel for selected non vacant tag */

#include "themes/catppuccin.h"

static const char *colors[][3]      = {
/*                         fg       bg      border   */
    [SchemeNorm]       = { gray3,   black,  gray2 },
    [SchemeSel]        = { gray4,   blue,   blue  },
    [TabSel]           = { blue,    gray2,  black },
    [TabNorm]          = { gray3,   black,  black },
    [SchemeTag]        = { gray3,   black,  black },
    [SchemeTag1]       = { blue,    black,  black },
    [SchemeTag2]       = { red,     black,  black },
    [SchemeTag3]       = { orange,  black,  black },
    [SchemeTag4]       = { green,   black,  black },
    [SchemeTag5]       = { red,    black,  black },
    [SchemeTag6]       = { orange,  black,  black },
    [SchemeTag7]       = { pink,     black,  black },
    [SchemeTag8]       = { blue,    black,  black },
    [SchemeTag9]       = { green,   black,  black },
    [SchemeLayout]     = { green,   black,  black }, 
    [SchemeBtnPrev]    = { green,   black,  black }, 
    [SchemeBtnNext]    = { yellow,  black,  black }, 
    [SchemeBtnClose]   = { red,     black,  black }, 
};

static char *tags[] = {"󰅴", "󰊯", "_", "_", "󰗃", "󰕃", "󰙯", "󰒯", "󰓇", };

static const char* eww[]      = { "eww", "open" , "eww", NULL };

static const Launcher launchers[] = {
    /* command       name to display */
	{ eww,         "" },
};

static const int tagschemes[] = { 
    SchemeTag1, SchemeTag2, SchemeTag3, SchemeTag4, SchemeTag5,
    SchemeTag6, SchemeTag7, SchemeTag8, SchemeTag9
};

static const unsigned int ulinepad	= 5;	/* horizontal padding between the underline and tag */
static const unsigned int ulinestroke	= 2;	/* thickness / height of the underline */
static const unsigned int ulinevoffset	= 0;	/* how far above the bottom of the bar the line should appear */
static const int ulineall 		= 0;	/* 1 to show underline on all tags, 0 for just the active ones */

static const Rule rules[] = {
    /* xprop(1):
     *	WM_CLASS(STRING) = instance, class
     *	WM_NAME(STRING) = title
     */
    /* class      instance    title       tags mask     iscentered   isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            0,           1,           -1 },
	{ "eww",      NULL,       NULL,       0,            0,           1,           -1 },
	{ "discord",  NULL,       NULL,       1 << 6,       0,           0,           -1 },
	{ "Skype",    NULL,       NULL,       1 << 7,       0,           0,           -1 },
	{ "Spotify",  NULL,       NULL,       1 << 8,       0,           0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.60; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

#define FORCE_VSPLIT 1  /* nrowgrid layout: force two clients to always split vertically */
#include "functions.h"

static const Layout layouts[] = {
    /* symbol     arrange function */
    { "[]=",      tile },    /* first entry is default */
    { "[M]",      monocle },
    { "[@]",      spiral },
    { "[\\]",     dwindle },
    { "H[]",      deck },
    { "TTT",      bstack },
    { "===",      bstackhoriz },
    { "HHH",      grid },
    { "###",      nrowgrid },
    { "---",      horizgrid },
    { ":::",      gaplessgrid },
    { "|M|",      centeredmaster },
    { ">M>",      centeredfloatingmaster },
    { "><>",      NULL },    /* no layout function means floating behavior */
};

#define MODKEY Mod1Mask

#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

static const char *term[]           = { "alacritty",                                                NULL };
static const char *applauncher[]    = { "rofi",         "-show", "drun",                            NULL };
static const char *powermenu[]      = { "/home/charlie.config/rofi/scripts/power-menu",             NULL };
static const char *mediaplaypause[] = { "playerctl",    "play-pause",                               NULL };
static const char *medianext[]      = { "playerctl",    "next",                                     NULL };
static const char *mediaprevious[]  = { "playerctl",    "previous",                                 NULL };

//FIX
static const char *brightnessup[]   = { "brightnessctl",   "set +5%",                               NULL };
static const char *brightnessdown[] = { "brightnessctl",   "set -5%",                               NULL };
static const char *volumeup[]   = { "pactl", "set-sink-volume", "0", "+5%",     NULL };
static const char *volumedown[] = { "pactl", "set-sink-volume", "0", "-5%",     NULL };
static const char *volumetoggle[] = { "pactl", "set-sink-mute",   "0", "toggle",  NULL };

static Key keys[] = {
    // Move between tags
    TAGKEYS(                        XK_1,                   0)
    TAGKEYS(                        XK_2,                   1)
    TAGKEYS(                        XK_3,                   2)
    TAGKEYS(                        XK_4,                   3)
    TAGKEYS(                        XK_5,                   4)
    TAGKEYS(                        XK_6,                   5)
    TAGKEYS(                        XK_7,                   6)
    TAGKEYS(                        XK_8,                   7)
    TAGKEYS(                        XK_9,                   8)

    // See all tags
    { MODKEY,                       XK_0,                   view,           {.ui = ~0 } },

    // Move between previous tags
    { MODKEY,                       XK_Tab,                 view,           {0} },

    // Move between monitors
    { MODKEY|ShiftMask,             XK_comma,               tagmon,         {.i = -1 } },
    { MODKEY|ShiftMask,             XK_period,              tagmon,         {.i = +1 } },

    // Move between windows
    { MODKEY,                       XK_j,                   focusstack,     {.i = +1 } },
    { MODKEY,                       XK_k,                   focusstack,     {.i = -1 } },

    // Move monitor focus
    { MODKEY,                       XK_comma,               focusmon,       {.i = -1 } },
    { MODKEY,                       XK_period,              focusmon,       {.i = +1 } },

    // Move window
    { MODKEY|ShiftMask,             XK_j,                   movestack,      {.i = +1 } },
    { MODKEY|ShiftMask,             XK_k,                   movestack,      {.i = -1 } },

    // Resize window
    { MODKEY,                       XK_h,                   setmfact,       {.f = -0.05} },
    { MODKEY,                       XK_l,                   setmfact,       {.f = +0.05} },
    { MODKEY|ShiftMask,             XK_h,                   setcfact,       {.f = +0.25} },
    { MODKEY|ShiftMask,             XK_l,                   setcfact,       {.f = -0.25} },
    { MODKEY|ShiftMask,             XK_o,                   setcfact,       {.f =  0.00} },

    // Kill window
    { MODKEY,                       XK_q,                   killclient,     {0} },

    // Kill dwm
    { MODKEY|ControlMask,           XK_q,                   quit,           {0} },

    // Restart dwm
    { MODKEY|ShiftMask,             XK_r,                   quit,           {1} },

    // Focus window
    { MODKEY,                       XK_f,                   togglefullscr,  {0} },
    { MODKEY,                       XK_Return,              zoom,           {0} },

    // Toggle floating
    { MODKEY|ShiftMask,             XK_space,               togglefloating, {0} },

    // Toggle all tags for window
    { MODKEY|ShiftMask,             XK_0,                   tag,            {.ui = ~0 } },

    // Launch
    { MODKEY,                       XK_p,                   spawn,          {.v = applauncher } },
    { MODKEY|ShiftMask,             XK_p,                   spawn,          {.v = powermenu } },
    { MODKEY|ShiftMask,             XK_Return,              spawn,          {.v = term }},  

    // Set mode
    { MODKEY|ControlMask,           XK_w,                   tabmode,        { -1 } },

    // Set layout
    { MODKEY,                       XK_t,                   setlayout,      {.v = &layouts[0]} },
    { MODKEY|ShiftMask,             XK_f,                   setlayout,      {.v = &layouts[1]} },
    { MODKEY,                       XK_m,                   setlayout,      {.v = &layouts[2]} },
    { MODKEY|ControlMask,           XK_g,                   setlayout,      {.v = &layouts[10]} },
    { MODKEY|ControlMask|ShiftMask, XK_t,                   setlayout,      {.v = &layouts[13]} },
    { MODKEY,                       XK_space,               setlayout,      {0} },
    { MODKEY|ControlMask,		    XK_comma,               cyclelayout,    {.i = -1 } },
    { MODKEY|ControlMask,           XK_period,              cyclelayout,    {.i = +1 } },

    { MODKEY,                       XK_i,                   incnmaster,     {.i = +1 } },
    { MODKEY,                       XK_d,                   incnmaster,     {.i = -1 } },

    // Brightnesss  
    { 0,                            XF86MonBrightnessUp,    spawn,          {.v = brightnessup} },
    { 0,                            XF86MonBrightnessDown,  spawn,          {.v = brightnessdown} },

    // Volume
    { 0,                            XF86AudioRaiseVolume,   spawn,          {.v = volumeup } },
    { 0,                            XF86AudioLowerVolume,   spawn,          {.v = volumedown } },
    { 0,                            XF86AudioMute,          spawn,          {.v = volumetoggle } },

    // Media
    { 0,                            XF86AudioPlay,          spawn,          {.v = mediaplaypause } },
    { 0,                            XF86AudioNext,          spawn,          {.v = medianext } },
    { 0,                            XF86AudioPrev,          spawn,          {.v = mediaprevious } },
};

static Button buttons[] = {
    { ClkWinTitle,          0,              Button2,        zoom,           {0} },
    { ClkStatusText,        0,              Button2,        spawn,          {.v = term } },

    // Window actions
	{ ClkClientWin,         MODKEY,         Button1,        moveorplace,    {.i = 0} },
    { ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
    { ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
    { ClkClientWin,         ControlMask,    Button1,        dragmfact,      {0} },
    { ClkClientWin,         ControlMask,    Button3,        dragcfact,      {0} },

    // Tag actions
    { ClkTagBar,            0,              Button1,        view,           {0} },
    { ClkTagBar,            0,              Button3,        toggleview,     {0} },
    { ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
    { ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
    { ClkTabBar,            0,              Button1,        focuswin,       {0} },
    { ClkTabBar,            0,              Button1,        focuswin,       {0} },

    // Layout actions
    { ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
    { ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },

    { ClkTabPrev,           0,              Button1,        movestack,      { .i = -1 } },
    { ClkTabNext,           0,              Button1,        movestack,      { .i = +1 } },
    { ClkTabClose,          0,              Button1,        killclient,     {0} },
};
