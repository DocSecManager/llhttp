.PHONY:all clean target llhttp.a llhttp.so

objs     := src/api.o src/http.o src/llhttp.o
targets  := libllhttp.a libllhttp.so demo1.run

all:$(targets)


libllhttp.a:$(objs)
	ar rcs -o $@ $^

libllhttp.so:$(objs)
	$(CC) -fPIC -shared -o $@ $^

demo1.run:example/demo1.c libllhttp.a
	$(CC) -fPIC -Isrc/ -o $@ $^


%.o:%.c
	$(CC) -fPIC -o $@ -c $<

clean:
	rm -f *.run
	rm -f $(objs) $(targets)
