#!/bin/sh

DIR=/usr/src/linux-source-3.1/drivers/media/

cd dvb

for f in *; do

  NEW=$(find ${DIR} -name "$f")
  if [ -f "${NEW}" ]; then

    if ! diff "$NEW" "$f" >/dev/null 2>&1 ; then
      #diff -ur "$NEW" "$f"
      echo meld "$NEW" "dvb/$f"
    else
      echo "SAME FILE $NEW dvb/$f"
    fi

  else
    echo "NEW FILE $f"
  fi

done
