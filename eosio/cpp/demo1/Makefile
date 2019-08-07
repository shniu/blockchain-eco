
objs = main.o hello.o

sayHello: $(objs)
	gcc -o sayHello $(objs)

main.o: main.c hello.h

hello.o: hello.c hello.h

clean:
	rm sayHello $(objs)

