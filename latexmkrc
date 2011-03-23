$pdf_mode = 1;
$pdflatex = 'lhs2TeX -v --poly %B.lhs > %B.tex; pdflatex -file-line-error -halt-on-error -file-line-error -halt-on-error -synctex=1 --enable-write18 %O %B.tex %B.pdf';
$pdf_previewer = 'open %S';
$pdf_update_method = 0;
$clean_ext = "synctex.gz ptb tex aux bbl";

add_cus_dep('lhs', 'tex', 0, 'cus_dep_require_primary_run');