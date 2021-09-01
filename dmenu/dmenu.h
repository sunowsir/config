/*
	* File     : dmenu.h
	* Author   : sunowsir
	* Mail     : sunowsir@163.com
	* Github   : github.com/sunowsir
	* Creation : 2021年08月05日 星期四 16时40分21秒
*/

#ifndef _DMENU_H
#define _DMENU_H


#include "dmenu_sys_api.h"
#include "dmenu_define.h"

#include "drw.h"
#include "util.h"

/* enums */
enum { SchemeNorm, SchemeSel, SchemeHp, SchemeOut, SchemeLast }; /* color schemes */

struct item {
	char *text;
	struct item *left, *right;
	int out, hp;
	double distance;
};

char numbers[NUMBERSBUFSIZE] = "";
char **hpitems = NULL;
int hplength = 0;
char text[BUFSIZ] = "";
char *embed;
int bh, mw, mh;
int inputw = 0, promptw;
int lrpad; /* sum of left and right padding */
size_t cursor;
struct item *items = NULL;
struct item *matches, *matchend;
struct item *prev, *curr, *next, *sel;
int mon = -1, screen;

Atom clip, utf8;
Display *dpy;
Window root, parentwin, win;
XIC xic;

Drw *drw;
Clr *scheme[SchemeLast];

char * cistrstr(const char *s, const char *sub);
int (*fstrncmp)(const char *, const char *, size_t) = strncasecmp;
char *(*fstrstr)(const char *, const char *) = cistrstr;

#endif
