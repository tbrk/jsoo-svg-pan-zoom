LIB=../lib
JSOO=js_of_ocaml
OCAMLC=ocamlfind ocamlc

EXAMPLES=inline.ml multiinstance.ml limitpan.ml

all: $(EXAMPLES:.ml=.js)

clean:
	-@rm -rf $(EXAMPLES:.ml=.cmo) $(EXAMPLES:.ml=.cmi) \
		 $(EXAMPLES:.ml=.byte) $(EXAMPLES:.ml=.js)

.SUFFIXES : .js .byte .cmi .cmo

%.js : %.byte
	$(JSOO) -o $@ $<

%.byte : %.ml
	$(OCAMLC) -package js_of_ocaml \
		  -package js_of_ocaml.ppx \
		  -linkpkg -I $(LIB) \
	    	  $(LIB)/svgpanzoom.cmo $< -o $@

