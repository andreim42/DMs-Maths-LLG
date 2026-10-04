#let dm(
    titre: none,
    problems_name: "Problème",
    numbers: true,
    auteurs: "BONNET Zéphyr, FERRAOUN Rayane, MELLIER Raphaël, MITROI Andrei",
    classe: $1^"ère"1$,
    numero: 1,
    body,
) = {
    set document(author: auteurs, title: "DM de maths n°" + str(numero))
    set text(lang: "fr", size: 11pt, font: "New Computer Modern")
    set par(justify: true, leading: 0.65em)

    set page(
        paper: "a4",
        margin: (top: 2cm, bottom: 2cm, left: 1.5cm, right: 1.5cm),
        header: align(right)[#text(size: 9pt, fill: luma(100))[#classe]],
        footer: context {
            set align(center)
            text(size: 10pt)[\- #counter(page).display((act, total) => {
                let strAct = if act == 8 { $tau$ } else { str(act) }
                let strTotal = if total == 8 { $tau$ } else { str(total) }
                if act == 8 or total == 8 {
                    [#strAct / #strTotal]
                } else {
                    strAct + " / " + strTotal
                }
            }, both: true) \-]
        }
    )

    show math.lt.eq: math.lt.eq.slant
    show math.gt.eq: math.gt.eq.slant

    show math.equation: it => {
        show regex("\d+\.\d+"): match => {
            show ".": "," + h(0pt)
            match
        }

        show "'": "’"

        it
    }

    let code-theme-path = "tokyonight_night.tmTheme"
    show raw: it => {
        // évite une boucle infinie (demandez à Thomas)
        if it.theme == code-theme-path {
          return it
        }

        if it.text.contains("\n") {
          block(
            fill: rgb("#1d2433"),
            inset: 15pt,
            radius: 15pt,
            width: auto,
            text(
              fill: rgb("#a2aabc"),
              size: 12pt,
              raw(
                theme: code-theme-path,
                block: it.block,
                lang: it.lang,
                align: it.align,
                syntaxes: it.syntaxes,
                tab-size: it.tab-size,
                it.text,
              )
            )
          )
        } else {
          it
        }
    }

    set heading(numbering: (..nums) => {
        let pos = nums.pos()
        if pos.len() == 1 {
            problems_name + " " + numbering(if numbers { "1" } else { "A" }, pos.last())
        } else if pos.len() == 2 {
            "Partie " + numbering("A", pos.last())
        } else if pos.len() == 3 {
            numbering("1)", pos.last())
        } else {
            numbering("a)", pos.last())
        }
    })

    align(center)[
        #block(
            width: 90%,
            stroke: (bottom: 1pt + black),
            inset: (bottom: 10pt),
            [
                #text(20pt, weight: "bold")[
                    DM de Mathématiques n°#numero
                    #if titre != none [ \ #text(16pt)[#titre] ]
                ]
            ]
        )
        #v(5pt)
        #text(12pt, style: "italic", fill: luma(80))[#auteurs]
    ]

    show heading.where(level: 1): it => {
        v(1.5em, weak: true)
        block(
            width: 100%,
            stroke: 0.5pt + black,
            radius: 4pt,
            inset: 8pt,
            fill: luma(250),
            [
                #text(size: 13pt, weight: "bold")[
                    #counter(heading).display(it.numbering)
                    #if it.body != [] [ \- #it.body ]
                ]
            ]
        )
        v(0.5em, weak: true)
    }

    show heading.where(level: 2): it => {
        v(1.2em, weak: true)
        align(center)[
            #rect(
            fill: luma(240),
            radius: 4pt,
            inset: (x: 12pt, y: 5pt),
            [
                #text(size: 11pt, weight: "bold")[
                #counter(heading).display()
                #if it.body != [] [ \- #it.body ]
                ]
            ]
            )
        ]
        v(0.6em, weak: true)
    }

    show heading.where(level: 3): it => {
        v(1em, weak: true)
        
        context {
            let nums = counter(heading).get()
            if nums.len() > 1 and nums.at(2) > 1 {
                line(length: 100%, stroke: 0.5pt + luma(200))
                v(0.5em, weak: true)
            }
        }
        
        box(inset: (left: 0.5em))[
            #text(11pt, weight: "bold")[#counter(heading).display() #it.body]
        ]
    }
    
    show heading.where(level: 4): it => {
        box(inset: (left: 1.5em))[
            #text(11pt, weight: "bold")[#counter(heading).display() #it.body]
        ]
    }

    body
}

#let defunc(name, from, to, var, image) = box(
  baseline: 65%,
  grid(
    columns: (auto, auto),
    column-gutter: 0.4em,
    row-gutter: 0.5em,
    $#name :$, $ #from &-> #to \
                 #var  &mapsto #image $,
  )
)

#let traite-cellule(cell) = {
  if cell.starts-with("$") {
    eval(cell)
  } else {
    cell
  }
}

#let affiche-csv(fichier) = {
  let data = csv("../" + fichier)

  table(
    columns: data.first().len(),

    ..data.map(row =>
      row.map(cell => traite-cellule(cell))
    ).flatten(),
  )
}

#let code(file-path, lang:"python", hide-calls:true, hide-imports: true) = {
  let path = "../" + file-path

  let code_file = read(path)

  if hide-calls {
    if lang == "python" {
      code_file = code_file.trim(
        regex(`if __name__ == "__main__":[\S\s]*`.text),
        at: end,
        repeat: false
      )
    }
  }

  if hide-imports {
    if lang == "python" {
      code_file = code_file.replace(
        regex(`(?m)^(from|import)\b.*(\r?\n)?`.text),
        ""
      )
    }
  }

  code_file = code_file.trim()

  raw(
    code_file,
    lang: lang,
    block: code_file.contains("\n")
  )
}

#let olympiades = box(
    baseline: 20%,
    image("olympiades.svg", height: 1.2em)
)

#import "@preview/fletcher:0.5.8": diagram, node, edge

#let triangle-magique(n1, n2, n3, n4, n5, n6, n7, n8, n9) = align(center)[
  #diagram(
    spacing: 0.75em,
    node-inset: 6pt,
    node-stroke: 1.2pt + black,
    node-fill: white,
    {
      edge((0, 0), (-3, 3), "-")
      edge((-3, 3), (3, 3), "-")
      edge((3, 3), (0, 0), "-")

      node((0, 0), n1)
      node((-1, 1), n2)
      node((-2, 2), n3)
      node((-3, 3), n4)
      node((-1, 3), n5)
      node((1, 3), n6)
      node((3, 3), n7)
      node((2, 2), n8)
      node((1, 1), n9)
    }
  )
]            show ".": "," + h(0pt)
            match
        }

        show "'": "’"

        it
    }

    let code-theme-path = "tokyonight_night.tmTheme"
    show raw: it => {
        // évite une boucle infinie (demandez à Thomas)
        if it.theme == code-theme-path {
          return it
        }

        if it.text.contains("\n") {
          block(
            fill: rgb("#1d2433"),
            inset: 15pt,
            radius: 15pt,
            width: auto,
            text(
              fill: rgb("#a2aabc"),
              size: 12pt,
              raw(
                theme: code-theme-path,
                block: it.block,
                lang: it.lang,
                align: it.align,
                syntaxes: it.syntaxes,
                tab-size: it.tab-size,
                it.text,
              )
            )
          )
        } else {
          it
        }
    }

    set heading(numbering: (..nums) => {
        let pos = nums.pos()
        if pos.len() == 1 {
            problems_name + " " + numbering(if numbers { "1" } else { "A" }, pos.last())
        } else if pos.len() == 2 {
            "Partie " + numbering("A", pos.last())
        } else if pos.len() == 3 {
            numbering("1)", pos.last())
        } else {
            numbering("a)", pos.last())
        }
    })

    align(center)[
        #block(
            width: 90%,
            stroke: (bottom: 1pt + black),
            inset: (bottom: 10pt),
            [
                #text(20pt, weight: "bold")[
                    DM de Mathématiques n°#numero
                    #if titre != none [ \ #text(16pt)[#titre] ]
                ]
            ]
        )
        #v(5pt)
        #text(12pt, style: "italic", fill: luma(80))[#auteurs]
    ]

    show heading.where(level: 1): it => {
        v(1.5em, weak: true)
        block(
            width: 100%,
            stroke: 0.5pt + black,
            radius: 4pt,
            inset: 8pt,
            fill: luma(250),
            [
                #text(size: 13pt, weight: "bold")[
                    #counter(heading).display(it.numbering)
                    #if it.body != [] [ \- #it.body ]
                ]
            ]
        )
        v(0.5em, weak: true)
    }

    show heading.where(level: 2): it => {
        v(1.2em, weak: true)
        align(center)[
            #rect(
            fill: luma(240),
            radius: 4pt,
            inset: (x: 12pt, y: 5pt),
            [
                #text(size: 11pt, weight: "bold")[
                #counter(heading).display()
                #if it.body != [] [ \- #it.body ]
                ]
            ]
            )
        ]
        v(0.6em, weak: true)
    }

    show heading.where(level: 3): it => {
        v(1em, weak: true)
        
        context {
            let nums = counter(heading).get()
            if nums.len() > 1 and nums.at(2) > 1 {
                line(length: 100%, stroke: 0.5pt + luma(200))
                v(0.5em, weak: true)
            }
        }
        
        box(inset: (left: 0.5em))[
            #text(11pt, weight: "bold")[#counter(heading).display() #it.body]
        ]
    }
    
    show heading.where(level: 4): it => {
        box(inset: (left: 1.5em))[
            #text(11pt, weight: "bold")[#counter(heading).display() #it.body]
        ]
    }

    body
}

#let defunc(name, from, to, var, image) = box(
  baseline: 65%,
  grid(
    columns: (auto, auto),
    column-gutter: 0.4em,
    row-gutter: 0.5em,
    $#name :$, $ #from &-> #to \
                 #var  &mapsto #image $,
  )
)

#let traite-cellule(cell) = {
  if cell.starts-with("$") {
    eval(cell)
  } else {
    cell
  }
}

#let affiche-csv(fichier) = {
  let data = csv("../" + fichier)

  table(
    columns: data.first().len(),

    ..data.map(row =>
      row.map(cell => traite-cellule(cell))
    ).flatten(),
  )
}

#let code(file-path, lang:"python", hide-calls:true, hide-imports: true) = {
  let path = "../" + file-path

  let code_file = read(path)

  if hide-calls {
    if lang == "python" {
      code_file = code_file.trim(
        regex(`if __name__ == "__main__":[\S\s]*`.text),
        at: end,
        repeat: false
      )
    }
  }

  if hide-imports {
    if lang == "python" {
      code_file = code_file.replace(
        regex(`(?m)^(from|import)\b.*(\r?\n)?`.text),
        ""
      )
    }
  }

  code_file = code_file.trim()

  raw(
    code_file,
    lang: lang,
    block: code_file.contains("\n")
  )
}

#let olympiades = box(
    baseline: 20%,
    image("olympiades.svg", height: 1.2em)
)

#import "@preview/fletcher:0.5.8": diagram, node, edge
#let triangle-magique(n1, n2, n3, n4, n5, n6, n7, n8, n9) = align(center)[
  #diagram(
    spacing: 0.75em,
    node-inset: 6pt,
    node-stroke: 1.2pt + black,
    node-fill: white,
    {
      edge((0, 0), (-3, 3), "-")
      edge((-3, 3), (3, 3), "-")
      edge((3, 3), (0, 0), "-")

      node((0, 0), n1)
      node((-1, 1), n2)
      node((-2, 2), n3)
      node((-3, 3), n4)
      node((-1, 3), n5)
      node((1, 3), n6)
      node((3, 3), n7)
      node((2, 2), n8)
      node((1, 1), n9)
    }
  )
]                theme: code-theme-path,
                block: it.block,
                lang: it.lang,
                align: it.align,
                syntaxes: it.syntaxes,
                tab-size: it.tab-size,
                it.text,
              )
            )
          )
        } else {
          it
        }
    }

    set heading(numbering: (..nums) => {
        let pos = nums.pos()
        if pos.len() == 1 {
            problems_name + " " + numbering(if numbers { "1" } else { "A" }, pos.last())
        } else if pos.len() == 2 {
            "Partie " + numbering("A", pos.last())
        } else if pos.len() == 3 {
            numbering("1)", pos.last())
        } else {
            numbering("a)", pos.last())
        }
    })

    align(center)[
        #block(
            width: 90%,
            stroke: (bottom: 1pt + black),
            inset: (bottom: 10pt),
            [
                #text(20pt, weight: "bold")[
                    DM de Mathématiques n°#numero
                    #if titre != none [ \ #text(16pt)[#titre] ]
                ]
            ]
        )
        #v(5pt)
        #text(12pt, style: "italic", fill: luma(80))[#auteurs]
    ]

    show heading.where(level: 1): it => {
        v(1.5em, weak: true)
        block(
            width: 100%,
            stroke: 0.5pt + black,
            radius: 4pt,
            inset: 8pt,
            fill: luma(250),
            [
                #text(size: 13pt, weight: "bold")[
                    #counter(heading).display(it.numbering)
                    #if it.body != [] [ \- #it.body ]
                ]
            ]
        )
        v(0.5em, weak: true)
    }

    show heading.where(level: 2): it => {
        v(1.2em, weak: true)
        align(center)[
            #rect(
            fill: luma(240),
            radius: 4pt,
            inset: (x: 12pt, y: 5pt),
            [
                #text(size: 11pt, weight: "bold")[
                #counter(heading).display()
                #if it.body != [] [ \- #it.body ]
                ]
            ]
            )
        ]
        v(0.6em, weak: true)
    }

    show heading.where(level: 3): it => {
        v(1em, weak: true)
        
        context {
            let nums = counter(heading).get()
            if nums.len() > 1 and nums.at(2) > 1 {
                line(length: 100%, stroke: 0.5pt + luma(200))
                v(0.5em, weak: true)
            }
        }
        
        box(inset: (left: 0.5em))[
            #text(11pt, weight: "bold")[#counter(heading).display() #it.body]
        ]
    }
    
    show heading.where(level: 4): it => {
        box(inset: (left: 1.5em))[
            #text(11pt, weight: "bold")[#counter(heading).display() #it.body]
        ]
    }

    body
}

#let defunc(name, from, to, var, image) = box(
  baseline: 65%,
  grid(
    columns: (auto, auto),
    column-gutter: 0.4em,
    row-gutter: 0.5em,
    $#name :$, $ #from &-> #to \
                 #var  &mapsto #image $,
  )
)

#let traite-cellule(cell) = {
  if cell.starts-with("$") {
    eval(cell)
  } else {
    cell
  }
}

#let affiche-csv(fichier) = {
  let data = csv("../" + fichier)

  table(
    columns: data.first().len(),

    ..data.map(row =>
      row.map(cell => traite-cellule(cell))
    ).flatten(),
  )
}

#let code(file-path, lang:"python", hide-calls:true, hide-imports: true) = {
  let path = "../" + file-path

  let code_file = read(path)

  if hide-calls {
    if lang == "python" {
      code_file = code_file.trim(
        regex(`if __name__ == "__main__":[\S\s]*`.text),
        at: end,
        repeat: false
      )
    }
  }

  if hide-imports {
    if lang == "python" {
      code_file = code_file.replace(
        regex(`(?m)^(from|import)\b.*(\r?\n)?`.text),
        ""
      )
    }
  }

  code_file = code_file.trim()

  raw(
    code_file,
    lang: lang,
    block: code_file.contains("\n")
  )
}

#let olympiades = box(
    baseline: 20%,
    image("olympiades.svg", height: 1.2em)
)
