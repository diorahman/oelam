SOURCES = oelam.vala oelam-help.vala oelam-run.vala oelam-create.vala
FLAGS = --pkg glib-2.0 --pkg gee-1.0 --pkg gio-2.0

all: oelam

oelam:
	valac $(SOURCES) $(FLAGS) -o oelam

clean:
	rm -fr *.c *.o oelam
