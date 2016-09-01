(package lambda
[identity
 apply

 select_first
 select_second
 make_pair

 make_triplet
 triplet_first
 triplet_second
 triplet_third

 cond'
 true'
 false'
 not'
 and'
 or']

(define identity
  {A --> A}
  X -> ((/. X X) X))
\* TODO: def self_apply = \s.(s s) *\
(define apply
  {(A --> B) --> A --> B}
  F A -> (F A))
(define select_first
  {A --> B --> A}
  X _ -> X)
(define select_second
  {A --> B --> B}
  _ Y -> Y)
(define make_pair
  {A --> B --> (A --> B --> C) --> C}
  X Y F -> ((F X) Y))

(define make_triplet
  {A --> B --> C --> (A --> B --> C --> D) --> D}
  X Y Z F -> ((F X Y) Z))
(define triplet_first
  {A --> B --> C --> A}
  X _ _ -> X)
(define triplet_second
  {A --> B --> C --> B}
  _ Y _ -> Y)
(define triplet_third
  {A --> B --> C --> C}
  _ _ Z -> Z)

(define cond'
  {A --> B --> (A --> B --> C) --> C}
  X Y F -> ((F X) Y))
(define true'
  {A --> B --> A}
  X -> (select_first X))
(define false'
  {A --> B --> B}
  X -> (select_second X))
(define not'
  \* (/. X ((X false') true')) *\
  {((A --> (B --> B)) --> ((D --> (C --> D)) --> E)) --> E}
  X -> ((X false') true'))
(define and'
  \* (/. X (/. Y ((X Y) false'))) *\
  {(C --> ((A --> (B --> B)) --> D)) --> (C --> D)}
  X Y -> ((X Y) false'))
(define or'
  \* (/. X (/. Y ((X true') Y))) *\
  {((B --> (A --> B)) --> (C --> D)) --> (C --> D)}
  X Y -> ((X true') Y)))
