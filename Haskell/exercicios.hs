import Data.List

-- myLast :: (Show a) => [a] -> a
-- myLast [] = error "Don't have a last element"
-- myLast [x] = x
-- myLast (_:xs) = myLast xs

-- first :: (a, b, c) -> a  
-- first (x, _, _) = x  
      
-- second :: (a, b, c) -> b  
-- second (_, y, _) = y  
      
-- third :: (a, b, c) -> c  
-- third (_, _, z) = z


-- tell :: (Show a) => [a] -> String  
-- tell [] = "The list is empty"  
-- tell (x:[]) = "The list has one element: " ++ show x  
-- tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y  
-- tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y 


-- foo :: Integer -> Integer
-- foo 0 = 16
-- foo 1 
--   | "Haskell" > "C++" = 3
--   | otherwise         = 4
-- foo n
--   | n < 0            = 0
--   | n `mod` 17 == 2  = -43
--   | otherwise        = n + 3

-- isEven :: Integer -> Bool
-- isEven n 
--   | n `mod` 2 == 0 = True
--   | otherwise      = False


-- f :: Int -> Int -> Int -> Int
-- f x y z = x + y + z
-- ex17 = f 3 17 8


-------------------------------------------------------------------------------
-- removeItem
--
-- param Int    : Elemento a ser retirado da lista
-- param [Int]  : Lista de elementos a serem retirados
--
-- return [Int] : Lista de elementos sem elemento a ser retirados
-------------------------------------------------------------------------------
removeItem :: Int -> [Int] -> [Int]
removeItem _ []                 = []
removeItem x (y:ys) | x == y    = removeItem x ys
                    | otherwise = y : removeItem x ys


-------------------------------------------------------------------------------
-- listaEscolhe
--
-- param [Int]    : Elementos para se formar um conjunto
-- param Int      : Quantidade de elemento num conjunto
--
-- return [[Int]] : Lista de Conjuntos com a quantidade desejada 
-------------------------------------------------------------------------------
listaEscolhe :: [Int] -> Int -> [[Int]]
listaEscolhe elementos qtd
  | qtd > (length elementos) = [[]]
  | qtd <= 0 = [[]]
  | otherwise = [ elem : restoElem
                | elem <- elementos,
                  restoElem <- listaEscolhe elementos (qtd - 1)]

-------------------------------------------------------------------------------
-- comparaChute
--
-- param [Int]    : Elementos do chute
-- param [Int]    : Quantidade de Bons e Regulares
-- param [[Int]]  : Lista de Conjuntos de possiveis Senhas
--
-- return [[Int]] : Nova Lista de Conjuntos de possiveis Senhas 
-------------------------------------------------------------------------------
comparaChute :: [Int] -> [Int] -> [[Int]] -> [[Int]]
comparaChute _ _ [[]] = [[]]
comparaChute chute br possiveis = [elem
                                  | elem <- possiveis,
                                    comparaSenhaChute chute br elem == True]

-------------------------------------------------------------------------------
-- comparaSenhaChute
--
-- param [Int]    : Conjunto do Chute
-- param [Int]    : Quantidade de Bons e Regulares
-- param [Int]    : Possivel Senha
--
-- return Bool    : Verifica se Possivel Senha daria o
--                  mesmo resultado que o Chute
-------------------------------------------------------------------------------
comparaSenhaChute :: [Int] -> [Int] -> [Int] -> Bool
comparaSenhaChute chute [cBons, cRegulares] outroChute
  | [cBons, cRegulares] == bonsRegulares chute outroChute = True
  | otherwise = False

-------------------------------------------------------------------------------
-- bons
--
-- param [Int]    : Senha Mestra
-- param [Int]    : Senha a ser verificada com a Mestra
--
-- return Int     : Bons da Possivel Senha verificando com a Mestr
-------------------------------------------------------------------------------
bons :: [Int] -> [Int] -> Int
bons [] _ = 0
bons (m:mResto) (s:sResto)
  | m == s = (bons mResto sResto) + 1
  | otherwise = bons mResto sResto

-------------------------------------------------------------------------------
-- regulares
--
-- param [Int]    : Senha Mestra
-- param [Int]    : Senha a ser verificada com a Mestra
-- param Int      : Indice que esta sendo verificado
--
-- return Int     : Regulares da Possivel Senha verificando com a Mestr
-------------------------------------------------------------------------------
regulares :: [Int] -> [Int] -> Int -> Int
regulares _ [] _ = 0
regulares mestre (s:sResto) indice
  | length (elemIndices s (removeItem (mestre!!indice) mestre)) > 0 = (regulares mestre sResto (indice + 1)) + 1
  | otherwise = regulares mestre sResto (indice + 1)

-------------------------------------------------------------------------------
-- bonsRegulares
--
-- param [Int]    : Senha Mestra
-- param [Int]    : Senha a ser verificada com a Mestra
--
-- return [Int]   : Bons e Regulares da Possivel Senha verificando com a Mestr
-------------------------------------------------------------------------------
bonsRegulares :: [Int] -> [Int] -> [Int]
bonsRegulares mestra senha = [bons mestra senha, regulares mestra senha 0]

-- x = listaEscolhe [1,2,3,4,5,6] 4
-- y = [1,1,2,2]
-- z = [1,1]
-- comparaChute y z x
