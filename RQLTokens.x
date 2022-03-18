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
 \,                                        {\s -> TokenComma}
 \:                                        {\s -> TokenColon}
 \@base                                    {\s -> TokenBase s}
 \@prefix                                  {\s -> TokenPrefix s}
 \<                                        {\s -> TokenLURIBracket}
 \>                                        {\s -> TokenRURIBracket}
 \.                                        {\s -> TokenDot}
 \;                                        {\s -> TokenSemiColon}
 \"                                        {\s -> TokenParen}
 \-                                        {\s -> TokenMinus}
 \+                                        {\s -> TokenPlus}
 $digit+                                   {\s -> TokenInt (read s)} 
 $alpha [$alpha $digit \_ \â€™\/\:\.\#]*   {\s -> TokenString s } 
 
 
{ 
data RQLToken = 
  TokenTrue             |
  TokenFalse            |
  TokenComma            |
  TokenColon            |
  TokenBase String      |
  TokenPrefix String    | 
  TokenLURIBracket      |
  TokenRURIBracket      |
  TokenDot              |
  TokenSemiColon        |
  TokenParen            |
  TokenMinus            |
  TokenPlus             |
  TokenInt Int          |
  TokenString String       
    deriving (Eq, Show)   
}
      