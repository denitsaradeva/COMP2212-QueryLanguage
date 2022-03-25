import System.Environment
import RQLTokens
import RQLGrammar

main :: IO ()
main = do
          x <- getArgs
          y <- readFile (head x)
          --print $ alexScanTokens y
          print $ (parseCalc . alexScanTokens) y
          
--eval :: [(URIExp, URIExp, Object)] -> [TurtleExp] -> [(URIExp, URIExp, Object)]
--eval l [] = l
--eval l (x:xs) = eval (l ++ [(normalise x)]) xs

normalise :: TurtleExp -> [(URIExp, URIExp, Object)] -> [(URIExp, URIExp, Object)]
normalise (Triple e1 e2 e3) ex = [(e1, e2, e3)]
normalise (ObjMTriple e1 e2 []) ex = ex
normalise (ObjMTriple e1 e2 (e:e3)) ex = normalise (ObjMTriple e1 e2 e3) (ex++[(e1, e2, e)])
normalise (PredObjMTriple e1 []) ex = ex
normalise (PredObjMTriple e1 (e:e2)) ex = normalise (PredObjMTriple e1 e2) (ex++(normalise (ObjMTriple e1 y z) []))
                        where (y,z) = e
