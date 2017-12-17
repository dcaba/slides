# slides
Basic pandoc wrapper to generate slides using markdown, as well as slides the author has been generating in the src dir.

## How can I use it?

* create a folder under src/ for your slides
* create one or multiple markdown file with the contents (ending by .md)
	* If there's multiple in an specific directory, they will be merged (alphabetical order - you may want to use
	numbers as prefixes) to generate the output
* execute build in the bin folder (you probably want the `build-docker.sh`, so you don't want to deal with requirements)
	* You can pass as a parameter the folder to process
	* If no parameter is provided, will iterate over all subdirs

## How does it work?

* uses pandoc to convert from markup to html5 slides
* reveal.js is used and included in the repo
* but the default reveal template in pandoc is too simple...
	* [https://gist.github.com/aaronwolen/5017084] included and improved with the comments
	* custom css template generated to customize font size, text alignment...
