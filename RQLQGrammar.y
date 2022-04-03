{ 
module RQLQGrammar where 
import RQLQTokens 
import Data.List
}

%name parseQuery
%tokentype { RQLQToken } 
%error { parseError }
%token 
  SELECT                                 {TokenSelect}
  WHERE                                  {TokenWhere}
  PRINT                                  {TokenPrint}
  IS                                     {TokenIs}
  AS                                     {TokenAs}
  AND                                    {TokenAnd}
  OR                                     {TokenOr}
  UPDATE                                 {TokenUpdate}
  BETWEEN                                {TokenBetween}
  NOT                                    {TokenNot}
  TO                                     {TokenTo}
  subject                                {TokenSubject}
  predicate                              {TokenPredicate}
  object                                 {TokenObject}
  semiColon                              {TokenSemiColon}
  comma                                  {TokenComma}
  dollar                                 {TokenDollar}
  paren                                  {TokenParen}
  lBracket                               {TokenLBracket}
  rBracket                               {TokenRBracket}
  minus                                  {TokenMinus}
  plus                                   {TokenPlus}
  true                                   {TokenTrue}
  false                                  {TokenFalse}
  int                                    {TokenInt $$}
  str                                    {TokenString $$} 

%nonassoc IS
%left AND OR
%nonassoc true false int str minus plus paren semiColon comma AS object
%%

QueList : Que                            {[$1]}
        | Que QueList                    {($1:$2)}

Que : SELECT SelectQue                   {Select $2}
    | WHERE GeneralWhereQue              {Where $2}
    | UPDATE UpdateQue                   {Update $2}
    | PRINT PrintQue                     {Print $2}

----------------------------------------------------------------------------------------------
SelectQue : ResourceQue                  {Resource $1}
          | AliasQue                     {Alias $1}

ResourceQue : str                        {[$1]}
            | str comma ResourceQue      {($1:$3)}

AliasQue : str AS str                    {[($1,$3)]}
         | str AS str comma AliasQue     {(($1,$3):$5)}

----------------------------------------------------------------------------------------------
GeneralWhereQue : WhereQue AS str                            {WhereExp ($1,$3)}

WhereQue : NormalWhereQue                                    {NormalWhereRequest $1}
         | WhereQue OR WhereQue                              {OrWhereRequest $1 $3}
         | WhereQue AND WhereQue                             {AndWhereRequest $1 $3}

NormalWhereQue : subject IS StringExp                                                {IsSubject $3}
               | predicate IS StringExp                                           {IsPredicate $3}
               | object IS Literal                                                {IsObject $3}
               | str dollar object IS Literal                                     {IsAliasLit ($1, Object) $5}
               | str dollar Triplets IS StringExp                                  {IsAliasStr ($1, $3) $5}
               | str dollar Triplets IS str dollar Triplets                        {IsAlias ($1, $3) ($5, $7)}
               | object IS BETWEEN lBracket Literal comma Literal rBracket                  {IsBetween ($5, $7)}
               | object IS NOT BETWEEN lBracket Literal comma Literal rBracket              {IsNotBetween ($6, $8)}
               | str dollar object IS BETWEEN lBracket Literal comma Literal rBracket       {IsBetweenAlias ($1, Object) ($7, $9)}
               | str dollar object IS NOT BETWEEN lBracket Literal comma Literal rBracket   {IsNotBetweenAlias ($1, Object) ($8, $10)}

----------------------------------------------------------------------------------------------
UpdateQue : object TO Literal                {Updated $3}
          | str dollar object TO Literal     {UpdatedAlias ($1, $5)}

----------------------------------------------------------------------------------------------
PrintQue : str semiColon                 {[$1]}
         | str comma PrintQue            {($1:$3)}

----------------------------------------------------------------------------------------------
Literal : int                            {Int $1}
        | minus int                      {MinusInt $2}
        | plus int                       {PlusInt $2}
        | paren str paren                {String $2}
        | true                           {Bool True}
        | false                          {Bool False}

Triplets : subject                       {Subject}
         | predicate                     {Predicate}
         | object                        {Object}

StringExp : paren str paren              {$2}

{ 

parseError :: [RQLQToken] -> a
parseError ts = error ("Error on tokens: " ++ (show ts))


data Query = Select SelectType
           | Where WhereExp
           | Update UpdateExp
           | Print [String]
        deriving Show

data SelectType = Alias [(String, String)]
                | Resource [String]
            deriving Show

data WhereExp = WhereExp (WhereType, String)
           deriving Show

data WhereType = NormalWhereRequest ConditionalType
               | OrWhereRequest WhereType WhereType
               | AndWhereRequest WhereType WhereType
            deriving Show

data ConditionalType = IsSubject String 
                     | IsPredicate String
                     | IsObject LiteralType
                     | IsAlias (String, Triplet) (String, Triplet)
                     | IsAliasLit (String, Triplet) LiteralType
                     | IsAliasStr (String, Triplet) String
                     | IsBetween (LiteralType, LiteralType)
                     | IsBetweenAlias (String, Triplet) (LiteralType, LiteralType)
                     | IsNotBetween (LiteralType, LiteralType)
                     | IsNotBetweenAlias (String, Triplet) (LiteralType, LiteralType)
                deriving Show

data UpdateExp = Updated LiteralType
               | UpdatedAlias (String, LiteralType)
            deriving Show

data Triplet = Subject
             | Predicate
             | Object
           deriving Show

data LiteralType = Int Int
                 | MinusInt Int
                 | PlusInt Int
                 | String String
                 | Bool Bool
               deriving Show
} 