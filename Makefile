SOURCES = oelam.vala oelam-help.vala oelam-run.vala oelam-create.vala oelam-window.vala oelam-webview.vala oelam-config.vala oelam-utils.vala
FLAGS = --pkg glib-2.0 --pkg gee-1.0 --pkg gio-2.0 --pkg gtk+-3.0 --pkg webkitgtk-3.0 --pkg seed --pkg javascriptcore --pkg libxml-2.0 --target-glib=2.32 --thread --vapidir=./vapi
XFLAGS = -X -I/usr/include/webkitgtk-3.0

all: oelam

oelam:
	valac $(SOURCES) $(XFLAGS) $(FLAGS)  -o oelam

clean:
	rm -fr *.c *.o oelam
