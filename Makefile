default: paper

paper:
	latexmk -r latexmkrc -pdf -pvc panacea.lhs

clean:
	latexmk -CA
