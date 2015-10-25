#!/bin/bash
curl www.worldsurfleague.com/athletes/tour/mct | \
grep -Eo href=\"/athletes/[0-9]+/[^\"]+          \
> partial22.txt
