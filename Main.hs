import System.Environment
import RQLTokens
import RQLGrammar

main :: IO ()
main = do
          putStrLn "Write your program:"  
          program <- getLine  
          print $ (parseCalc . alexScanTokens) program)  
          

