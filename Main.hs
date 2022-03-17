import System.Environment
import RQLTokens

main :: IO ()
main = do
          putStrLn "Write your program:"  
          program <- getLine  
          print $ (alexScanTokens program)  
          

