.SILENT:

PLM_SRC_FILE = test1.txt

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
	echo '----------------' $(PLM_SRC_FILE) '----------------'
	java -cp build Assignment < $(PLM_SRC_FILE)
