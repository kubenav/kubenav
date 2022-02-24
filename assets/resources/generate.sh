mkdir -p image42x42
mkdir -p image42x42/2.0x
mkdir -p image42x42/3.0x
mkdir -p image42x42/4.0x
mkdir -p image42x42/5.0x
mkdir -p image42x42/6.0x
mkdir -p image42x42/7.0x
mkdir -p image42x42/8.0x
mkdir -p image42x42/9.0x
mkdir -p image42x42/10.0x

mkdir -p image54x54
mkdir -p image54x54/2.0x
mkdir -p image54x54/3.0x
mkdir -p image54x54/4.0x
mkdir -p image54x54/5.0x
mkdir -p image54x54/6.0x
mkdir -p image54x54/7.0x
mkdir -p image54x54/8.0x
mkdir -p image54x54/9.0x
mkdir -p image54x54/10.0x

for file in *.svg; do
  image="${file%.*}"
  echo "Processing $image..."

  /Applications/Inkscape.app/Contents/MacOS/inkscape -w 42 -h 42 $image.svg -o image42x42/$image.png
  /Applications/Inkscape.app/Contents/MacOS/inkscape -w 84 -h 84 $image.svg -o image42x42/2.0x/$image.png
  /Applications/Inkscape.app/Contents/MacOS/inkscape -w 126 -h 126 $image.svg -o image42x42/3.0x/$image.png
  /Applications/Inkscape.app/Contents/MacOS/inkscape -w 168 -h 168 $image.svg -o image42x42/4.0x/$image.png
  /Applications/Inkscape.app/Contents/MacOS/inkscape -w 210 -h 210 $image.svg -o image42x42/5.0x/$image.png
  /Applications/Inkscape.app/Contents/MacOS/inkscape -w 252 -h 252 $image.svg -o image42x42/6.0x/$image.png
  /Applications/Inkscape.app/Contents/MacOS/inkscape -w 294 -h 294 $image.svg -o image42x42/7.0x/$image.png
  /Applications/Inkscape.app/Contents/MacOS/inkscape -w 336 -h 336 $image.svg -o image42x42/8.0x/$image.png
  /Applications/Inkscape.app/Contents/MacOS/inkscape -w 378 -h 378 $image.svg -o image42x42/9.0x/$image.png
  /Applications/Inkscape.app/Contents/MacOS/inkscape -w 420 -h 420 $image.svg -o image42x42/10.0x/$image.png

  /Applications/Inkscape.app/Contents/MacOS/inkscape -w 54 -h 54 $image.svg -o image54x54/$image.png
  /Applications/Inkscape.app/Contents/MacOS/inkscape -w 108 -h 108 $image.svg -o image54x54/2.0x/$image.png
  /Applications/Inkscape.app/Contents/MacOS/inkscape -w 162 -h 162 $image.svg -o image54x54/3.0x/$image.png
  /Applications/Inkscape.app/Contents/MacOS/inkscape -w 216 -h 216 $image.svg -o image54x54/4.0x/$image.png
  /Applications/Inkscape.app/Contents/MacOS/inkscape -w 270 -h 270 $image.svg -o image54x54/5.0x/$image.png
  /Applications/Inkscape.app/Contents/MacOS/inkscape -w 324 -h 324 $image.svg -o image54x54/6.0x/$image.png
  /Applications/Inkscape.app/Contents/MacOS/inkscape -w 378 -h 378 $image.svg -o image54x54/7.0x/$image.png
  /Applications/Inkscape.app/Contents/MacOS/inkscape -w 432 -h 432 $image.svg -o image54x54/8.0x/$image.png
  /Applications/Inkscape.app/Contents/MacOS/inkscape -w 486 -h 486 $image.svg -o image54x54/9.0x/$image.png
  /Applications/Inkscape.app/Contents/MacOS/inkscape -w 540 -h 540 $image.svg -o image54x54/10.0x/$image.png
done
