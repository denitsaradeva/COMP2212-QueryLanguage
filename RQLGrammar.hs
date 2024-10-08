{-# OPTIONS_GHC -w #-}
module RQLGrammar where 
import RQLTokens 
import Data.List
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9
	= HappyTerminal (RQLToken)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,85) ([33792,3,3600,0,0,32768,0,64,0,8,64,0,16385,0,0,3600,0,0,0,1,4,0,1,32768,0,1,0,8,34920,3,384,2048,2,0,0,0,0,0,16385,1024,0,8,8192,0,0,0,4,0,0,8192,0,256,0,0,0,0,128,4096,0,0,0,0,0,2,256,1024,0,34920,3,0,0,0,512,0,0,8608,14,0,8192,0,4096,0,0,0,0,4,0,0,64,0,0,0,16,256,16384,0,0,2,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","ExpList","Exp","ObjectExpList","PredObjExpList","ObjectExp","URIExp","int","str","true","false","comma","colon","base","prefix","lURIBracket","rURIBracket","dot","semiColon","paren","minus","plus","abs","%eof"]
        bit_start = st Prelude.* 26
        bit_end = (st Prelude.+ 1) Prelude.* 26
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..25]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (11) = happyShift action_4
action_0 (16) = happyShift action_5
action_0 (17) = happyShift action_6
action_0 (18) = happyShift action_7
action_0 (4) = happyGoto action_8
action_0 (5) = happyGoto action_9
action_0 (9) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (11) = happyShift action_4
action_1 (16) = happyShift action_5
action_1 (17) = happyShift action_6
action_1 (18) = happyShift action_7
action_1 (5) = happyGoto action_2
action_1 (9) = happyGoto action_3
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyFail (happyExpListPerState 2)

action_3 (18) = happyShift action_7
action_3 (7) = happyGoto action_16
action_3 (9) = happyGoto action_17
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (15) = happyShift action_15
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (18) = happyShift action_7
action_5 (9) = happyGoto action_14
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (11) = happyShift action_13
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (11) = happyShift action_11
action_7 (25) = happyShift action_12
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (26) = happyAccept
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (11) = happyShift action_4
action_9 (16) = happyShift action_5
action_9 (17) = happyShift action_6
action_9 (18) = happyShift action_7
action_9 (4) = happyGoto action_10
action_9 (5) = happyGoto action_9
action_9 (9) = happyGoto action_3
action_9 _ = happyReduce_1

action_10 _ = happyReduce_2

action_11 (19) = happyShift action_32
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (11) = happyShift action_31
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (15) = happyShift action_30
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (20) = happyShift action_29
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (11) = happyShift action_28
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (20) = happyShift action_27
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (10) = happyShift action_20
action_17 (12) = happyShift action_21
action_17 (13) = happyShift action_22
action_17 (18) = happyShift action_23
action_17 (22) = happyShift action_24
action_17 (23) = happyShift action_25
action_17 (24) = happyShift action_26
action_17 (6) = happyGoto action_18
action_17 (8) = happyGoto action_19
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (20) = happyShift action_43
action_18 (21) = happyShift action_44
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (14) = happyShift action_41
action_19 (20) = happyShift action_42
action_19 _ = happyReduce_9

action_20 _ = happyReduce_15

action_21 _ = happyReduce_18

action_22 _ = happyReduce_19

action_23 (11) = happyShift action_39
action_23 (25) = happyShift action_40
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (11) = happyShift action_38
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (10) = happyShift action_37
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (10) = happyShift action_36
action_26 _ = happyFail (happyExpListPerState 26)

action_27 _ = happyReduce_7

action_28 (11) = happyShift action_35
action_28 _ = happyFail (happyExpListPerState 28)

action_29 _ = happyReduce_4

action_30 (18) = happyShift action_7
action_30 (9) = happyGoto action_34
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (19) = happyShift action_33
action_31 _ = happyFail (happyExpListPerState 31)

action_32 _ = happyReduce_22

action_33 _ = happyReduce_21

action_34 (20) = happyShift action_53
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (15) = happyShift action_52
action_35 _ = happyFail (happyExpListPerState 35)

action_36 _ = happyReduce_16

action_37 _ = happyReduce_17

action_38 (22) = happyShift action_51
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (19) = happyShift action_50
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (11) = happyShift action_49
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (10) = happyShift action_20
action_41 (12) = happyShift action_21
action_41 (13) = happyShift action_22
action_41 (18) = happyShift action_23
action_41 (22) = happyShift action_24
action_41 (23) = happyShift action_25
action_41 (24) = happyShift action_26
action_41 (6) = happyGoto action_47
action_41 (8) = happyGoto action_48
action_41 _ = happyFail (happyExpListPerState 41)

action_42 _ = happyReduce_5

action_43 _ = happyReduce_6

action_44 (18) = happyShift action_7
action_44 (7) = happyGoto action_45
action_44 (9) = happyGoto action_46
action_44 _ = happyFail (happyExpListPerState 44)

action_45 _ = happyReduce_12

action_46 (10) = happyShift action_20
action_46 (12) = happyShift action_21
action_46 (13) = happyShift action_22
action_46 (18) = happyShift action_23
action_46 (22) = happyShift action_24
action_46 (23) = happyShift action_25
action_46 (24) = happyShift action_26
action_46 (6) = happyGoto action_56
action_46 (8) = happyGoto action_48
action_46 _ = happyFail (happyExpListPerState 46)

action_47 _ = happyReduce_10

action_48 (14) = happyShift action_41
action_48 _ = happyReduce_9

action_49 (19) = happyShift action_55
action_49 _ = happyFail (happyExpListPerState 49)

action_50 _ = happyReduce_14

action_51 _ = happyReduce_20

action_52 (11) = happyShift action_54
action_52 _ = happyFail (happyExpListPerState 52)

action_53 _ = happyReduce_3

action_54 (11) = happyShift action_57
action_54 _ = happyFail (happyExpListPerState 54)

action_55 _ = happyReduce_13

action_56 (21) = happyShift action_44
action_56 _ = happyReduce_11

action_57 (15) = happyShift action_58
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (11) = happyShift action_59
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (20) = happyShift action_60
action_59 _ = happyFail (happyExpListPerState 59)

action_60 _ = happyReduce_8

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 ([happy_var_1]
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_2  4 happyReduction_2
happyReduction_2 (HappyAbsSyn4  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 ((happy_var_1:happy_var_2)
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happyReduce 5 5 happyReduction_3
happyReduction_3 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (Prefix happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_4 = happySpecReduce_3  5 happyReduction_4
happyReduction_4 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (Base happy_var_2
	)
happyReduction_4 _ _ _  = notHappyAtAll 

happyReduce_5 = happyReduce 4 5 happyReduction_5
happyReduction_5 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	(HappyAbsSyn9  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (Triple happy_var_1 happy_var_2 happy_var_3
	) `HappyStk` happyRest

happyReduce_6 = happyReduce 4 5 happyReduction_6
happyReduction_6 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	(HappyAbsSyn9  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (ObjMTriple happy_var_1 happy_var_2 happy_var_3
	) `HappyStk` happyRest

happyReduce_7 = happySpecReduce_3  5 happyReduction_7
happyReduction_7 _
	(HappyAbsSyn7  happy_var_2)
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn5
		 (PredObjMTriple happy_var_1 happy_var_2
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happyReduce 10 5 happyReduction_8
happyReduction_8 (_ `HappyStk`
	(HappyTerminal (TokenString happy_var_9)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString happy_var_7)) `HappyStk`
	(HappyTerminal (TokenString happy_var_6)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString happy_var_4)) `HappyStk`
	(HappyTerminal (TokenString happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (SubPrefix happy_var_1 happy_var_3 happy_var_4 happy_var_6 happy_var_7 happy_var_9
	) `HappyStk` happyRest

happyReduce_9 = happySpecReduce_1  6 happyReduction_9
happyReduction_9 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn6
		 ([happy_var_1]
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  6 happyReduction_10
happyReduction_10 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn6
		 ((happy_var_1:happy_var_3)
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_2  7 happyReduction_11
happyReduction_11 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn7
		 ([(happy_var_1,happy_var_2)]
	)
happyReduction_11 _ _  = notHappyAtAll 

happyReduce_12 = happyReduce 4 7 happyReduction_12
happyReduction_12 ((HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_2) `HappyStk`
	(HappyAbsSyn9  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (((happy_var_1, happy_var_2):happy_var_4)
	) `HappyStk` happyRest

happyReduce_13 = happyReduce 4 8 happyReduction_13
happyReduction_13 (_ `HappyStk`
	(HappyTerminal (TokenString happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (AbsURI happy_var_3
	) `HappyStk` happyRest

happyReduce_14 = happySpecReduce_3  8 happyReduction_14
happyReduction_14 _
	(HappyTerminal (TokenString happy_var_2))
	_
	 =  HappyAbsSyn8
		 (URI happy_var_2
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_1  8 happyReduction_15
happyReduction_15 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn8
		 (Int happy_var_1
	)
happyReduction_15 _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_2  8 happyReduction_16
happyReduction_16 (HappyTerminal (TokenInt happy_var_2))
	_
	 =  HappyAbsSyn8
		 (PlusInt happy_var_2
	)
happyReduction_16 _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_2  8 happyReduction_17
happyReduction_17 (HappyTerminal (TokenInt happy_var_2))
	_
	 =  HappyAbsSyn8
		 (MinusInt happy_var_2
	)
happyReduction_17 _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  8 happyReduction_18
happyReduction_18 _
	 =  HappyAbsSyn8
		 (Bool True
	)

happyReduce_19 = happySpecReduce_1  8 happyReduction_19
happyReduction_19 _
	 =  HappyAbsSyn8
		 (Bool False
	)

happyReduce_20 = happySpecReduce_3  8 happyReduction_20
happyReduction_20 _
	(HappyTerminal (TokenString happy_var_2))
	_
	 =  HappyAbsSyn8
		 (String happy_var_2
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happyReduce 4 9 happyReduction_21
happyReduction_21 (_ `HappyStk`
	(HappyTerminal (TokenString happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (AbsExpr happy_var_3
	) `HappyStk` happyRest

happyReduce_22 = happySpecReduce_3  9 happyReduction_22
happyReduction_22 _
	(HappyTerminal (TokenString happy_var_2))
	_
	 =  HappyAbsSyn9
		 (URIExpr happy_var_2
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 26 26 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenInt happy_dollar_dollar -> cont 10;
	TokenString happy_dollar_dollar -> cont 11;
	TokenTrue -> cont 12;
	TokenFalse -> cont 13;
	TokenComma -> cont 14;
	TokenColon -> cont 15;
	TokenBase happy_dollar_dollar -> cont 16;
	TokenPrefix happy_dollar_dollar -> cont 17;
	TokenLURIBracket -> cont 18;
	TokenRURIBracket -> cont 19;
	TokenDot -> cont 20;
	TokenSemiColon -> cont 21;
	TokenParen -> cont 22;
	TokenMinus -> cont 23;
	TokenPlus -> cont 24;
	TokenAbsolute -> cont 25;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 26 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(RQLToken)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parseCalc tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [RQLToken] -> a
parseError ts = error ("Error on tokens: " ++ (show ts))

data TurtleExp = Prefix String URIExp
               | Base URIExp
               | Triple URIExp URIExp Object
               | ObjMTriple URIExp URIExp [Object]
               | PredObjMTriple URIExp [(URIExp, [Object])]
               | SubPrefix String String String String String String
          deriving Show

data Object = Int Int
            | String String
            | Bool Bool
            | MinusInt Int
            | PlusInt Int
            | URI String
            | AbsURI String
          deriving Show

data URIExp = URIExpr String
            | AbsExpr String
          deriving Show
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
