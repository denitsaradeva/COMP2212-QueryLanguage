{ 
module ToyTokens where 
}

%wrapper "basic" 
$digit = 0-9     
-- digits 
$alpha = [a-zA-Z]    
-- alphabetic characters

tokens :-
 $white+       ; 
 TRUE          {\s -> TokenTrue}
 FALSE         {\s -> TokenFalse}
 FROM
 SELECT
 WHERE
 AND
 OR
 NOT
 END
 \*
 \,
 \#
 $digit+       {\s -> TokenInt (read s)} 
 $alpha [$alpha $digit \_ \â€™]*   {\s -> TokenVar s } 




 \<            {\s -> TokenCompare}
 \+            {\s -> TokenSum}
 \:            {\s -> TokenColumn}
 \(            {\s -> TokenLBracket}
 \)            {\s -> TokenRBracket}
 if            {\s -> TokenIf}
 then          {\s -> TokenThen}
 else          {\s -> TokenElse}
 let           {\s -> TokenLet}
 in            {\s -> TokenIn}
 \=            {\s -> TokenEquals}
 \->           {\s -> TokenArrow}
 \\            {\s -> TokenLambda}
 Bool          {\s -> TokenTInt}
 Int           {\s -> TokenTBool}
 $digit+       {\s -> TokenInt (read s)} 
 $alpha [$alpha $digit \_ \â€™]*   {\s -> TokenVar s } 
 
 
{ 
data Token = 
  TokenTrue             | 
  TokenFalse            | 
  TokenCompare          |
  TokenInt Int          |
  TokenSum              |
  TokenColumn           |
  TokenLBracket         |
  TokenRBracket         |
  TokenIf               |
  TokenThen             | 
  TokenElse             |
  TokenIn               |
  TokenEquals           |
  TokenArrow            |
  TokenVar String       |
  TokenLambda           |
  TokenLet              | 
  TokenTBool            |
  TokenTInt
    deriving (Eq, Show)  
   
}
      