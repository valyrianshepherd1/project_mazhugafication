COURSES := calculus-2

.PHONY: all clean

all:
	@for course in $(COURSES); do $(MAKE) -C $$course all || exit 1; done

clean:
	@for course in $(COURSES); do $(MAKE) -C $$course clean || exit 1; done
