all: README.md

README.md: guessinggame.sh
	echo "# The Unix Workbench, Project name is:" > README.md
	echo "# Peer-graded Assignment: Bash, Make, Git, and GitHub" >> README.md

	echo "" >> README.md

	echo "The date and time at which make was run:" >> README.md
	echo "$$(date +'%F %T')" >> README.md
	echo "" >> README.md

	echo "The number of lines of code contained in guessinggame.sh:"  >> README.md
	wc -l guessinggame.sh | egrep -o "[0-9]+" >> README.md

clean:
	rm README.md