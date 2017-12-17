#!/bin/bash

# default global_opts
paths_to_process="src/*"
themes=(moon night simple solarized)
theme=custom
format="html5 --template=reveal.js/reveal-template.html"
output_root="docs/"

# helpers
function args_mgmt {
	if ! $(test $# -eq 0)
	then
		paths_to_process=$(realpath $1)
	fi
}

function build_slides {
	path=$(realpath $1)
	output_dir=$(realpath "$output_root/$(basename $1)")
	output="$output_dir/index.html"
	mkdir -p $output_dir
	ln -s $(realpath vendor/reveal.js) $path/reveal.js
	ln -s $(realpath vendor/reveal.js/css) $path/css
	cd $path
	cmdline="pandoc -t $format --self-contained --section-divs --slide-level 2 -V theme=$theme --include-in-header=reveal.js/css/text.css -s $path/*.md -o $output"
	echo "DEBUG: cmdline: $cmdline"
	eval $cmdline
	cd - >/dev/null 2>&1
	rm $path/reveal.js $path/css
}


# main()
args_mgmt "$@"
cd $(dirname $0)/..

for path in $paths_to_process
do 
	#for theme in "${themes[@]}"
	#do
	#	echo "processing $theme"
	echo "INFO: Building $path"
	build_slides $path
	#done
done
