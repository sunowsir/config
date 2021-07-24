#include <X11/XF86keysym.h>

/* See LICENSE file for copyright and license details. */

/* appearance */

/* 窗口边框像素 */
static const unsigned int borderpx  = 1;        

/* 捕捉像素 */
static const unsigned int snap      = 100;       

/* 0: sloppy systray follows selected monitor, 
 * >0: pin systray to monitor X 
 * */
static const unsigned int systraypinning = 0;   

/* 系统托盘间距*/
static const unsigned int systrayspacing = 1;   

/* 1: if pinning fails, 
 * display systray on the first monitor, 
 * False: display systray on the last monitor
 * */
static const int systraypinningfailfirst = 1;   

/* 0 means no systray */
static const int showsystray        = 1;     

/* horiz inner gap between windows */
static const unsigned int gappih    = 6;       

/* vert inner gap between windows */
static const unsigned int gappiv    = 6;       

/* horiz outer gap between windows and screen edge */
static const unsigned int gappoh    = 6;       

/* vert outer gap between windows and screen edge */
static const unsigned int gappov    = 6;       

/* 1 means no outer gap when there is only one window */
static const int smartgaps          = 0;        

/* The value to be subtracted based on the height of the font: bh = drw->fonts->h - besubfh; */
static const int besubfh            = 5;        

/* 0 means no bar */
static const int showbar            = 1;        

/* 0 means bottom bar */
static const int topbar             = 1;        

/* Switch view on tag switch */
static const Bool viewontag         = True;     

/* 字体列表 */
static const char *fonts[]          = { "SauceCodePro Nerd Font Mono:size=16" };

/* 是否显示状态栏窗口管理方式 */
static const int showlayout         = 0;

/* 是否在状态栏显示客户端 */ 
static const int showclient         = 0;

static const char norm_fg_color[]     = "#000000"; 
static const char norm_bg_color[]     = "#282a36"; 
static const char norm_border_color[] = "#282a36"; 
static const char sel_fg_color[]      = "#000000"; 
static const char sel_bg_color[]      = "#282a36"; 
static const char sel_border_color[]  = "#282a36"; 
static const char hid_fg_color[]      = "#000000"; 
static const char hid_bg_color[]      = "#282a36"; 
static const char hid_border_color[]  = "#282a36"; 

static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm]    = { norm_fg_color, norm_bg_color, norm_border_color },
	[SchemeSel]     = { sel_fg_color,  sel_bg_color,  sel_border_color  },
	[SchemeHid]     = { hid_fg_color,  hid_bg_color,  hid_border_color  },
};

static const unsigned int norm_fg_alpha     = 0xD2;
static const unsigned int norm_bg_alpha     = 0xD2;
static const unsigned int norm_border_alpha = 0xD2;
static const unsigned int sel_fg_alpha      = 0xD2;
static const unsigned int sel_bg_alpha      = 0xD2;
static const unsigned int sel_border_alpha  = 0x10;
static const unsigned int hid_fg_alpha      = 0xD2;
static const unsigned int hid_bg_alpha      = 0xD2;
static const unsigned int hid_border_alpha  = 0xD2;
static const unsigned int baralpha          = 0xD2;

static const unsigned int alphas[][3]      = {
	/*               fg      bg        border     */
	[SchemeNorm] = { norm_fg_alpha,     norm_bg_alpha, norm_border_alpha },
	[SchemeSel]  = { sel_fg_alpha,      sel_bg_alpha,  sel_border_alpha  },
	[SchemeHid]     = { hid_fg_alpha,   hid_bg_alpha,  hid_border_alpha  },
};

/* tagging */
static const char *tags[] = { "一", "二", "三", "四", "五", "六", "七", "八", "九" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",               NULL,       NULL,       0,            1,           -1 },
	{ "Android Emulator",   NULL,       NULL,       0,            1,           -1 },
	{ "Emulator",           NULL,       NULL,       0,            1,           -1 },
	{ "quemu-system-i386",  NULL,       NULL,       0,            1,           -1 },
	{ "google-chrome",      NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.5; /* 主区域大小系数 [0.05..0.95] */
static const int nmaster     = 1;    /* 主区域客户端的数量 */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[E]",      tile },    /* first entry is default */
	{ "[F]",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[]           = { "dmenu_run", "-m", dmenumon, NULL };
static const char *termcmd[]            = { "st", NULL };
static const char *browsercmd[]         = { "google-chrome-stable", NULL };
static const char *changelightupcmd[]   = { "xbacklight", "-inc", "10", NULL };
static const char *changelightdowncmd[] = { "xbacklight", "-dec", "10", NULL };
static const char scratchpadname[]      = "scratchpad";
static const char *scratchpadcmd[]      = { "st", "-t", scratchpadname, "-g", "80x24", NULL };
static const char *screenshotcmd[]      = { "flameshot", "gui", NULL };
static const char *slockcmd[]           = {"slock", NULL};

static const char *upvol[]          = { "/home/sunowsir/.config/autostart.dwm/function/dwm_vol_setup.sh", "up", NULL };
static const char *downvol[]        = { "/home/sunowsir/.config/autostart.dwm/function/dwm_vol_setup.sh", "down", NULL };
static const char *mutevol[]        = { "/home/sunowsir/.config/autostart.dwm/function/dwm_vol_setup.sh", "toggle", NULL };
static const char *wpcmd[]          = { "/home/sunowsir/.config/autostart.dwm/function/wp-change.sh", NULL };
static const char *sktogglecmd[]    = { "/home/sunowsir/.config/autostart.dwm/function/sck-tog.sh", NULL };
static const char *setcolemakcmd[]  = { "/home/sunowsir/.config/autostart.dwm/function/setxmodmap-colemak.sh", NULL };
static const char *setqwertycmd[]   = { "/home/sunowsir/.config/autostart.dwm/function/setxmodmap-qwerty.sh", NULL };
static const char *suspendcmd[]     = { "/home/sunowsir/.config/autostart.dwm/function/suspend.sh", NULL };

static Key keys[] = {
	/* modifier            key                      function        argument */

    /* 启动dmenu */
	{ MODKEY,              XK_space,                spawn,          {.v = dmenucmd } },

    /* 启动 st终端 */
	{ MODKEY,              XK_Return,               spawn,          {.v = termcmd } },

    /* 休眠 */
	{ MODKEY|ShiftMask,    XK_p,                    spawn,          {.v = suspendcmd } },

    /* 启动或关闭 screenkey */
	{ MODKEY|ControlMask,  XK_s,                    spawn,          {.v = sktogglecmd } },

    /* 音量以及亮度特定功能键 */
	{ 0,                   XF86XK_AudioLowerVolume, spawn,          {.v = downvol } },
	{ 0,                   XF86XK_AudioMute,        spawn,          {.v = mutevol } },
	{ 0,                   XF86XK_AudioRaiseVolume, spawn,          {.v = upvol   } },
	{ 0,                   XF86XK_MonBrightnessUp,  spawn,          {.v = changelightupcmd } },
	{ 0,                   XF86XK_MonBrightnessDown,spawn,          {.v = changelightdowncmd } },

    /* 切换壁纸 */
	{ MODKEY,              XK_b,                    spawn,          {.v = wpcmd } },

    /* 截屏 */
	{ 0,                   XK_Print,                spawn,          {.v = screenshotcmd } },

    /* 调整当前窗口优先级 */
	{ MODKEY|ShiftMask,    XK_j,                    rotatestack,    {.i = +1 } },
	{ MODKEY|ShiftMask,    XK_k,                    rotatestack,    {.i = -1 } },
    /* 优先级提升至最高*/
	{ MODKEY|ShiftMask,    XK_Return,               zoom,           {0} },

    /* 聚焦窗口*/
	{ MODKEY,              XK_j,                    focusstack,     {.i = +1 } },
	{ MODKEY,              XK_k,                    focusstack,     {.i = -1 } },

    /* 切换桌面*/
	{ MODKEY,              XK_h,                    viewtoleft,     {0} },
	{ MODKEY,              XK_l,                    viewtoright,    {0} },

    /* 移动窗口到上一个或下一个桌面*/
	{ MODKEY|ShiftMask,    XK_h,                    tagtoleft,      {0} },
	{ MODKEY|ShiftMask,    XK_l,                    tagtoright,     {0} },

    /* 调整窗口布局*/
	{ MODKEY,              XK_t,                    incnmaster,     {.i = +1 } },
	{ MODKEY|ShiftMask,    XK_t,                    incnmaster,     {.i = -1 } },

    /* 向左或向右调整占用面积, (仅限纵向布局)*/
	{ MODKEY|ControlMask,  XK_h,                    setmfact,       {.f = -0.05} },
	{ MODKEY|ControlMask,  XK_l,                    setmfact,       {.f = +0.05} },

    /* 隐藏窗口与恢复 */
	{ MODKEY,              XK_m,                    hidewin,        {0} },
	{ MODKEY|ShiftMask,    XK_m,                    restorewin,     {0} },
	{ MODKEY,              XK_o,                    hideotherwins,  {0}},
	{ MODKEY|ShiftMask,    XK_o,                    restoreotherwins, {1}},

    /* 在当前与最近一次浏览的桌面之间切换*/
	{ MODKEY,              XK_Tab,                  view,           {0} },

    /* 关闭当前窗口 */
	{ MODKEY,              XK_q,                    killclient,     {0} },

    /* 全屏 */
	{ MODKEY|ShiftMask,    XK_f,                    fullscreen,     {0} },

    /* 临时悬浮终端 */
	{ MODKEY,              XK_apostrophe,           togglescratch,  {.v = scratchpadcmd } },

    /* 退出dwm */
	{ MODKEY|ControlMask,  XK_q,      quit,           {0} },

	TAGKEYS(               XK_1,                      0)
	TAGKEYS(               XK_2,                      1)
	TAGKEYS(               XK_3,                      2)
	TAGKEYS(               XK_4,                      3)
	TAGKEYS(               XK_5,                      4)
	TAGKEYS(               XK_6,                      5)
	TAGKEYS(               XK_7,                      6)
	TAGKEYS(               XK_8,                      7)
	TAGKEYS(               XK_9,                      8)
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
// 	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
// 	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
//     
// 	{ ClkWinTitle,          0,              Button1,        togglewin,      {0} },
// 	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
// 
// 	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
//     
// 	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
// 
// 	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
//     
// 	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
 	{ ClkTagBar,            0,              Button1,        view,           {0} },
// 	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
// 	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
// 	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

