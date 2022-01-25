#!/bin/zsh
#
currentDate=$(date)
echo $currentDate
if [[ $# -lt 1 ]]
then
  echo -e 'Please pass the name of the file to the program without the file suffix\ne.g. ./generate_html.sh index'
  exit 1;
fi

ext=$(echo $1 | tail -c 6)

if [[ $ext == ".html" ]]
then 
  echo -e 'Please pass the name of the file to the program without the file suffix\ne.g. ./generate_html.sh index'
  exit 2;
fi

filename=$1".html"

if [[ -a $filename ]]
then 
  echo "File already exists. Saving previous as $filename.bak"
  filebak=$filename".bak"
  cp $filename $filebak
fi
  touch $filename;
  scriptname=$0[3,-1]
  echo "<!-- FILE $filename generated from $scriptname by Ghassan Younes on $currentDate-->" > $filename
  echo "Created file $filename";

vared -p 'Title of page: ' -c tmp;
echo "Page name: $tmp";

## HTML
echo -e '<!DOCTYPE html>\n<html>' >> $filename
## HEAD
echo -e '  <head>\n    <meta charset="UTF-8" />' >> $filename
echo -ne '    <title>' >> $filename; echo -n $tmp >> $filename; echo -e '</title>' >> $filename
echo -e '    <link rel="stylesheet" href="css/base.css" />' >> $filename
echo -e '    <script src="https://kit.fontawesome.com/7a8c1f7fea.js" crossorigin="anonymous"></script>\n  </head>' >> $filename
## /HEAD
## BODY
  ## HEADER
echo -e '  <body>\n    <header>' >> $filename
echo -ne '      <h1 class="title" id="name">' >> $filename; echo -n $tmp  >> $filename; echo -e '</h1>' >> $filename
echo -e '      <nav> ' >> $filename
echo -e '        <a id="home"    href="index"      >Home</a>' >> $filename
echo -e '        <a id="contact" href="contact"    >Resumé &amp; Contact</a>' >> $filename
echo -e '        <a id="projs"   href="projects"   >Professional Projects</a>' >> $filename
echo -e '        <a id="blog"    href="blog/index" >Food Blog</a>' >> $filename
echo -e '        <a id="store"   href="store/index">Store</a>' >> $filename
echo -e '        <a id="about"   href="about"      >About</a>' >> $filename
echo -e '        <div class="searchbar">Search</div>' >> $filename
echo -e '      </nav>' >> $filename
echo -e '    </header>' >> $filename
  ## /HEADER
  ## MAIN
echo -e '    <main id="main">' >> $filename
echo -e '      <div class="maincontent">\n      <h2>Title of Content</h2>' >> $filename
echo -e '      <p>\n        lorem ipsum and so on\n      </p>' >> $filename
echo -e '      </div> <!-- main content -->' >> $filename
for i in {1..4}
do
  echo "      <div class=\"sidebar\">\n        <h3>Sidebar $i</h3>" >> $filename
  echo -e '        <img src=""/>' >> $filename
  echo -e '        <p>\n          text goes here\n        </p>' >> $filename
  echo "      </div><!--Sidebar $i-->" >> $filename
done
for i in {1..6}
do
  echo -e '      <div class="sidebar filler"><!-- will not show up on mobile--></div>' >> $filename
done
echo -e '    </main>' >> $filename
  ## /MAIN
echo -e '    <footer id="footer"></footer>' >> $filename
echo -e '    <script src="scripts/common_text.js"></script>' >> $filename
echo -e '    <script src="scripts/name-change-color.js"></script>' >> $filename
echo -e '  </html>' >> $filename
## /BODY
echo -e '</html>' >> $filename
## /HTML