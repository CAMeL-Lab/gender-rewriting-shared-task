#!/bin/bash

# preparing the preds
output_dir=$1
m2_edits_dir=$2
mode=$3

cat $output_dir/arin.to.MM  $output_dir/arin.to.FM \
    $output_dir/arin.to.MF  $output_dir/arin.to.FF \
    > $output_dir/all.pred

eval "$(conda shell.bash hook)"
conda activate gender_rewriting
# normalizing the preds
python utils/normalize.py --input_file $output_dir/all.pred \
                          --output_file $output_dir/all.pred.norm


if [ "$3" = "dev" ]; then
    m2_edits=$m2_edits_dir/dev.m2

elif [ "$3" = "test" ]; then
    m2_edits=$m2_edits_dir/test.m2

else
    printf "Evaluation mode should be either dev or test"
    exit
fi

eval "$(conda shell.bash hook)"
conda activate python2

python m2scorer/scripts/m2scorer.py $output_dir/all.pred.norm $m2_edits


