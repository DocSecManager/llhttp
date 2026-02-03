.PHONY:all clean target llhttp.a llhttp.so

objs     := src/api.o src/http.o src/llhttp.o
targets  := llhttp.a llhttp.so demo1.run

all:$(targets)


llhttp.a:$(objs)
	ar rcs -o $@ $^

llhttp.so:$(objs)
	$(CC) -fPIC -shared -o $@ $^

demo1.run:example/demo1.c llhttp.a
	$(CC) -fPIC -o $@ $^


%.o:%.c
	$(CC) -fPIC -o $@ -c $<

clean:
	rm -f *.run
	rm -f $(objs) $(targets)
