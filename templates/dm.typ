#let dm(
    titre: none,
    problems_name: "Problème",
    numbers: true,
    auteurs: "BONNET Zéphyr, FERRAOUN Rayane, MELLIER Raphaël, MITROI Andrei",
    classe: $1^"ère"1$,
    numero: 0,
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
            text(size: 10pt)[\- #counter(page).display("1 / 1", both: true) \-]
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
        v(0.8em, weak: true)
        box(inset: (left: 1.5em))[
            #text(11pt, weight: "bold")[#counter(heading).display() #it.body]
        ]
    }

    body
}

#let resultat(body) = {
  box(
    stroke: 0.6pt + black,
    radius: 3pt,
    inset: (x: 2pt, y: 7pt),
    baseline: 30%,
    fill: rgb("#fefefe"),
    body
  )
  h(0.2em)
}