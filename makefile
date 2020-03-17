.SILENT:

# Targetd testfile
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

#   -------------------------------- USAGE ---------------------------------
#
# 	Place this file alongside Assignment.jj and any testfiles you have in the
#   root directory of your project. Running 'make init' from the shell will
#	install the necessary tools. Following this, executing 'make run' will
#	run your PLM parser defined in Assignment.jj on the PLM program in the
#	targeted testfile. To change the testfile, update the PLM_SRC_FILE var.
#
