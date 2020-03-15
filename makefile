.SILENT:

init:
	sudo apt install default-jdk javacc

all:
	mkdir -p src
	javacc -OUTPUT_DIRECTORY=src Assignment.jj
	mkdir -p build
	javac -d build src/*.java
	echo 'done'

clean:
	rm -r build src

run: all
	echo '---------------- Assignment.jj -------------------'
	java -cp build Assignment < test1.txt
