import System.Environment
import RQLTokens
import RQLGrammar

main :: IO ()
main = do
          x <- getArgs
          y <- readFile (head x)
          print $ (parseCalc . alexScanTokens) y
          

