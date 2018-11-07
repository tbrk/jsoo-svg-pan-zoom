open Js_of_ocaml

module Html = Dom_html
let js = Js.string
let document = Html.window##.document

let by_id id =
  Js.Opt.get (document##getElementById (js id)) (fun () -> assert false)

let start _ =
  ignore (Svgpanzoom.create ~zoomEnabled:true
                            ~controlIconsEnabled:true
                            ~fit:true
                            ~center:true
                            "#demo-tiger");
  ignore (Svgpanzoom.create ~zoomEnabled:true
                            ~controlIconsEnabled:true
                            ~fit:true
                            ~center:true
                            "#demo-penguin");
  ignore (Svgpanzoom.create ~zoomEnabled:true
                            ~controlIconsEnabled:true
                            ~fit:true
                            ~center:true
                            "#pvjs-diagram-2");
  ignore (Svgpanzoom.create ~zoomEnabled:true
                            ~controlIconsEnabled:true
                            ~fit:true
                            ~center:true
                            "#pvjs-diagram-1");
  Js._false

let _ =
  Dom_html.window##.onload := Dom_html.handler start

