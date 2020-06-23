#!/usr/bin/env bash
# CUDA_VISIBLE_DEVICES=1
# CUDA_VISIBLE_DEVICES=1 OMP_NUM_THREADS=4
python -u parsing.py --mode train --config configs/parsing/biaffine.json --num_epochs 400 --batch_size 16 \
 --opt adam --learning_rate 0.001 --lr_decay 0.999995 --beta1 0.9 --beta2 0.9 --eps 1e-4 --grad_clip 5.0 --test_batch_size 4\
 --loss_type token --warmup_steps 40 --reset 20 --weight_decay 0.0 --unk_replace 0.5 \
 --word_embedding "glove" --word_path "../data/glove.6B.100d.txt" --char_embedding random \
 --punctuation '.' '``' "''" ':' ',' \
 --train "../data/train.gold.conll" \
 --dev "../data/dev.gold.conll" \
 --test "../data/test.gold.conll" \
 --model_path "models/parsing/deepbiaf/"
