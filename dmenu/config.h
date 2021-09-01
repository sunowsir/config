/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

#include "dmenu.h"

int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
int fuzzy = 1;                      /* -F  option; if 0, dmenu doesn't use fuzzy matching     */
int centered = 1;                    /* -c option; centers dmenu on screen */
int min_width = 1000;                    /* minimum width when centered */
/* -fn option overrides fonts[0]; default X11 font or font set */
const char *fonts[] = {
	"Monaco:size=16"
};

const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = { "#FFFAFA", "#363636" },
	[SchemeSel]  = { "#363636", "#CFCFCF" },
	[SchemeOut]  = { "#FFFAFA", "#363636" },
	[SchemeHp]   = { "#FFFAFA", "#363636" }
};

/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
unsigned int lines      = 10;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
const char worddelimiters[] = " ";

/* Size of the window border */
unsigned int border_width = 0;
