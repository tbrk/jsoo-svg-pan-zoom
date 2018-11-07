
all: svgpanzoom.cmi svgpanzoom.cmo

svgpanzoom.byte: svgpanzoom.cmo svgpanzoom.cmi
	ocamlfind ocamlc \
	    -package js_of_ocaml \
	    -package js_of_ocaml.ppx \
	    -linkpkg $< -o $@

svgpanzoom.cmi: svgpanzoom.mli
	ocamlfind ocamlc -package js_of_ocaml \
			 $<

svgpanzoom.cmo: svgpanzoom.ml svgpanzoom.cmi
	ocamlfind ocamlc -package js_of_ocaml \
			 -package js_of_ocaml.ppx \
			 -linkpkg \
			 -c -o $@ $<

clean:
	-@rm -rf svgpanzoom.cmi svgpanzoom.cmo

