import System.Environment
import RQLTokens
import RQLGrammar

main :: IO ()
main = do
          x <- getArgs
          y <- readFile (head x)
          --print $ alexScanTokens y
          print $ (parseCalc . alexScanTokens) y

removeEmptyTriples :: [(String, String, String)] -> [(String, String, String)]
removeEmptyTriples [] = []
removeEmptyTriples (t:tri) | t == ("","","") = removeEmptyTriples tri
                           | otherwise = t : removeEmptyTriples tri

findVarLoop :: [TurtleExp] -> [(String, String, String)]
findVarLoop [] = []
findVarLoop (e:expr) = findVar e : findVarLoop expr

findVar :: TurtleExp -> (String, String, String)
findVar (Base (AbsExpr st)) = ("Base", "base", "http://"++st)
findVar (Prefix (pr) (AbsExpr st)) = ("Prefix", pr, "http://"++st)
findVar (Prefix (pr) (URIExpr st)) = ("Prefix", pr, st)
findVar _ = ("","","")

findTriples :: TurtleExp -> (String, String, Object)
findTriples (Triple (AbsExpr x) (AbsExpr y) (AbsURI z)) = ("http://"++x, "http://"++y, (AbsURI ("http://"++z)))
findTriples (Triple (AbsExpr x) (AbsExpr y) (URI z)) = ("http://"++x, "http://"++y, (URI z))
findTriples (Triple (AbsExpr x) (AbsExpr y) (String z)) = ("http://"++x, "http://"++y, (String z))
findTriples (Triple (AbsExpr x) (AbsExpr y) (Bool z)) = ("http://"++x, "http://"++y, (Bool z))
findTriples (Triple (AbsExpr x) (AbsExpr y) (Int z)) = ("http://"++x, "http://"++y, (Int z))
findTriples (Triple (AbsExpr x) (AbsExpr y) (PlusInt z)) = ("http://"++x, "http://"++y, (PlusInt z))
findTriples (Triple (AbsExpr x) (AbsExpr y) (MinusInt z)) = ("http://"++x, "http://"++y, (MinusInt z))

findTriples (Triple (URIExpr x) (AbsExpr y) (AbsURI z)) = (x, "http://"++y, (AbsURI ("http://"++z)))
findTriples (Triple (URIExpr x) (AbsExpr y) (URI z)) = (x, "http://"++y, (URI z))
findTriples (Triple (URIExpr x) (AbsExpr y) (String z)) = (x, "http://"++y, (String z))
findTriples (Triple (URIExpr x) (AbsExpr y) (Bool z)) = (x, "http://"++y, (Bool z))
findTriples (Triple (URIExpr x) (AbsExpr y) (Int z)) = (x, "http://"++y, (Int z))
findTriples (Triple (URIExpr x) (AbsExpr y) (PlusInt z)) = (x, "http://"++y, (PlusInt z))
findTriples (Triple (URIExpr x) (AbsExpr y) (MinusInt z)) = (x, "http://"++y, (MinusInt z))

findTriples (Triple (AbsExpr x) (URIExpr y) (AbsURI z)) = ("http://"++x, y, (AbsURI ("http://"++z)))
findTriples (Triple (AbsExpr x) (URIExpr y) (URI z)) = ("http://"++x, y, (URI z))
findTriples (Triple (AbsExpr x) (URIExpr y) (String z)) = ("http://"++x, y, (String z))
findTriples (Triple (AbsExpr x) (URIExpr y) (Bool z)) = ("http://"++x, y, (Bool z))
findTriples (Triple (AbsExpr x) (URIExpr y) (Int z)) = ("http://"++x, y, (Int z))
findTriples (Triple (AbsExpr x) (URIExpr y) (PlusInt z)) = ("http://"++x, y, (PlusInt z))
findTriples (Triple (AbsExpr x) (URIExpr y) (MinusInt z)) = ("http://"++x, y, (MinusInt z))

findTriples (Triple (URIExpr x) (URIExpr y) (AbsURI z)) = (x, y, (AbsURI ("http://"++z)))
findTriples (Triple (URIExpr x) (URIExpr y) (URI z)) = (x, y, (URI z))
findTriples (Triple (URIExpr x) (URIExpr y) (String z)) = (x, y, (String z))
findTriples (Triple (URIExpr x) (URIExpr y) (Bool z)) = (x, y, (Bool z))
findTriples (Triple (URIExpr x) (URIExpr y) (Int z)) = (x, y, (Int z))
findTriples (Triple (URIExpr x) (URIExpr y) (PlusInt z)) = (x, y, (PlusInt z))
findTriples (Triple (URIExpr x) (URIExpr y) (MinusInt z)) = (x, y, (MinusInt z))

findTriplesObjM :: TurtleExp -> [(String, String, Object)]
findTriplesObjM (ObjMTriple (AbsExpr x) (AbsExpr y) []) = []
findTriplesObjM (ObjMTriple (AbsExpr x) (AbsExpr y) (e:expr)) | e == (AbsURI z) = ("http://"++x, "http://"++y, (AbsURI ("http://"++z))) : findTriplesObjM (ObjMTriple (AbsExpr x) (AbsExpr y) expr)
                                                              | e == (URI z) = ("http://"++x, "http://"++y, (URI z)) : findTriplesObjM (ObjMTriple (AbsExpr x) (AbsExpr y) expr)
                                                              | otherwise = ("", "", String "")


-- findVar :: [TurtleExp] -> [(String, String, String)]
-- findVar [] = []
-- findVar (e:exps) | e == (Base (_ st)) = ("Base", "base", "http://"++st) : findVar exps
--                  | e == Prefix pr (AbsExpr st) = ("Prefix", pr, "http://"++st) : findVar exps
--                  | e == Prefix pr (URIExpr st) = ("Prefix", pr, st) : findVar exps
--                  | otherwise = findVar exps

-- data Frame = TBase TurtleExp Environment | TPrefix TurtleExp Environment | TURIExpr String
-- type Kontinuation = [ Frame ]
-- type State = (TurtleExp,Environment,Kontinuation)
-- type Environment = [ (String, TurtleExp) ]

-- --evalLoop :: TurtleExp -> TurtleExp
-- --evalLoop e = evalLoop' (e,[],[])
--  -- where evalLoop' (e,env,k) = if (e' == e) && (isValue e') && (null k) then e' else evalLoop' (e',env',k')
--                     --   where (e',env',k') = eval (e,env,k) 

-- --isValue :: Expr -> Bool
-- --isValue (TmInt _) = True

-- update :: Environment -> String -> TurtleExp -> Environment
-- update env x e = (x,e) : env

-- getValueBinding :: String -> Environment -> (TurtleExp,Environment)
-- getValueBinding x [] = error "Variable binding not found"
-- getValueBinding x ((y,e):env) | x == y  = unpack e
--                               | otherwise = getValueBinding x env

-- unpack :: TurtleExp -> (TurtleExp,Environment)
-- --unpack (Cl x t e env1) = ((TmLambda x t e) , env1)
-- unpack e = (e,[])

-- eval :: State -> State
-- -- eval ((HardString x@("Base")),env,k) = (e',env',k)  where (e',env') = getValueBinding x env
-- eval ((URIExpr x), env, k) =  ((AbsExpr ((getBaseValue $ getValueBinding "Base" env) ++ x)), env, k)
-- eval ((Base e2@(AbsExpr e1)), env, k) = (e2, update env "Base" e1, k)


-- getBaseValue :: (TurtleExp, Environment) -> String
-- getBaseValue ((Base URIExpr e1), env) = e1

-- [Triple (AbsExpr "www.cw.org/subjectA") (AbsExpr "www.cw.org/predicateA") (AbsURI "www.cw.org/objectA"),Base (AbsExpr "www.cw.org/"),Prefix "p" (AbsExpr "www.cw.org/notpprefix/"),SubPrefix "p" "subjectC" "p" "predicateC" "p" "objectC",Prefix "s" (AbsExpr "www.cw.org/sprefix/"),SubPrefix "s" "subjectD" "p" "predicateD" "s" "objectD",Prefix "t" (URIExpr "tprefix/"),SubPrefix "t" "subjectE" "p" "predicateE" "t" "objectE",Triple (URIExpr "prob4B") (URIExpr "testPredA") (Bool True),Triple (URIExpr "prob4D") (URIExpr "testPredB") (URI "prob4E"),Triple (URIExpr "prob4F") (URIExpr "testPredC") (URI "prob4A"),PredObjMTriple (URIExpr "testSubA") [(URIExpr "testPredList",[MinusInt 5]),(URIExpr "testPredList",[Int 10,Int 20]),(URIExpr "testPredList",[Int 20])],ObjMTriple (URIExpr "testSubA") (URIExpr "testObjList") [MinusInt 5,Int 10,Int 20]]