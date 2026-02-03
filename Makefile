.PHONY:all clean target llhttp.a llhttp.so

objs     := src/api.o src/http.o src/llhttp.o
targets  := llhttp.a llhttp.so

all:$(targets)


llhttp.a:$(objs)
	ar rcs -o $@ $^

llhttp.so:$(objs)
	$(CC) -fPIC -shared -o $@ $^

%.o:%.c
	$(CC) -fPIC -o $@ -c $<

clean:
	rm -f $(objs) $(targets)
