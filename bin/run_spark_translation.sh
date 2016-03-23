#!/usr/bin/env bash

set +x

if [[ -d "pst-extract/spark-emails-translation" ]]; then
    rm -rf "pst-extract/spark-emails-translation"
fi

spark-submit --master local[*] --driver-memory 8g --files spark/moses_translator.py --conf spark.storage.memoryFraction=.8 spark/translation.py pst-extract/spark-emails-with-topics pst-extract/spark-emails-translation --force_language en --translation_mode apertium --moses_server localhost:8080