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

mkdir -p image250x140
mkdir -p image250x140/2.0x
mkdir -p image250x140/3.0x
mkdir -p image250x140/4.0x
mkdir -p image250x140/5.0x
mkdir -p image250x140/6.0x
mkdir -p image250x140/7.0x
mkdir -p image250x140/8.0x
mkdir -p image250x140/9.0x
mkdir -p image250x140/10.0x

for file in *54x54.svg; do
  image="${file%.*}"
  echo "Processing $image..."

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

for file in *250x140.svg; do
  image="${file%.*}"
  echo "Processing $image..."

  /Applications/Inkscape.app/Contents/MacOS/inkscape -w 250 -h 140 $image.svg -o image250x140/$image.png
  /Applications/Inkscape.app/Contents/MacOS/inkscape -w 500 -h 280 $image.svg -o image250x140/2.0x/$image.png
  /Applications/Inkscape.app/Contents/MacOS/inkscape -w 750 -h 420 $image.svg -o image250x140/3.0x/$image.png
  /Applications/Inkscape.app/Contents/MacOS/inkscape -w 1000 -h 560 $image.svg -o image250x140/4.0x/$image.png
  /Applications/Inkscape.app/Contents/MacOS/inkscape -w 1250 -h 700 $image.svg -o image250x140/5.0x/$image.png
  /Applications/Inkscape.app/Contents/MacOS/inkscape -w 1500 -h 840 $image.svg -o image250x140/6.0x/$image.png
  /Applications/Inkscape.app/Contents/MacOS/inkscape -w 1750 -h 980 $image.svg -o image250x140/7.0x/$image.png
  /Applications/Inkscape.app/Contents/MacOS/inkscape -w 2000 -h 1120 $image.svg -o image250x140/8.0x/$image.png
  /Applications/Inkscape.app/Contents/MacOS/inkscape -w 2250 -h 1260 $image.svg -o image250x140/9.0x/$image.png
  /Applications/Inkscape.app/Contents/MacOS/inkscape -w 2500 -h 1400 $image.svg -o image250x140/10.0x/$image.png
done
