#import "../templates/dm.typ": dm, olympiades

#dm(
  titre: "Autour de Farey",
  problems_name: "Problème",
  numbers: true,
  auteurs: "BONNET Zéphyr, FERRAOUN Rayane, MELLIER Raphaël, MITROI Andrei",
  classe: $1^"ère"1$,
  numero: 7,
)[
  = #olympiades
  ==
  Soit $x = a/b$ et $y= c/d$ appartenant à $QQ$.
  On pose $x xor y = (a+b)/(c+d)$
  ===
  $x xor x = (a+a)/(b+b) = (2a)/(2b) = a/b = x$
  ===
  $x xor y = (a+b)/(c+d) = (b+a)/(d+c) = y xor x$

  Donc $xor$ est commutative.
  ===
  Soit $z in QQ$ tel que $z = e/f$ avec $e in NN$ et $f in NN^*$
  
  $(x xor y) xor z = (a+b)/(c+d) xor e/f = (a+c+e)/(b+d+f) = a/b xor (c+e)/(d+f) = x xor (y xor z)$

  Donc $xor$ est associative.
  ===
  On a:\ 
  $x xor y=(a+c)/(b+d)=((a+c)b d)/((b+d)b d)=(a b d+b c d)/(b^2d+b d^2)$\
  $x=a/b=(a times d(b+d))/(b times d(b+d))=(a b d+a d^2)/(b^2d+b d^2)$\
  $y=c/d=(c times b(b+d))/(d times b(b+d))=(b^2c+b c d)/(b^2d+b d^2)$

  Supposons que $x<y$:\
  $
  x<y&<==>x-y=0\
  &<==>a/b-c/d=0\
  &<==>(a d-b c)/(b d)=0\
  &<==>a d-b c=0 #text[car] b, d in NN^*\
  &<==>cases(a d<b c, a d< b c)\
  &<==>cases(a d^2<b c d,a b d<b^2c)\
  &<==>cases(a b d+a d^2<a b d+b c d, a b d+b c d<b^2c+b c d)\
  &<==>cases((a b d+a d^2)/(b^2d+b d^2)<(a b d+b c d)/(b^2d+b d^2), (a b d+b c d)/(b^2d+b d^2)<(b^2c+b c d)/(b^2d+b d^2))\
  &<==>cases(x<x xor y,x xor y<y)\
  &<==>x<x xor y<y
  $
  Donc $x<y==>x<x xor y<y$
  ==
  ===
  Supposons que $x = y$.\
  Alors $a/b=c/d$ et $a/b and c/d$ sont irréductibles.\
  Donc $a=c and b=d$\
  Donc $delta(x,y)=a d-b c = a b-b a = 0$
  ===
  $delta(y,x)=vec(c,d)vec(a,b)=c b-d a=-(d a-c b)=-(a d-c b)=-(vec(a,b)vec(c,d))=-delta(x,y)$  
  ===
  Par double implication:\
  Supposons que $delta(x,y)<=-1$
  $
  delta(x,y)<=-1 &==> vec(a b)vec(c d)<=-1\
  &==>a d-b c<=-1\
  &==>(a d-b c)/(b d)<=-1/(b d) #text[car] b d>0\
  &==>a/b-c/d<=-1/(b d)\
  &==>x<=y-1/(b d)\
  &==>x<y #text[car] 0<1/(b d)
  $
  Supposons que $x<y$
  $
  x<y &==> a/b<c/d\
  &==>a/b-c/d<0\
  &==>(a d-b c)/(b d)<0\
  &==>a d-b c<0 #text[car] b c>0\
  &==>(a d-b c)<=-1 #text[car] a d-b c in NN\
  &==>delta(x,y)<=1
  $
  ===
  $
  delta(x, x xor y) &= vec(a,b)vec(a+c,b+d)\
  &=a(b+d)-b(a+c)
  &=a b+a d-b a-b c\
  &=a d-b c\
  &=delta(x,y)\
  &=a d-b c\
  &=a d+c d-b c-c d\
  &=(a+c)d-(b+d)c\
  &=vec(a+c,b+d)vec(c,d)\
  &=delta(x xor y, y)\
  $
  Donc $delta(x,x xor y)=delta(x xor y,y)=delta(x,y)$

  Supposons que $delta(x,y)=1$\
  On pose pgcd$(a+c,b+d)=p$\
  On pose $k=(a+c)/p$ et $k'=(b+d)/p$.\
  $p divides a+c and p divides b+d$ donc $k,k'in NN$\
  Donc $x xor y=k/k'$

  $ 
  delta(x,y)=-1&=delta(x xor y,y)\
  &=vec(k,k')vec(c,d)\
  &=k d-k'c\
  &=d(a+c)/p-c(b+d)/p\
  &=(a d+c d+b c+c d)/p\
  &=(a d-b c)/p\
  &=(vec(a,b)vec(c,d))/p\
  &=(delta(x,y))/p\
  &=-1/p
  $
  Donc $p=1$, donc la fraction est irréductible, car pgcd$(a+c,b+d)=1$
  ==
  ===

  ===

  ===

  ===
  ====

  ====

  ==

  ==
  ===
  ====

  ====

  ===
]