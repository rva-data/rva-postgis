#!/bin/bash

find . -name "*.sql" -print0 | xargs -0 -I {} psql -d richmond -f {} 
