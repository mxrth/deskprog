data Tree = Leaf Integer | Node Integer [Tree]

exampleTree :: Tree
exampleTree = Node 5 [Node 1 [Leaf 6], Leaf 8, Node 2 [Leaf 1, Leaf 4] ]

contains :: Tree -> Integer -> Bool
contains (Leaf b) a = a == b
contains (Node b children) a = a == b || or [c `contains` a | c <- children]
