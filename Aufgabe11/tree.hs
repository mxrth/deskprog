data Tree = Node Integer [Tree]

exampleTree :: Tree
exampleTree = Node 5 [Node 1 [Node 6 []], Node 8 [] , Node 2 [Node 1 [], Node 4 []] ]

contains :: Tree -> Integer -> Bool
contains (Node b children) a = a == b || or [c `contains` a | c <- children]
