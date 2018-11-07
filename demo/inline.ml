open Js_of_ocaml

module Html = Dom_html
let js = Js.string
let document = Html.window##.document

let by_id id =
  Js.Opt.get (document##getElementById (js id)) (fun () -> assert false)

let start _ =
  let zoomTiger =
    Svgpanzoom.create ~zoomEnabled:true
                      ~controlIconsEnabled:true
                      ~fit:true
                      ~center:true
                      "#demo-tiger"
  in
  (by_id "enable")##.onclick := Html.handler (fun _ ->
      ignore (zoomTiger##enableControlIcons ()); Js._false);
  (by_id "disable")##.onclick := Html.handler (fun _ ->
      ignore (zoomTiger##disableControlIcons ()); Js._false);
  Js._false

let _ =
  Dom_html.window##.onload := Dom_html.handler start

