import System.Environment
import RQLTokens
import RQLGrammar

main :: IO ()
main = do
          x <- getArgs
          y <- readFile (head x)
          print $ (parseCalc . alexScanTokens) y
          
eval :: [(URIExp, URIExp, Object)] -> [TurtleExp] -> [(URIExp, URIExp, Object)]
eval l [] = l
eval l (x:xs) = eval (l ++ [(normalise x)]) xs

normalise :: TurtleExp -> (URIExp, URIExp, Object)
normalise (Triple e1 e2 e3) = (e1, e2, e3)
