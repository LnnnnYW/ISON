#!/bin/bash

SCRNA="/mnt/c/Work/Ying/P21-processed-20260930T192948Z-1-001/P21-processed/rnap21.h5ad"
SCATAC="/mnt/c/Work/Ying/P21-processed-20260930T192948Z-1-001/P21-processed/atacp21.h5ad"
ST="/mnt/c/Work/Ying/P21-processed-20260930T192948Z-1-001/P21-processed/sprnap21.h5ad"
COORDS="/mnt/c/Work/Ying/P21-processed-20260930T192948Z-1-001/P21-processed/coordsp21.csv"
OUTPUT_DIR="/home/ywan1204/data/ISON/output"

SP_ATAC="/mnt/c/Work/Ying/P21-processed-20260930T192948Z-1-001/P21-processed/spatacp21.h5ad"

LAMBDA1=15
LAMBDA2=0.001
K=8
BATCH_SIZE=512

echo
echo "PHASE 1: TRAIN NMF MODEL"
echo

python run-ison.py --scRNA "$SCRNA" \
                        --scATAC "$SCATAC" \
                        --ST "$ST" \
                        --coords "$COORDS" \
                        --output-dir "$OUTPUT_DIR" \
                        --lambda1 "$LAMBDA1" \
                        --lambda2 "$LAMBDA2" \
                        --K "$K" \
                        --batch_size "$BATCH_SIZE"\

echo
echo "PHASE 2: EVALUATION"
echo


python evaluation.py --st_ATAC "$SP_ATAC" \
                         -o "$OUTPUT_DIR" \
                        


