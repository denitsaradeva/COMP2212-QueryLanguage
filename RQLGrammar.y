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
  hyphen         { TokenHyphen}
  plus           { TokenPlus}
  --lBracket       { TokenLBracket}
  --rBracket       { TokenRBracket}
  --from           { TokenFrom}
  --select         { TokenSelect}
  --where          { TokenWhere}
  --and            { TokenAnd}
  --or             { TokenOr}
  --not            { TokenNot}
  --end            { TokenEnd}

%left NEG semiColon 
%right dot comma
%nonassoc true false int str lURIBracket rURIBracket hyphen plus paren base prefix colon
%%
          
Exp : URI URI OExp dot                                         { $1 $2 $3}
    | SubPref SubPref SubPref dot                              { $1 $2 $3}
    | URI URI OExpList dot                                     { $1 $2 $3}
    | URI POExpList dot                                        { $1 $2}
    | Annotations dot                                          { $1}

SubPref : str colon str                                        { SubPrefix $1 $3}

URI : lURIBracket str rURIBracket                              { URI $2}
           
Annotations : base URI                                         { Base $2}
            | prefix str colon URI                             { Prefix $2 $4}


OExpList : OExp                                                { [$1]}
         | OExp comma OExpList                                 { ($1:$2)}

POExpList : URI OExp                                           { [$1 : $2]}
          | URI OExp semiColon POExpList                       { ($1 : $2 : $4)}

OExp : int                                                     { Int $1}
     | plus int %prec NEG                                      { Plus $2}
     | hyphen int %prec NEG                                    { Hyphen $2}
     | true                                                    { Bool True}                   
     | false                                                   { Bool False}                                                   
     | paren str paren                                         { String $2}
     | URI                                                     { $1}
    
{ 

--parseError :: [RQLToken] -> a
--parseError _ = error "Error on tokens: "

data RQLExp = Int Int
              | String String
              | Bool Bool
              | URI String
              | Base String
              | Prefix String String
              | SubPrefix String String
              | Plus Int
              | Hyphen Int
        deriving Show
} 
