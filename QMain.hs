import System.Environment
import RQLQTokens
import RQLQGrammar

main :: IO ()
main = do
          x <- getArgs
          y <- readFile (head x)
          --print $ alexScanTokens y
          print $ (parseQuery . RQLQTokens.alexScanTokens) y