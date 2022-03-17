{ 
module RQLTokens where 
}

%wrapper "basic" 
$digit = 0-9     
-- digits 
$alpha = [a-zA-Z]    
-- alphabetic characters

tokens :-
 $white+                                   ; 
 "--".*                                    ;
 true                                      {\s -> TokenTrue}
 false                                     {\s -> TokenFalse}
 FROM                                      {\s -> TokenFrom}
 SELECT                                    {\s -> TokenSelect}
 WHERE                                     {\s -> TokenWhere}
 AND                                       {\s -> TokenAnd}
 OR                                        {\s -> TokenOr}
 NOT                                       {\s -> TokenNot}
 END                                       {\s -> TokenEnd}
 \,                                        {\s -> TokenComma}
 \:                                        {\s -> TokenColon}
 \@base                                    {\s -> TokenBase s}
 \@prefix                                  {\s -> TokenPrefix s}
 \<                                        {\s -> TokenLURIBracket}
 \>                                        {\s -> TokenRURIBracket}
 \.                                        {\s -> TokenDot}
 \;                                        {\s -> TokenSemiColon}
 \"                                        {\s -> TokenParen}
 \-                                        {\s -> TokenHyphen}
 \(                                        {\s -> TokenLBracket}
 \)                                        {\s -> TokenRBracket}
 $digit+                                   {\s -> TokenInt (read s)} 
 $alpha [$alpha $digit \_ \â€™\/\:\.\#]*   {\s -> TokenString s } 
 
 
{ 
data RQLToken = 
  TokenTrue             | 
  TokenFalse            | 
  TokenFrom             |
  TokenSelect           |
  TokenWhere            |
  TokenLBracket         |
  TokenRBracket         |
  TokenAnd              |
  TokenOr               | 
  TokenNot              |
  TokenEnd              |
  TokenComma            |
  TokenColon            |
  TokenBase String      |
  TokenPrefix String    | 
  TokenLURIBracket      |
  TokenRURIBracket      |
  TokenDot              |
  TokenSemiColon        |
  TokenParen            |
  TokenHyphen           |
  TokenInt Int          |
  TokenString String       
    deriving (Eq, Show)   
}
      