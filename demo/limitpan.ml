open Js_of_ocaml

module Html = Dom_html
let js = Js.string
let document = Html.window##.document

let by_id id =
  Js.Opt.get (document##getElementById (js id)) (fun () -> assert false)

let before_pan (this : Svgpanzoom.t Js.t) (ox, oy) (nx, ny) =
  let gutterWidth = 100. in
  let gutterHeight = 100. in
  let sizes = this##getSizes () in
  let leftLimit =
    -.((sizes##.viewBox##.x +. sizes##.viewBox##.width) *. sizes##.realZoom)
      +. gutterWidth
  and rightLimit =
    sizes##.width -. gutterWidth -. (sizes##.viewBox##.x *. sizes##.realZoom)
  and topLimit =
    -.((sizes##.viewBox##.y +. sizes##.viewBox##.height) *. sizes##.realZoom)
      +. gutterHeight
  and bottomLimit =
    sizes##.height -. gutterHeight -. (sizes##.viewBox##.y *. sizes##.realZoom)
  in
  Svgpanzoom.Point
    (max leftLimit (min rightLimit nx), max topLimit (min bottomLimit ny))

let start _ =
  let panZoom =
    Svgpanzoom.create ~zoomEnabled:true
                      ~controlIconsEnabled:true
                      ~fit:true
                      ~center:true
                      ~beforePan:before_pan
                      "#limit-svg"
  in
  (* panZoom##setBeforePan before_pan *)
  Js._false

let _ =
  Dom_html.window##.onload := Dom_html.handler start

