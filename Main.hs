import System.Environment
import RQLTokens
import RQLGrammar
import Data.List

main :: IO ()
main = do
          x <- getArgs
          y <- readFile (head x)
          --print $ alexScanTokens y
          print $ (sortBy sortAlph (changeOccurancesLoop ((parseCalc . alexScanTokens) y) ((parseCalc . alexScanTokens) y)))

sortAlph :: (Ord a1, Ord a2) => (a1, a2, c1) -> (a1, a2, c2) -> Ordering
sortAlph (a, b, c) (x, y, z)
  | a < x = LT
  | a > x = GT
  | a == x = compare b y

removeEmptyTriples :: [(String, String)] -> [(String, String)]
removeEmptyTriples [] = []
removeEmptyTriples (t:tri) | t == ("","") = removeEmptyTriples tri
                           | otherwise = t : removeEmptyTriples tri

findVarLoop :: [TurtleExp] -> [(String, String)]
findVarLoop [] = []
findVarLoop (e:expr) = findVar e : findVarLoop expr

findVar :: TurtleExp -> (String, String)
findVar (Base (AbsExpr st)) = ("base", getAbsOutputString st)
findVar _ = ("","")

findPrefixesLoop :: [TurtleExp] -> [(String, String)] -> [(String, String)]
findPrefixesLoop [] _ = []
findPrefixesLoop (e:expr) env = findPrefixes e en : findPrefixesLoop expr env
                             where en = removeEmptyTriples env


findPrefixes :: TurtleExp -> [(String, String)] -> (String, String)
findPrefixes (Prefix (pr) (AbsExpr st)) env = (pr, getAbsOutputString st)
findPrefixes (Prefix (pr) (URIExpr st)) env = (pr, ((lookValue "base" env)++st))
findPrefixes _ env= ("", "")

finaliseEnv :: [(String, String)] -> [(String, String)] -> [(String, String)]
finaliseEnv [] [] = []
finaliseEnv [] ys = removeEmptyTriples ys
finaliseEnv xs [] = removeEmptyTriples xs
finaliseEnv xs ys = (removeEmptyTriples xs) ++ (removeEmptyTriples ys)

lookValue :: String -> [(String, String)] -> String
lookValue a [] = error "non existing variable"
lookValue a (x:xs) | a == (fst(x)) = snd(x)
                   | otherwise = lookValue a xs

changeOccurancesLoop :: [TurtleExp] -> [TurtleExp]-> [(String, String, String)]
changeOccurancesLoop [] copy = []
changeOccurancesLoop ((Base (AbsExpr e)):xs) copy = changeOccurancesLoop xs copy
changeOccurancesLoop ((Prefix (pr) (AbsExpr e)):xs) copy = changeOccurancesLoop xs copy
changeOccurancesLoop ((Prefix (pr) (URIExpr e)):xs) copy = changeOccurancesLoop xs copy
changeOccurancesLoop (l@(ObjMTriple x y z):xs) copy =
                        (changeOccurancesList l (finaliseEnv (findVarLoop copy) (findPrefixesLoop copy (findVarLoop copy)))) ++ (changeOccurancesLoop xs copy)
changeOccurancesLoop (l@(PredObjMTriple x y):xs) copy =
                        (changeOccurancesList l (finaliseEnv (findVarLoop copy) (findPrefixesLoop copy (findVarLoop copy)))) ++ (changeOccurancesLoop xs copy)
changeOccurancesLoop (x:xs) copy = (changeOccurances x (finaliseEnv (findVarLoop copy) (findPrefixesLoop copy (findVarLoop copy)))) : (changeOccurancesLoop xs copy)

changeOccurances :: TurtleExp -> [(String, String)] -> (String, String, String)
changeOccurances (Triple (URIExpr x) (URIExpr y) (URI z)) env = ((a++x), (a++y), (a++z))
                                                               where a = lookValue "base" env
changeOccurances (Triple (URIExpr x) (URIExpr y) (Bool z)) env = ((a++x), (a++y), (show z))
                                                               where a = lookValue "base" env 
changeOccurances (Triple (URIExpr x) (URIExpr y) (Int z)) env = ((a++x), (a++y), (show z))
                                                               where a = lookValue "base" env 
changeOccurances (Triple (URIExpr x) (URIExpr y) (PlusInt z)) env = ((a++x), (a++y), ("+"++show z))
                                                               where a = lookValue "base" env 
changeOccurances (Triple (URIExpr x) (URIExpr y) (MinusInt z)) env = ((a++x), (a++y), ("-"++show z))
                                                               where a = lookValue "base" env 
changeOccurances (Triple (URIExpr x) (URIExpr y) (String z)) env = ((a++x), (a++y), (z))
                                                               where a = lookValue "base" env 
changeOccurances (Triple (URIExpr x) (URIExpr y) (AbsURI z)) env = ((a++x), (a++y), (getAbsOutputString z))
                                                               where a = lookValue "base" env 
                                                               

changeOccurances (Triple (AbsExpr x) (AbsExpr y) (URI z)) env = ((getAbsOutputString x), (getAbsOutputString y), (a++z))
                                                               where a = lookValue "base" env
changeOccurances (Triple (AbsExpr x) (AbsExpr y) (Bool z)) env = ((getAbsOutputString x), (getAbsOutputString y), (show z))
changeOccurances (Triple (AbsExpr x) (AbsExpr y) (Int z)) env = ((getAbsOutputString x), (getAbsOutputString y), (show z))
changeOccurances (Triple (AbsExpr x) (AbsExpr y) (PlusInt z)) env = ((getAbsOutputString x), (getAbsOutputString y), ("+"++show z))
changeOccurances (Triple (AbsExpr x) (AbsExpr y) (MinusInt z)) env = ((getAbsOutputString x), (getAbsOutputString y), ("-"++show z))
changeOccurances (Triple (AbsExpr x) (AbsExpr y) (String z)) env = ((getAbsOutputString x), (getAbsOutputString y), (z))
changeOccurances (Triple (AbsExpr x) (AbsExpr y) (AbsURI z)) env = ((getAbsOutputString x), (getAbsOutputString y), (getAbsOutputString z))


changeOccurances (Triple (AbsExpr x) (URIExpr y) (URI z)) env = ((getAbsOutputString x), (a++y), (a++z))
                                                               where a = lookValue "base" env
changeOccurances (Triple (AbsExpr x) (URIExpr y) (Bool z)) env = ((getAbsOutputString x), (a++y), (show z))
                                                               where a = lookValue "base" env 
changeOccurances (Triple (AbsExpr x) (URIExpr y) (Int z)) env = ((getAbsOutputString x), (a++y), (show z))
                                                               where a = lookValue "base" env 
changeOccurances (Triple (AbsExpr x) (URIExpr y) (PlusInt z)) env = ((getAbsOutputString x), (a++y), ("+"++show z))
                                                               where a = lookValue "base" env 
changeOccurances (Triple (AbsExpr x) (URIExpr y) (MinusInt z)) env = ((getAbsOutputString x), (a++y), ("-"++show z))
                                                               where a = lookValue "base" env 
changeOccurances (Triple (AbsExpr x) (URIExpr y) (String z)) env = ((getAbsOutputString x), (a++y), (z))
                                                               where a = lookValue "base" env 
changeOccurances (Triple (AbsExpr x) (URIExpr y) (AbsURI z)) env = ((getAbsOutputString x), (a++y), (getAbsOutputString z))
                                                               where a = lookValue "base" env 


changeOccurances (Triple (URIExpr x) (AbsExpr y) (URI z)) env = ((a++x), (getAbsOutputString y), (a++z))
                                                               where a = lookValue "base" env
changeOccurances (Triple (URIExpr x) (AbsExpr y) (Bool z)) env = ((a++x), (getAbsOutputString y), (show z))
                                                               where a = lookValue "base" env 
changeOccurances (Triple (URIExpr x) (AbsExpr y) (Int z)) env = ((a++x), (getAbsOutputString y), (show z))
                                                               where a = lookValue "base" env 
changeOccurances (Triple (URIExpr x) (AbsExpr y) (PlusInt z)) env = ((a++x), (getAbsOutputString y), ("+"++show z))
                                                               where a = lookValue "base" env 
changeOccurances (Triple (URIExpr x) (AbsExpr y) (MinusInt z)) env = ((a++x), (getAbsOutputString y), ("-"++show z))
                                                               where a = lookValue "base" env 
changeOccurances (Triple (URIExpr x) (AbsExpr y) (String z)) env = ((a++x), (getAbsOutputString y), (z))
                                                               where a = lookValue "base" env 
changeOccurances (Triple (URIExpr x) (AbsExpr y) (AbsURI z)) env = ((a++x), (getAbsOutputString y), (getAbsOutputString z))
                                                               where a = lookValue "base" env


changeOccurances (SubPrefix a x b y c z) env = ((r++x), (q++y), (l++z))
                                            where r = lookValue a env
                                                  q = lookValue b env
                                                  l = lookValue c env


changeOccurancesList :: TurtleExp -> [(String, String)] -> [(String, String, String)]
-- ObjMTriple -------------------------------------------------------------------------------------------------------------------
changeOccurancesList (ObjMTriple _ _ []) env = []

changeOccurancesList (ObjMTriple (URIExpr x) (URIExpr y) (URI z: xs)) env = ((a++x), (a++y), (a++z)) :
                                                           (changeOccurancesList (ObjMTriple (URIExpr x) (URIExpr y) (xs)) env)
                                                                        where a = lookValue "base" env
changeOccurancesList (ObjMTriple (URIExpr x) (URIExpr y) (Bool z: xs)) env = ((a++x), (a++y), (show z)) :
                                                           (changeOccurancesList (ObjMTriple (URIExpr x) (URIExpr y) (xs)) env)
                                                                        where a = lookValue "base" env
changeOccurancesList (ObjMTriple (URIExpr x) (URIExpr y) (Int z: xs)) env = ((a++x), (a++y), (show z)) :
                                                           (changeOccurancesList (ObjMTriple (URIExpr x) (URIExpr y) (xs)) env)
                                                                        where a = lookValue "base" env
changeOccurancesList (ObjMTriple (URIExpr x) (URIExpr y) (PlusInt z: xs)) env = ((a++x), (a++y), ("+"++show z)) :
                                                           (changeOccurancesList (ObjMTriple (URIExpr x) (URIExpr y) (xs)) env)
                                                                        where a = lookValue "base" env                                                                                                        
changeOccurancesList (ObjMTriple (URIExpr x) (URIExpr y) (MinusInt z: xs)) env = ((a++x), (a++y), ("-"++show z)) :
                                                           (changeOccurancesList (ObjMTriple (URIExpr x) (URIExpr y) (xs)) env)
                                                                        where a = lookValue "base" env
changeOccurancesList (ObjMTriple (URIExpr x) (URIExpr y) (String z: xs)) env = ((a++x), (a++y), (z)) :
                                                           (changeOccurancesList (ObjMTriple (URIExpr x) (URIExpr y) (xs)) env)
                                                                        where a = lookValue "base" env
changeOccurancesList (ObjMTriple (URIExpr x) (URIExpr y) (AbsURI z: xs)) env = ((a++x), (a++y), (getAbsOutputString z)) :
                                                           (changeOccurancesList (ObjMTriple (URIExpr x) (URIExpr y) (xs)) env)
                                                                        where a = lookValue "base" env       


changeOccurancesList (ObjMTriple (AbsExpr x) (AbsExpr y) (URI z: xs)) env = ((getAbsOutputString x), (getAbsOutputString y), (a++z)) :
                                                           (changeOccurancesList (ObjMTriple (AbsExpr x) (AbsExpr y) (xs)) env)
                                                                        where a = lookValue "base" env
changeOccurancesList (ObjMTriple (AbsExpr x) (AbsExpr y) (Bool z: xs)) env = ((getAbsOutputString x), (getAbsOutputString y), (show z)) :
                                                           (changeOccurancesList (ObjMTriple (AbsExpr x) (AbsExpr y) (xs)) env)
                                                                        where a = lookValue "base" env
changeOccurancesList (ObjMTriple (AbsExpr x) (AbsExpr y) (Int z: xs)) env = ((getAbsOutputString x), (getAbsOutputString y), (show z)) :
                                                           (changeOccurancesList (ObjMTriple (AbsExpr x) (AbsExpr y) (xs)) env)
                                                                        where a = lookValue "base" env
changeOccurancesList (ObjMTriple (AbsExpr x) (AbsExpr y) (PlusInt z: xs)) env = ((getAbsOutputString x), (getAbsOutputString y), ("+"++show z)) :
                                                           (changeOccurancesList (ObjMTriple (AbsExpr x) (AbsExpr y) (xs)) env)
                                                                        where a = lookValue "base" env                                                                                                        
changeOccurancesList (ObjMTriple (AbsExpr x) (AbsExpr y) (MinusInt z: xs)) env = ((getAbsOutputString x), (getAbsOutputString y), ("-"++show z)) :
                                                           (changeOccurancesList (ObjMTriple (AbsExpr x) (AbsExpr y) (xs)) env)
                                                                        where a = lookValue "base" env
changeOccurancesList (ObjMTriple (AbsExpr x) (AbsExpr y) (String z: xs)) env = ((getAbsOutputString x), (getAbsOutputString y), (z)) :
                                                           (changeOccurancesList (ObjMTriple (AbsExpr x) (AbsExpr y) (xs)) env)
                                                                        where a = lookValue "base" env
changeOccurancesList (ObjMTriple (AbsExpr x) (AbsExpr y) (AbsURI z: xs)) env = ((getAbsOutputString x), (getAbsOutputString y), (getAbsOutputString z)) :
                                                           (changeOccurancesList (ObjMTriple (AbsExpr x) (AbsExpr y) (xs)) env)
                                                                        where a = lookValue "base" env   


changeOccurancesList (ObjMTriple (AbsExpr x) (URIExpr y) (URI z: xs)) env = ((getAbsOutputString x), (a++y), (a++z)) :
                                                           (changeOccurancesList (ObjMTriple (AbsExpr x) (URIExpr y) (xs)) env)
                                                                        where a = lookValue "base" env
changeOccurancesList (ObjMTriple (AbsExpr x) (URIExpr y) (Bool z: xs)) env = ((getAbsOutputString x), (a++y), (show z)) :
                                                           (changeOccurancesList (ObjMTriple (AbsExpr x) (URIExpr y) (xs)) env)
                                                                        where a = lookValue "base" env
changeOccurancesList (ObjMTriple (AbsExpr x) (URIExpr y) (Int z: xs)) env = ((getAbsOutputString x), (a++y), (show z)) :
                                                           (changeOccurancesList (ObjMTriple (AbsExpr x) (URIExpr y) (xs)) env)
                                                                        where a = lookValue "base" env
changeOccurancesList (ObjMTriple (AbsExpr x) (URIExpr y) (PlusInt z: xs)) env = ((getAbsOutputString x), (a++y), ("+"++show z)) :
                                                           (changeOccurancesList (ObjMTriple (AbsExpr x) (URIExpr y) (xs)) env)
                                                                        where a = lookValue "base" env                                                                                                        
changeOccurancesList (ObjMTriple (AbsExpr x) (URIExpr y) (MinusInt z: xs)) env = ((getAbsOutputString x), (a++y), ("-"++show z)) :
                                                           (changeOccurancesList (ObjMTriple (AbsExpr x) (URIExpr y) (xs)) env)
                                                                        where a = lookValue "base" env
changeOccurancesList (ObjMTriple (AbsExpr x) (URIExpr y) (String z: xs)) env = ((getAbsOutputString x), (a++y), (z)) :
                                                           (changeOccurancesList (ObjMTriple (AbsExpr x) (URIExpr y) (xs)) env)
                                                                        where a = lookValue "base" env
changeOccurancesList (ObjMTriple (AbsExpr x) (URIExpr y) (AbsURI z: xs)) env = ((getAbsOutputString x), (a++y), (getAbsOutputString z)) :
                                                           (changeOccurancesList (ObjMTriple (AbsExpr x) (URIExpr y) (xs)) env)
                                                                        where a = lookValue "base" env 


changeOccurancesList (ObjMTriple (URIExpr x) (AbsExpr y) (URI z: xs)) env = ((a++x), (getAbsOutputString y), (a++z)) :
                                                           (changeOccurancesList (ObjMTriple (URIExpr x) (AbsExpr y) (xs)) env)
                                                                        where a = lookValue "base" env
changeOccurancesList (ObjMTriple (URIExpr x) (AbsExpr y) (Bool z: xs)) env = ((a++x), (getAbsOutputString y), (show z)) :
                                                           (changeOccurancesList (ObjMTriple (URIExpr x) (AbsExpr y) (xs)) env)
                                                                        where a = lookValue "base" env
changeOccurancesList (ObjMTriple (URIExpr x) (AbsExpr y) (Int z: xs)) env = ((a++x), (getAbsOutputString y), (show z)) :
                                                           (changeOccurancesList (ObjMTriple (URIExpr x) (AbsExpr y) (xs)) env)
                                                                        where a = lookValue "base" env
changeOccurancesList (ObjMTriple (URIExpr x) (AbsExpr y) (PlusInt z: xs)) env = ((a++x), (getAbsOutputString y), ("+"++show z)) :
                                                           (changeOccurancesList (ObjMTriple (URIExpr x) (AbsExpr y) (xs)) env)
                                                                        where a = lookValue "base" env                                                                                                        
changeOccurancesList (ObjMTriple (URIExpr x) (AbsExpr y) (MinusInt z: xs)) env = ((a++x), (getAbsOutputString y), ("-"++show z)) :
                                                           (changeOccurancesList (ObjMTriple (URIExpr x) (AbsExpr y) (xs)) env)
                                                                        where a = lookValue "base" env
changeOccurancesList (ObjMTriple (URIExpr x) (AbsExpr y) (String z: xs)) env = ((a++x), (getAbsOutputString y), (z)) :
                                                           (changeOccurancesList (ObjMTriple (URIExpr x) (AbsExpr y) (xs)) env)
                                                                        where a = lookValue "base" env
changeOccurancesList (ObjMTriple (URIExpr x) (AbsExpr y) (AbsURI z: xs)) env = ((a++x), (getAbsOutputString y), (getAbsOutputString z)) :
                                                           (changeOccurancesList (ObjMTriple (URIExpr x) (AbsExpr y) (xs)) env)
                                                                        where a = lookValue "base" env  


-- PredObjMTriple -----------------------------------------------------------------------------------------------------------------------

changeOccurancesList (PredObjMTriple (URIExpr x) []) env = []
changeOccurancesList (PredObjMTriple (AbsExpr x) []) env = []
changeOccurancesList (PredObjMTriple (URIExpr x) (((URIExpr y), []):ys)) env = changeOccurancesList (PredObjMTriple (URIExpr x) ys) env

changeOccurancesList (PredObjMTriple (URIExpr x) (((URIExpr y), ((URI z):zs)):ys)) env = ((a++x), (a++y), (a++z)) :
                                                                  (changeOccurancesList (PredObjMTriple (URIExpr x) (((URIExpr y), (zs)):ys)) env)
                                                                                     where a = lookValue "base" env
changeOccurancesList (PredObjMTriple (URIExpr x) (((URIExpr y), ((Bool z):zs)):ys)) env = ((a++x), (a++y), (show z)) :
                                                                  (changeOccurancesList (PredObjMTriple (URIExpr x) (((URIExpr y), (zs)):ys)) env)
                                                                                     where a = lookValue "base" env
changeOccurancesList (PredObjMTriple (URIExpr x) (((URIExpr y), ((Int z):zs)):ys)) env = ((a++x), (a++y), (show z)) :
                                                                  (changeOccurancesList (PredObjMTriple (URIExpr x) (((URIExpr y), (zs)):ys)) env)
                                                                                     where a = lookValue "base" env
changeOccurancesList (PredObjMTriple (URIExpr x) (((URIExpr y), ((PlusInt z):zs)):ys)) env = ((a++x), (a++y), ("+"++show z)) :
                                                                  (changeOccurancesList (PredObjMTriple (URIExpr x) (((URIExpr y), (zs)):ys)) env)
                                                                                     where a = lookValue "base" env
changeOccurancesList (PredObjMTriple (URIExpr x) (((URIExpr y), ((MinusInt z):zs)):ys)) env = ((a++x), (a++y), ("-"++show z)) :
                                                                  (changeOccurancesList (PredObjMTriple (URIExpr x) (((URIExpr y), (zs)):ys)) env)
                                                                                     where a = lookValue "base" env
changeOccurancesList (PredObjMTriple (URIExpr x) (((URIExpr y), ((String z):zs)):ys)) env = ((a++x), (a++y), (z)) :
                                                                  (changeOccurancesList (PredObjMTriple (URIExpr x) (((URIExpr y), (zs)):ys)) env)
                                                                                     where a = lookValue "base" env
changeOccurancesList (PredObjMTriple (URIExpr x) (((URIExpr y), ((AbsURI z):zs)):ys)) env = ((a++x), (a++y), (getAbsOutputString z)) :
                                                                  (changeOccurancesList (PredObjMTriple (URIExpr x) (((URIExpr y), (zs)):ys)) env)
                                                                                     where a = lookValue "base" env   


changeOccurancesList (PredObjMTriple (AbsExpr x) (((AbsExpr y), []):ys)) env = changeOccurancesList (PredObjMTriple (AbsExpr x) ys) env

changeOccurancesList (PredObjMTriple (AbsExpr x) (((AbsExpr y), ((URI z):zs)):ys)) env = ((getAbsOutputString x), (getAbsOutputString y), (a++z)) :
                                                                  (changeOccurancesList (PredObjMTriple (AbsExpr x) (((AbsExpr y), (zs)):ys)) env)
                                                                                     where a = lookValue "base" env
changeOccurancesList (PredObjMTriple (AbsExpr x) (((AbsExpr y), ((Bool z):zs)):ys)) env = ((getAbsOutputString x), (getAbsOutputString y), (show z)) :
                                                                  (changeOccurancesList (PredObjMTriple (AbsExpr x) (((AbsExpr y), (zs)):ys)) env)
changeOccurancesList (PredObjMTriple (AbsExpr x) (((AbsExpr y), ((Int z):zs)):ys)) env = ((getAbsOutputString x), (getAbsOutputString y), (show z)) :
                                                                  (changeOccurancesList (PredObjMTriple (AbsExpr x) (((AbsExpr y), (zs)):ys)) env)
changeOccurancesList (PredObjMTriple (AbsExpr x) (((AbsExpr y), ((PlusInt z):zs)):ys)) env = ((getAbsOutputString x), (getAbsOutputString y), ("+"++show z)) :
                                                                  (changeOccurancesList (PredObjMTriple (AbsExpr x) (((AbsExpr y), (zs)):ys)) env)
changeOccurancesList (PredObjMTriple (AbsExpr x) (((AbsExpr y), ((MinusInt z):zs)):ys)) env = ((getAbsOutputString x), (getAbsOutputString y), ("-"++show z)) :
                                                                  (changeOccurancesList (PredObjMTriple (AbsExpr x) (((AbsExpr y), (zs)):ys)) env)
changeOccurancesList (PredObjMTriple (AbsExpr x) (((AbsExpr y), ((String z):zs)):ys)) env = ((getAbsOutputString x), (getAbsOutputString y), (z)) :
                                                                  (changeOccurancesList (PredObjMTriple (AbsExpr x) (((AbsExpr y), (zs)):ys)) env)
changeOccurancesList (PredObjMTriple (AbsExpr x) (((AbsExpr y), ((AbsURI z):zs)):ys)) env = ((getAbsOutputString x), (getAbsOutputString y), (getAbsOutputString z)) :
                                                                  (changeOccurancesList (PredObjMTriple (AbsExpr x) (((AbsExpr y), (zs)):ys)) env)  
 

changeOccurancesList (PredObjMTriple (AbsExpr x) (((URIExpr y), []):ys)) env = changeOccurancesList (PredObjMTriple (AbsExpr x) ys) env

changeOccurancesList (PredObjMTriple (AbsExpr x) (((URIExpr y), ((URI z):zs)):ys)) env = ((getAbsOutputString x), (a++y), (a++z)) :
                                                                  (changeOccurancesList (PredObjMTriple (AbsExpr x) (((URIExpr y), (zs)):ys)) env)
                                                                                     where a = lookValue "base" env
changeOccurancesList (PredObjMTriple (AbsExpr x) (((URIExpr y), ((Bool z):zs)):ys)) env = ((getAbsOutputString x), (a++y), (show z)) :
                                                                  (changeOccurancesList (PredObjMTriple (AbsExpr x) (((URIExpr y), (zs)):ys)) env)
                                                                                     where a = lookValue "base" env
changeOccurancesList (PredObjMTriple (AbsExpr x) (((URIExpr y), ((Int z):zs)):ys)) env = ((getAbsOutputString x), (a++y), (show z)) :
                                                                  (changeOccurancesList (PredObjMTriple (AbsExpr x) (((URIExpr y), (zs)):ys)) env)
                                                                                     where a = lookValue "base" env
changeOccurancesList (PredObjMTriple (AbsExpr x) (((URIExpr y), ((PlusInt z):zs)):ys)) env = ((getAbsOutputString x), (a++y), ("+"++show z)) :
                                                                  (changeOccurancesList (PredObjMTriple (AbsExpr x) (((URIExpr y), (zs)):ys)) env)
                                                                                     where a = lookValue "base" env
changeOccurancesList (PredObjMTriple (AbsExpr x) (((URIExpr y), ((MinusInt z):zs)):ys)) env = ((getAbsOutputString x), (a++y), ("-"++show z)) :
                                                                  (changeOccurancesList (PredObjMTriple (AbsExpr x) (((URIExpr y), (zs)):ys)) env)
                                                                                     where a = lookValue "base" env
changeOccurancesList (PredObjMTriple (AbsExpr x) (((URIExpr y), ((String z):zs)):ys)) env = ((getAbsOutputString x), (a++y), (z)) :
                                                                  (changeOccurancesList (PredObjMTriple (AbsExpr x) (((URIExpr y), (zs)):ys)) env)
                                                                                     where a = lookValue "base" env
changeOccurancesList (PredObjMTriple (AbsExpr x) (((URIExpr y), ((AbsURI z):zs)):ys)) env = ((getAbsOutputString x), (a++y), (getAbsOutputString z)) :
                                                                  (changeOccurancesList (PredObjMTriple (AbsExpr x) (((URIExpr y), (zs)):ys)) env)
                                                                                     where a = lookValue "base" env   
                                                                                                                      
changeOccurancesList (PredObjMTriple (URIExpr x) (((AbsExpr y), []):ys)) env = changeOccurancesList (PredObjMTriple (URIExpr x) ys) env

changeOccurancesList (PredObjMTriple (URIExpr x) (((AbsExpr y), ((URI z):zs)):ys)) env = ((a++x), (getAbsOutputString y), (a++z)) :
                                                                  (changeOccurancesList (PredObjMTriple (URIExpr x) (((AbsExpr y), (zs)):ys)) env)
                                                                                     where a = lookValue "base" env
changeOccurancesList (PredObjMTriple (URIExpr x) (((AbsExpr y), ((Bool z):zs)):ys)) env = ((a++x), (getAbsOutputString y), (show z)) :
                                                                  (changeOccurancesList (PredObjMTriple (URIExpr x) (((AbsExpr y), (zs)):ys)) env)
                                                                                     where a = lookValue "base" env
changeOccurancesList (PredObjMTriple (URIExpr x) (((AbsExpr y), ((Int z):zs)):ys)) env = ((a++x), (getAbsOutputString y), (show z)) :
                                                                  (changeOccurancesList (PredObjMTriple (URIExpr x) (((AbsExpr y), (zs)):ys)) env)
                                                                                     where a = lookValue "base" env
changeOccurancesList (PredObjMTriple (URIExpr x) (((AbsExpr y), ((PlusInt z):zs)):ys)) env = ((a++x), (getAbsOutputString y), ("+"++show z)) :
                                                                  (changeOccurancesList (PredObjMTriple (URIExpr x) (((AbsExpr y), (zs)):ys)) env)
                                                                                     where a = lookValue "base" env
changeOccurancesList (PredObjMTriple (URIExpr x) (((AbsExpr y), ((MinusInt z):zs)):ys)) env = ((a++x), (getAbsOutputString y), ("-"++show z)) :
                                                                  (changeOccurancesList (PredObjMTriple (URIExpr x) (((AbsExpr y), (zs)):ys)) env)
                                                                                     where a = lookValue "base" env
changeOccurancesList (PredObjMTriple (URIExpr x) (((AbsExpr y), ((String z):zs)):ys)) env = ((a++x), (getAbsOutputString y), (z)) :
                                                                  (changeOccurancesList (PredObjMTriple (URIExpr x) (((AbsExpr y), (zs)):ys)) env)
                                                                                     where a = lookValue "base" env
changeOccurancesList (PredObjMTriple (URIExpr x) (((AbsExpr y), ((AbsURI z):zs)):ys)) env = ((a++x), (getAbsOutputString y), (getAbsOutputString z)) :
                                                                  (changeOccurancesList (PredObjMTriple (URIExpr x) (((AbsExpr y), (zs)):ys)) env)
                                                                                     where a = lookValue "base" env   

getAbsOutputString :: String -> String
getAbsOutputString a = "http://" ++ a
