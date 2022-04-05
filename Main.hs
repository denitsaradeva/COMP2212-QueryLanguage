import System.Environment
import RQLTokens
import RQLGrammar

main :: IO ()
main = do
          x <- getArgs
          y <- readFile (head x)
          --print $ alexScanTokens y
          print $ (parseCalc . alexScanTokens) y
          
data Frame = TBase TurtleExp Environment | TPrefix TurtleExp Environment | TURIExpr String
type Kontinuation = [ Frame ]
type State = (TurtleExp,Environment,Kontinuation)
type Environment = [ (String, TurtleExp) ]

--evalLoop :: TurtleExp -> TurtleExp
--evalLoop e = evalLoop' (e,[],[])
 -- where evalLoop' (e,env,k) = if (e' == e) && (isValue e') && (null k) then e' else evalLoop' (e',env',k')
                    --   where (e',env',k') = eval (e,env,k) 

--isValue :: Expr -> Bool
--isValue (TmInt _) = True

update :: Environment -> String -> TurtleExp -> Environment
update env x e = (x,e) : env

getValueBinding :: String -> Environment -> (TurtleExp,Environment)
getValueBinding x [] = error "Variable binding not found"
getValueBinding x ((y,e):env) | x == y  = unpack e
                              | otherwise = getValueBinding x env

unpack :: TurtleExp -> (TurtleExp,Environment)
--unpack (Cl x t e env1) = ((TmLambda x t e) , env1)
unpack e = (e,[])

eval :: State -> State
-- eval ((HardString x@("Base")),env,k) = (e',env',k)  where (e',env') = getValueBinding x env
eval ((URIExpr x), env, k) =  ((AbsExpr ((getBaseValue $ getValueBinding "Base" env) ++ x)), env, k)
eval ((Base e2@(AbsExpr e1)), env, k) = (e2, update env "Base" e1, k)


getBaseValue :: (TurtleExp, Environment) -> String
getBaseValue ((Base URIExpr e1), env) = e1