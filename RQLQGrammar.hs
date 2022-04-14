{-# OPTIONS_GHC -w #-}
module RQLQGrammar where 
import RQLQTokens 
import Data.List
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13
	= HappyTerminal (RQLQToken)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,103) ([57344,16,0,4320,0,0,0,0,0,16384,0,0,64,0,16384,0,0,64,0,0,57344,16,0,0,0,0,0,0,0,32,0,0,0,0,24,0,0,0,3584,0,0,0,0,0,32,0,0,0,512,0,0,0,64,0,7,0,0,64,0,16384,0,0,64,0,0,0,0,64,0,4,0,128,0,0,0,0,0,0,0,0,0,0,0,256,0,0,0,0,0,0,0,0,0,0,16,0,0,64,24576,32320,0,16384,62,0,0,0,0,64,0,8192,0,0,32,0,0,0,0,0,0,0,0,0,0,0,128,0,32,0,0,32,0,0,0,0,7,0,32768,0,0,15936,0,0,0,0,0,0,16384,0,0,0,0,4096,0,0,15936,0,0,0,0,16,0,16384,62,0,256,0,16384,62,0,256,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseQuery","QueList","Que","SelectQue","GeneralWhereQue","WhereQue","NormalWhereQue","UpdateQue","PrintQue","Literal","Triplets","SELECT","WHERE","PRINT","IS","AS","AND","OR","UPDATE","BETWEEN","NOT","TO","subject","predicate","object","semiColon","comma","dollar","paren","lBracket","rBracket","minus","plus","true","false","int","str","%eof"]
        bit_start = st Prelude.* 40
        bit_end = (st Prelude.+ 1) Prelude.* 40
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..39]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (14) = happyShift action_3
action_0 (15) = happyShift action_4
action_0 (16) = happyShift action_5
action_0 (21) = happyShift action_6
action_0 (4) = happyGoto action_7
action_0 (5) = happyGoto action_8
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (14) = happyShift action_3
action_1 (15) = happyShift action_4
action_1 (16) = happyShift action_5
action_1 (21) = happyShift action_6
action_1 (5) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyFail (happyExpListPerState 2)

action_3 (39) = happyShift action_19
action_3 (6) = happyGoto action_18
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (39) = happyShift action_17
action_4 (7) = happyGoto action_14
action_4 (8) = happyGoto action_15
action_4 (9) = happyGoto action_16
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (39) = happyShift action_13
action_5 (11) = happyGoto action_12
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (39) = happyShift action_11
action_6 (10) = happyGoto action_10
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (40) = happyAccept
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (14) = happyShift action_3
action_8 (15) = happyShift action_4
action_8 (16) = happyShift action_5
action_8 (21) = happyShift action_6
action_8 (4) = happyGoto action_9
action_8 (5) = happyGoto action_8
action_8 _ = happyReduce_1

action_9 _ = happyReduce_2

action_10 _ = happyReduce_5

action_11 (30) = happyShift action_27
action_11 _ = happyFail (happyExpListPerState 11)

action_12 _ = happyReduce_6

action_13 (28) = happyShift action_25
action_13 (29) = happyShift action_26
action_13 _ = happyFail (happyExpListPerState 13)

action_14 _ = happyReduce_4

action_15 (18) = happyShift action_22
action_15 (19) = happyShift action_23
action_15 (20) = happyShift action_24
action_15 _ = happyFail (happyExpListPerState 15)

action_16 _ = happyReduce_10

action_17 (30) = happyShift action_21
action_17 _ = happyFail (happyExpListPerState 17)

action_18 _ = happyReduce_3

action_19 (18) = happyShift action_20
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (39) = happyShift action_37
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (25) = happyShift action_34
action_21 (26) = happyShift action_35
action_21 (27) = happyShift action_36
action_21 (13) = happyGoto action_33
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (39) = happyShift action_32
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (39) = happyShift action_17
action_23 (8) = happyGoto action_31
action_23 (9) = happyGoto action_16
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (39) = happyShift action_17
action_24 (8) = happyGoto action_30
action_24 (9) = happyGoto action_16
action_24 _ = happyFail (happyExpListPerState 24)

action_25 _ = happyReduce_18

action_26 (39) = happyShift action_13
action_26 (11) = happyGoto action_29
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (27) = happyShift action_28
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (24) = happyShift action_40
action_28 _ = happyFail (happyExpListPerState 28)

action_29 _ = happyReduce_19

action_30 _ = happyReduce_11

action_31 _ = happyReduce_12

action_32 _ = happyReduce_9

action_33 (17) = happyShift action_39
action_33 _ = happyFail (happyExpListPerState 33)

action_34 _ = happyReduce_26

action_35 _ = happyReduce_27

action_36 _ = happyReduce_28

action_37 (29) = happyShift action_38
action_37 _ = happyReduce_7

action_38 (39) = happyShift action_19
action_38 (6) = happyGoto action_52
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (22) = happyShift action_49
action_39 (23) = happyShift action_50
action_39 (31) = happyShift action_42
action_39 (34) = happyShift action_43
action_39 (35) = happyShift action_44
action_39 (36) = happyShift action_45
action_39 (37) = happyShift action_46
action_39 (38) = happyShift action_47
action_39 (39) = happyShift action_51
action_39 (12) = happyGoto action_48
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (31) = happyShift action_42
action_40 (34) = happyShift action_43
action_40 (35) = happyShift action_44
action_40 (36) = happyShift action_45
action_40 (37) = happyShift action_46
action_40 (38) = happyShift action_47
action_40 (12) = happyGoto action_41
action_40 _ = happyFail (happyExpListPerState 40)

action_41 _ = happyReduce_17

action_42 (39) = happyShift action_58
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (38) = happyShift action_57
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (38) = happyShift action_56
action_44 _ = happyFail (happyExpListPerState 44)

action_45 _ = happyReduce_24

action_46 _ = happyReduce_25

action_47 _ = happyReduce_20

action_48 _ = happyReduce_13

action_49 (32) = happyShift action_55
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (22) = happyShift action_54
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (30) = happyShift action_53
action_51 _ = happyFail (happyExpListPerState 51)

action_52 _ = happyReduce_8

action_53 (25) = happyShift action_34
action_53 (26) = happyShift action_35
action_53 (27) = happyShift action_36
action_53 (13) = happyGoto action_62
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (32) = happyShift action_61
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (31) = happyShift action_42
action_55 (34) = happyShift action_43
action_55 (35) = happyShift action_44
action_55 (36) = happyShift action_45
action_55 (37) = happyShift action_46
action_55 (38) = happyShift action_47
action_55 (12) = happyGoto action_60
action_55 _ = happyFail (happyExpListPerState 55)

action_56 _ = happyReduce_22

action_57 _ = happyReduce_21

action_58 (31) = happyShift action_59
action_58 _ = happyFail (happyExpListPerState 58)

action_59 _ = happyReduce_23

action_60 (29) = happyShift action_64
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (31) = happyShift action_42
action_61 (34) = happyShift action_43
action_61 (35) = happyShift action_44
action_61 (36) = happyShift action_45
action_61 (37) = happyShift action_46
action_61 (38) = happyShift action_47
action_61 (12) = happyGoto action_63
action_61 _ = happyFail (happyExpListPerState 61)

action_62 _ = happyReduce_14

action_63 (29) = happyShift action_66
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (31) = happyShift action_42
action_64 (34) = happyShift action_43
action_64 (35) = happyShift action_44
action_64 (36) = happyShift action_45
action_64 (37) = happyShift action_46
action_64 (38) = happyShift action_47
action_64 (12) = happyGoto action_65
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (33) = happyShift action_68
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (31) = happyShift action_42
action_66 (34) = happyShift action_43
action_66 (35) = happyShift action_44
action_66 (36) = happyShift action_45
action_66 (37) = happyShift action_46
action_66 (38) = happyShift action_47
action_66 (12) = happyGoto action_67
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (33) = happyShift action_69
action_67 _ = happyFail (happyExpListPerState 67)

action_68 _ = happyReduce_15

action_69 _ = happyReduce_16

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

happyReduce_3 = happySpecReduce_2  5 happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (Select happy_var_2
	)
happyReduction_3 _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_2  5 happyReduction_4
happyReduction_4 (HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (Where happy_var_2
	)
happyReduction_4 _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_2  5 happyReduction_5
happyReduction_5 (HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (Update happy_var_2
	)
happyReduction_5 _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_2  5 happyReduction_6
happyReduction_6 (HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (Print happy_var_2
	)
happyReduction_6 _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  6 happyReduction_7
happyReduction_7 (HappyTerminal (TokenString happy_var_3))
	_
	(HappyTerminal (TokenString happy_var_1))
	 =  HappyAbsSyn6
		 ([(happy_var_3,happy_var_1)]
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happyReduce 5 6 happyReduction_8
happyReduction_8 ((HappyAbsSyn6  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (((happy_var_3,happy_var_1):happy_var_5)
	) `HappyStk` happyRest

happyReduce_9 = happySpecReduce_3  7 happyReduction_9
happyReduction_9 (HappyTerminal (TokenString happy_var_3))
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 ((happy_var_3,happy_var_1)
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_1  8 happyReduction_10
happyReduction_10 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (NormalWhereRequest happy_var_1
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  8 happyReduction_11
happyReduction_11 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (OrWhereRequest happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  8 happyReduction_12
happyReduction_12 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (AndWhereRequest happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happyReduce 5 9 happyReduction_13
happyReduction_13 ((HappyAbsSyn12  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (IsLit (happy_var_1, happy_var_3) happy_var_5
	) `HappyStk` happyRest

happyReduce_14 = happyReduce 7 9 happyReduction_14
happyReduction_14 ((HappyAbsSyn13  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString happy_var_5)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (Is (happy_var_1, happy_var_3) (happy_var_5, happy_var_7)
	) `HappyStk` happyRest

happyReduce_15 = happyReduce 10 9 happyReduction_15
happyReduction_15 (_ `HappyStk`
	(HappyAbsSyn12  happy_var_9) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (IsBetween (happy_var_1, happy_var_3) (happy_var_7, happy_var_9)
	) `HappyStk` happyRest

happyReduce_16 = happyReduce 11 9 happyReduction_16
happyReduction_16 (_ `HappyStk`
	(HappyAbsSyn12  happy_var_10) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (IsNotBetween (happy_var_1, happy_var_3) (happy_var_8, happy_var_10)
	) `HappyStk` happyRest

happyReduce_17 = happyReduce 5 10 happyReduction_17
happyReduction_17 ((HappyAbsSyn12  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 ((happy_var_1, happy_var_5)
	) `HappyStk` happyRest

happyReduce_18 = happySpecReduce_2  11 happyReduction_18
happyReduction_18 _
	(HappyTerminal (TokenString happy_var_1))
	 =  HappyAbsSyn11
		 ([happy_var_1]
	)
happyReduction_18 _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  11 happyReduction_19
happyReduction_19 (HappyAbsSyn11  happy_var_3)
	_
	(HappyTerminal (TokenString happy_var_1))
	 =  HappyAbsSyn11
		 ((happy_var_1:happy_var_3)
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  12 happyReduction_20
happyReduction_20 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn12
		 (QInt happy_var_1
	)
happyReduction_20 _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_2  12 happyReduction_21
happyReduction_21 (HappyTerminal (TokenInt happy_var_2))
	_
	 =  HappyAbsSyn12
		 (QMinusInt happy_var_2
	)
happyReduction_21 _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_2  12 happyReduction_22
happyReduction_22 (HappyTerminal (TokenInt happy_var_2))
	_
	 =  HappyAbsSyn12
		 (QPlusInt happy_var_2
	)
happyReduction_22 _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  12 happyReduction_23
happyReduction_23 _
	(HappyTerminal (TokenString happy_var_2))
	_
	 =  HappyAbsSyn12
		 (QString happy_var_2
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  12 happyReduction_24
happyReduction_24 _
	 =  HappyAbsSyn12
		 (QBool True
	)

happyReduce_25 = happySpecReduce_1  12 happyReduction_25
happyReduction_25 _
	 =  HappyAbsSyn12
		 (QBool False
	)

happyReduce_26 = happySpecReduce_1  13 happyReduction_26
happyReduction_26 _
	 =  HappyAbsSyn13
		 (Subject
	)

happyReduce_27 = happySpecReduce_1  13 happyReduction_27
happyReduction_27 _
	 =  HappyAbsSyn13
		 (Predicate
	)

happyReduce_28 = happySpecReduce_1  13 happyReduction_28
happyReduction_28 _
	 =  HappyAbsSyn13
		 (Object
	)

happyNewToken action sts stk [] =
	action 40 40 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenSelect -> cont 14;
	TokenWhere -> cont 15;
	TokenPrint -> cont 16;
	TokenIs -> cont 17;
	TokenAs -> cont 18;
	TokenAnd -> cont 19;
	TokenOr -> cont 20;
	TokenUpdate -> cont 21;
	TokenBetween -> cont 22;
	TokenNot -> cont 23;
	TokenTo -> cont 24;
	TokenSubject -> cont 25;
	TokenPredicate -> cont 26;
	TokenObject -> cont 27;
	TokenSemiColon -> cont 28;
	TokenComma -> cont 29;
	TokenDollar -> cont 30;
	TokenParen -> cont 31;
	TokenLBracket -> cont 32;
	TokenRBracket -> cont 33;
	TokenMinus -> cont 34;
	TokenPlus -> cont 35;
	TokenTrue -> cont 36;
	TokenFalse -> cont 37;
	TokenInt happy_dollar_dollar -> cont 38;
	TokenString happy_dollar_dollar -> cont 39;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 40 tk tks = happyError' (tks, explist)
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
happyError' :: () => ([(RQLQToken)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parseQuery tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [RQLQToken] -> a
parseError ts = error ("Error on tokens: " ++ (show ts))


data Query = Select [(String, String)]
           | Where (String, WhereType)
           | Update (String, LiteralType)
           | Print [String]
        deriving Show

data WhereType = NormalWhereRequest ConditionalType
               | OrWhereRequest WhereType WhereType
               | AndWhereRequest WhereType WhereType
            deriving Show

data ConditionalType = Is (String, Triplet) (String, Triplet)
                     | IsLit (String, Triplet) LiteralType
                     | IsBetween (String, Triplet) (LiteralType, LiteralType)
                     | IsNotBetween (String, Triplet) (LiteralType, LiteralType)
                deriving Show

data Triplet = Subject
             | Predicate
             | Object
           deriving Show

data LiteralType = QInt Int
                 | QMinusInt Int
                 | QPlusInt Int
                 | QString String
                 | QBool Bool
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
