#import "../templates/dm.typ": dm, resultat

#dm(
  titre: "Partie entière. Notion de densité",
  problems_name: "Exercice",
  numbers: true,
  auteurs: "BONNET Zéphyr, FERRAOUN Rayane, MELLIER Raphaël, MITROI Andrei",
  classe: $1^"ère"1$,
  numero: 3,
)[

  = Partie entière

  ===

  On a $3/2 < floor.l 5/2 floor.r <= 5/2$ et $floor 5/2 floor.r in ZZ$\
  Donc $floor 5/2 floor.r = 4/2 = 2$

  On a $-pi-1<floor -pi floor.r<=-pi$ et $floor -pi floor.r in ZZ$\
  $-pi-1 approx -4.14$ et $-pi approx-3,14$\
  Donc $floor -pi floor.r = -4$

  On a $(2pi)/7-1<floor (2pi)/7 floor.r<=(2pi)/7$\
  $(2pi)/7 approx 0,9$\
  Donc $floor (2pi)/7 floor.r = 0$

  Le programme ne marche pas sur $RR hyph.minus$.\
  Voici une proposition de correction:

  /*A bien formater, Andrei stp!!!*/
  def partent(x):
    $n=0$
    if $x>=0$:
      while n+1<=x:
        n+=1
    else:
      while n+1<=x:
        n-=1
    return n
  
  === 
  Soit $x in RR$
  ====
  Un décimal est un nombre qu'on peut écrire sous la forme $d/10^n$ avec $d in ZZ, n in NN$\
  Par définition, $floor 10^p x floor.r in ZZ$ et $p in NN$\
  Donc $(floor 10^p x floor.r)/10^p in DD$

  Selon la définition de la partie entière, $floor x floor.r <=x<floor x floor.r +1$\
  
  Donc $floor 10^p x floor.r <= 10^p < floor 10^p x floor.r +1$\
  
  Donc $(floor 10^p x floor.r)/10^p <= (10^p x )/10^p < (floor 10^p x floor.r +1)/10^p$\
  
  Donc $(floor 10^p x floor.r)/10^p <= (10^p x )/10^p < (floor 10^p x floor.r)/10^p +1/10^p$\
  
  ====

  
  = Notion de Densité

  ===

  ====

  ====

  ===

  ====
  
  ====

  ====

  ===

  ====

  ====

  ===

  ====

  ====

  ===

  ====

  ====

  ====

]
