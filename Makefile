$(eval export TEXINPUTS=$(IEECTEX_PATH)//:$(TMP_TEXINPUTS))
OUT_DIR=build
FIG_DIR=fig
UML_DIR=uml
OUTPUTFILE=git-workflow
DATE=20200313
INPUTFILE=main
todo: $(INPUTFILE).tex
	mkdir -p $(OUT_DIR) $(FIG_DIR) $(UML_DIR)
        # Requires installing plantuml in a customized docker image."
	plantuml -v -o ../$(FIG_DIR) -t png uml/*
	pdflatex -output-directory $(OUT_DIR) -synctex=1 -interaction=nonstopmode -jobname=$(OUTPUTFILE)-$(DATE) $<  || (echo "Document generation failed with code $$?"; exit 1)
	pdflatex -output-directory $(OUT_DIR) -synctex=1 -interaction=nonstopmode -jobname=$(OUTPUTFILE)-$(DATE) $<  || (echo "Document generation failed with code $$?"; exit 1)
	pdflatex -output-directory $(OUT_DIR) -synctex=1 -interaction=nonstopmode -jobname=$(OUTPUTFILE)-$(DATE) $<

clean:
	rm build/ -r
