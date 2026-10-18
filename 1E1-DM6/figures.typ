#import "@preview/cetz:0.3.2"
#import cetz.draw: *

#let vector(from, to, color: black, thickness: 1.4pt, label: none, anchor: "north") = {
  group({
    line(
      from, to,
      mark: (end: "stealth", fill: color, scale: 0.7),
      stroke: (paint: color, thickness: thickness, cap: "round"),
      name: "v"
    )
    if label != none {
      content(
        "v.50%",
        text(fill: color, label),
        anchor: anchor,
        padding: 4pt
      )
    }
  })
}

#let repere(
  env,
  o-legend: $O$,
  vectors: true,
  ticks: false
) = {
  let (xmin, ymin, xmax, ymax) = env

  grid(
    (xmin, ymin), (xmax, ymax),
    step: 1,
    stroke: (paint: luma(225), thickness: 0.5pt)
  )

  let axis-style = (
    stroke: (paint: luma(80), thickness: 0.8pt),
    mark: (end: "stealth", fill: luma(80), scale: 0.6)
  )

  line((xmin - 0.3, 0), (xmax + 0.5, 0), ..axis-style, name: "x-axis")
  line((0, ymin - 0.3), (0, ymax + 0.5), ..axis-style, name: "y-axis")

  content("x-axis.end", $x$, anchor: "west", padding: 3pt)
  content("y-axis.end", $y$, anchor: "south", padding: 3pt)

  if ticks {
    for x in range(xmin, xmax + 1) {
      if x != 0 and (not vectors or x != 1) {
        line((x, -0.08), (x, 0.08), stroke: 0.6pt + luma(100))
        content((x, -0.15), text(size: 0.65em, fill: luma(100), $#x$), anchor: "north")
      }
    }
    for y in range(ymin, ymax + 1) {
      if y != 0 and (not vectors or y != 1) {
        line((-0.08, y), (0.08, y), stroke: 0.6pt + luma(100))
        content((-0.15, y), text(size: 0.65em, fill: luma(100), $#y$), anchor: "east")
      }
    }
  }

  if o-legend != none {
    content(
      (0, 0),
      text(size: 0.8em, fill: luma(60), o-legend),
      anchor: "north-east",
      padding: 3pt
    )
  }

  if vectors {
    vector((0, 0), (1, 0), color: black, label: $arrow(dotless.i)$, anchor: "north")
    vector((0, 0), (0, 1), color: black, label: $arrow(dotless.j)$, anchor: "east")
  }
}

#let point(x, y, name, color: black, anchor: "north-west") = {
  circle((x, y), radius: 2.5pt, fill: color, stroke: 0.7pt + white)
  if name != none {
    content(
      (x, y),
      text(fill: color, size: 0.9em, name),
      anchor: anchor,
      padding: 3.5pt,
      stroke: none,
      fill: white.transparentize(15%)
    )
  }
}

#let droite-tropicale(env, x, y, name, color, size: 1.5pt) = {
  let (xmin, ymin, xmax, ymax) = env
  let m = calc.min(xmax - x, ymax - y)
  let st = (paint: color, thickness: size, cap: "round", join: "round")

  line((xmin, y), (x, y), stroke: st)
  line((x, ymin), (x, y), stroke: st)
  line((x, y), (x + m, y + m), stroke: st)

  point(x, y, name, color: color, anchor: "north-west")
}


#let exemples() = {
  let c-bleu   = rgb("#0284c7")
  let c-rouge  = rgb("#e11d48")
  let c-vert   = rgb("#15803d")
  let c-violet = rgb("#7e22ce")
  let c-noir   = luma(30)

  align(center)[
    #cetz.canvas({
      import cetz.draw: *
      let env = (-8, -8, 8, 8)
      repere(env, o-legend: $(0, 0)$, vectors: true, ticks: false)

      point(-2, 3, $A_1$, color: c-bleu)
      point(0, 5, $B_1$, color: c-bleu)
      droite-tropicale(env, -3, 2, $cal(T)_1(-3; 2)$, c-bleu)

      point(1, 1, $A_2$, color: c-rouge)
      point(3, 4, $B_2$, color: c-rouge)
      droite-tropicale(env, 1, 2, $cal(T)_2(1; 2)$, c-rouge)

      point(2, 1, $A_3$, color: c-vert)
      point(5, 2, $B_3$, color: c-vert)
      droite-tropicale(env, 4, 1, $cal(T)_3(4; 1)$, c-vert)

      point(2, -1, $A_4$, color: c-violet)
      point(6, -4, $B_4$, color: c-violet)
      droite-tropicale(env, 6, -1, $cal(T)_4(6; -1)$, c-violet)

    }, length: 2.5em)
  ]
}