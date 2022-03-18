{ 
module RQLGrammar where 
import RQLTokens 
import Data.List
}

%name parseCalc 
%tokentype { RQLToken } 
%error { parseError }
%token 
  int            { TokenInt $$} 
  str            { TokenString $$}
  true           { TokenTrue}
  false          { TokenFalse}
  comma          { TokenComma}
  colon          { TokenColon}
  base           { TokenBase $$}
  prefix         { TokenPrefix $$}
  lURIBracket    { TokenLURIBracket}
  rURIBracket    { TokenRURIBracket}
  dot            { TokenDot}
  semiColon      { TokenSemiColon}
  paren          { TokenParen}
  minus          { TokenMinus}
  plus           { TokenPlus}

%left NEG semiColon 
%right dot comma
%nonassoc true false int str lURIBracket rURIBracket hyphen plus paren base prefix colon
%%
          
Exp : prefix str colon lURIBracket str rURIBracket dot   {Prefix $2 $5}
    | base lURIBracket str rURIBracket dot               {Base $3}
    --| lURIBracket str rURIBracket lURIBracket str rURIBracket lURIBracket str rURIBracket {Triple $2 $5 $8}

    
{ 

parseError :: [RQLToken] -> a
parseError _ = error "Error on tokens: "

data TurtleLiteral = Int Int
                   | String String
                   | Bool Bool
          deriving Show

data TurtleExp = Prefix String String
               | Base String
               | Object TurtleLiteral
               | Subject String
               | Predicate String
               | ObjectList [TurtleLiteral]
               | PredObjList [(String, [TurtleLiteral])]
               | Triple String String TurtleLiteral
               | ObjMTriple String String [TurtleLiteral]
               | PredObjMTriple String [(String, [TurtleLiteral])]
          deriving Show
              
} 
