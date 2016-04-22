[build-menu]
FT_00_LB=render
FT_00_CM=pandoc -sN -r markdown+pipe_tables -w html -o "%d/%e.html" "%d/%f"
FT_00_WD=/home/adam
EX_00_LB=_Execute
EX_00_CM=chromium-browser "%e.html" &
EX_00_WD=/home/adam
FT_01_LB=site-render
FT_01_CM=./render.sh
FT_01_WD=/home/adam/paitu-site/rendering
