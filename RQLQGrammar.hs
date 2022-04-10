{-# OPTIONS_GHC -w #-}
module RQLQGrammar where 
import RQLQTokens 
import Data.List
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16
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
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,147) ([0,135,0,14336,4,0,0,0,0,0,1024,0,896,32,0,0,1,32768,2048,0,0,0,34560,0,0,0,0,0,0,0,0,8,0,0,16,0,0,0,0,768,0,0,0,0,112,0,0,0,0,512,0,0,16,0,32768,0,0,0,128,0,0,0,0,0,0,0,0,0,128,4,0,0,128,0,0,4,32768,3,0,384,249,0,2048,0,0,64,0,0,512,0,448,16,0,32782,0,0,0,0,0,32,0,16,0,0,1992,0,0,0,0,0,2,0,2048,0,0,64,0,0,0,0,0,0,0,0,0,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32,0,0,0,0,0,0,32768,0,0,1,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,512,0,0,16,0,0,512,0,36888,15,0,32896,0,0,8,0,8192,31,0,256,0,0,1992,0,0,0,0,0,0,0,16,0,0,0,0,0,0,0,0,0,16384,0,0,51200,7,0,0,0,0,1,0,0,0,0,256,0,512,0,0,0,0,2048,0,0,0,16,0,16384,62,0,56,0,0,4,0,32768,124,0,4096,0,0,7968,0,0,0,0,0,0,0,16,0,0,498,0,1024,0,0,31872,0,0,16,0,0,0,0,0,0,0,32,0,16384,62,0,2048,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseQuery","QueList","Que","SelectQue","ResourceQue","AliasQue","GeneralWhereQue","WhereQue","NormalWhereQue","UpdateQue","PrintQue","Literal","Triplets","StringExp","SELECT","WHERE","PRINT","IS","AS","AND","OR","UPDATE","BETWEEN","NOT","TO","subject","predicate","object","semiColon","comma","dollar","paren","lBracket","rBracket","minus","plus","true","false","int","str","%eof"]
        bit_start = st Prelude.* 43
        bit_end = (st Prelude.+ 1) Prelude.* 43
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..42]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (17) = happyShift action_3
action_0 (18) = happyShift action_4
action_0 (19) = happyShift action_5
action_0 (24) = happyShift action_6
action_0 (4) = happyGoto action_7
action_0 (5) = happyGoto action_8
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (17) = happyShift action_3
action_1 (18) = happyShift action_4
action_1 (19) = happyShift action_5
action_1 (24) = happyShift action_6
action_1 (5) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyFail (happyExpListPerState 2)

action_3 (42) = happyShift action_25
action_3 (6) = happyGoto action_22
action_3 (7) = happyGoto action_23
action_3 (8) = happyGoto action_24
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (28) = happyShift action_18
action_4 (29) = happyShift action_19
action_4 (30) = happyShift action_20
action_4 (42) = happyShift action_21
action_4 (9) = happyGoto action_15
action_4 (10) = happyGoto action_16
action_4 (11) = happyGoto action_17
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (42) = happyShift action_14
action_5 (13) = happyGoto action_13
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (30) = happyShift action_11
action_6 (42) = happyShift action_12
action_6 (12) = happyGoto action_10
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (43) = happyAccept
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (17) = happyShift action_3
action_8 (18) = happyShift action_4
action_8 (19) = happyShift action_5
action_8 (24) = happyShift action_6
action_8 (4) = happyGoto action_9
action_8 (5) = happyGoto action_8
action_8 _ = happyReduce_1

action_9 _ = happyReduce_2

action_10 _ = happyReduce_5

action_11 (27) = happyShift action_38
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (33) = happyShift action_37
action_12 _ = happyFail (happyExpListPerState 12)

action_13 _ = happyReduce_6

action_14 (31) = happyShift action_35
action_14 (32) = happyShift action_36
action_14 _ = happyFail (happyExpListPerState 14)

action_15 _ = happyReduce_4

action_16 (21) = happyShift action_32
action_16 (22) = happyShift action_33
action_16 (23) = happyShift action_34
action_16 _ = happyFail (happyExpListPerState 16)

action_17 _ = happyReduce_14

action_18 (20) = happyShift action_31
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (20) = happyShift action_30
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (20) = happyShift action_29
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (33) = happyShift action_28
action_21 _ = happyFail (happyExpListPerState 21)

action_22 _ = happyReduce_3

action_23 _ = happyReduce_7

action_24 _ = happyReduce_8

action_25 (21) = happyShift action_26
action_25 (32) = happyShift action_27
action_25 _ = happyReduce_9

action_26 (42) = happyShift action_63
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (42) = happyShift action_62
action_27 (7) = happyGoto action_61
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (28) = happyShift action_58
action_28 (29) = happyShift action_59
action_28 (30) = happyShift action_60
action_28 (15) = happyGoto action_57
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (25) = happyShift action_55
action_29 (26) = happyShift action_56
action_29 (34) = happyShift action_40
action_29 (37) = happyShift action_41
action_29 (38) = happyShift action_42
action_29 (39) = happyShift action_43
action_29 (40) = happyShift action_44
action_29 (41) = happyShift action_45
action_29 (14) = happyGoto action_54
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (34) = happyShift action_52
action_30 (16) = happyGoto action_53
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (34) = happyShift action_52
action_31 (16) = happyGoto action_51
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (42) = happyShift action_50
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (28) = happyShift action_18
action_33 (29) = happyShift action_19
action_33 (30) = happyShift action_20
action_33 (42) = happyShift action_21
action_33 (10) = happyGoto action_49
action_33 (11) = happyGoto action_17
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (28) = happyShift action_18
action_34 (29) = happyShift action_19
action_34 (30) = happyShift action_20
action_34 (42) = happyShift action_21
action_34 (10) = happyGoto action_48
action_34 (11) = happyGoto action_17
action_34 _ = happyFail (happyExpListPerState 34)

action_35 _ = happyReduce_29

action_36 (42) = happyShift action_14
action_36 (13) = happyGoto action_47
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (30) = happyShift action_46
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (34) = happyShift action_40
action_38 (37) = happyShift action_41
action_38 (38) = happyShift action_42
action_38 (39) = happyShift action_43
action_38 (40) = happyShift action_44
action_38 (41) = happyShift action_45
action_38 (14) = happyGoto action_39
action_38 _ = happyFail (happyExpListPerState 38)

action_39 _ = happyReduce_27

action_40 (42) = happyShift action_73
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (41) = happyShift action_72
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (41) = happyShift action_71
action_42 _ = happyFail (happyExpListPerState 42)

action_43 _ = happyReduce_35

action_44 _ = happyReduce_36

action_45 _ = happyReduce_31

action_46 (27) = happyShift action_70
action_46 _ = happyFail (happyExpListPerState 46)

action_47 _ = happyReduce_30

action_48 _ = happyReduce_15

action_49 _ = happyReduce_16

action_50 _ = happyReduce_13

action_51 _ = happyReduce_17

action_52 (42) = happyShift action_69
action_52 _ = happyFail (happyExpListPerState 52)

action_53 _ = happyReduce_18

action_54 _ = happyReduce_19

action_55 (35) = happyShift action_68
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (25) = happyShift action_67
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (20) = happyShift action_66
action_57 _ = happyFail (happyExpListPerState 57)

action_58 _ = happyReduce_37

action_59 _ = happyReduce_38

action_60 _ = happyReduce_39

action_61 _ = happyReduce_10

action_62 (32) = happyShift action_27
action_62 _ = happyReduce_9

action_63 (32) = happyShift action_64
action_63 _ = happyReduce_11

action_64 (42) = happyShift action_85
action_64 (8) = happyGoto action_84
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (25) = happyShift action_82
action_65 (26) = happyShift action_83
action_65 (34) = happyShift action_40
action_65 (37) = happyShift action_41
action_65 (38) = happyShift action_42
action_65 (39) = happyShift action_43
action_65 (40) = happyShift action_44
action_65 (41) = happyShift action_45
action_65 (14) = happyGoto action_81
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (34) = happyShift action_52
action_66 (42) = happyShift action_80
action_66 (16) = happyGoto action_79
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (35) = happyShift action_78
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (34) = happyShift action_40
action_68 (37) = happyShift action_41
action_68 (38) = happyShift action_42
action_68 (39) = happyShift action_43
action_68 (40) = happyShift action_44
action_68 (41) = happyShift action_45
action_68 (14) = happyGoto action_77
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (34) = happyShift action_76
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (34) = happyShift action_40
action_70 (37) = happyShift action_41
action_70 (38) = happyShift action_42
action_70 (39) = happyShift action_43
action_70 (40) = happyShift action_44
action_70 (41) = happyShift action_45
action_70 (14) = happyGoto action_75
action_70 _ = happyFail (happyExpListPerState 70)

action_71 _ = happyReduce_33

action_72 _ = happyReduce_32

action_73 (34) = happyShift action_74
action_73 _ = happyFail (happyExpListPerState 73)

action_74 _ = happyReduce_34

action_75 _ = happyReduce_28

action_76 _ = happyReduce_40

action_77 (32) = happyShift action_90
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (34) = happyShift action_40
action_78 (37) = happyShift action_41
action_78 (38) = happyShift action_42
action_78 (39) = happyShift action_43
action_78 (40) = happyShift action_44
action_78 (41) = happyShift action_45
action_78 (14) = happyGoto action_89
action_78 _ = happyFail (happyExpListPerState 78)

action_79 _ = happyReduce_21

action_80 (33) = happyShift action_88
action_80 _ = happyFail (happyExpListPerState 80)

action_81 _ = happyReduce_20

action_82 (35) = happyShift action_87
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (25) = happyShift action_86
action_83 _ = happyFail (happyExpListPerState 83)

action_84 _ = happyReduce_12

action_85 (21) = happyShift action_26
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (35) = happyShift action_96
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (34) = happyShift action_40
action_87 (37) = happyShift action_41
action_87 (38) = happyShift action_42
action_87 (39) = happyShift action_43
action_87 (40) = happyShift action_44
action_87 (41) = happyShift action_45
action_87 (14) = happyGoto action_95
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (28) = happyShift action_58
action_88 (29) = happyShift action_59
action_88 (30) = happyShift action_94
action_88 (15) = happyGoto action_93
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (32) = happyShift action_92
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (34) = happyShift action_40
action_90 (37) = happyShift action_41
action_90 (38) = happyShift action_42
action_90 (39) = happyShift action_43
action_90 (40) = happyShift action_44
action_90 (41) = happyShift action_45
action_90 (14) = happyGoto action_91
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (36) = happyShift action_100
action_91 _ = happyFail (happyExpListPerState 91)

action_92 (34) = happyShift action_40
action_92 (37) = happyShift action_41
action_92 (38) = happyShift action_42
action_92 (39) = happyShift action_43
action_92 (40) = happyShift action_44
action_92 (41) = happyShift action_45
action_92 (14) = happyGoto action_99
action_92 _ = happyFail (happyExpListPerState 92)

action_93 _ = happyReduce_22

action_94 _ = happyReduce_39

action_95 (32) = happyShift action_98
action_95 _ = happyFail (happyExpListPerState 95)

action_96 (34) = happyShift action_40
action_96 (37) = happyShift action_41
action_96 (38) = happyShift action_42
action_96 (39) = happyShift action_43
action_96 (40) = happyShift action_44
action_96 (41) = happyShift action_45
action_96 (14) = happyGoto action_97
action_96 _ = happyFail (happyExpListPerState 96)

action_97 (32) = happyShift action_103
action_97 _ = happyFail (happyExpListPerState 97)

action_98 (34) = happyShift action_40
action_98 (37) = happyShift action_41
action_98 (38) = happyShift action_42
action_98 (39) = happyShift action_43
action_98 (40) = happyShift action_44
action_98 (41) = happyShift action_45
action_98 (14) = happyGoto action_102
action_98 _ = happyFail (happyExpListPerState 98)

action_99 (36) = happyShift action_101
action_99 _ = happyFail (happyExpListPerState 99)

action_100 _ = happyReduce_23

action_101 _ = happyReduce_24

action_102 (36) = happyShift action_105
action_102 _ = happyFail (happyExpListPerState 102)

action_103 (34) = happyShift action_40
action_103 (37) = happyShift action_41
action_103 (38) = happyShift action_42
action_103 (39) = happyShift action_43
action_103 (40) = happyShift action_44
action_103 (41) = happyShift action_45
action_103 (14) = happyGoto action_104
action_103 _ = happyFail (happyExpListPerState 103)

action_104 (36) = happyShift action_106
action_104 _ = happyFail (happyExpListPerState 104)

action_105 _ = happyReduce_25

action_106 _ = happyReduce_26

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
happyReduction_4 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (Where happy_var_2
	)
happyReduction_4 _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_2  5 happyReduction_5
happyReduction_5 (HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (Update happy_var_2
	)
happyReduction_5 _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_2  5 happyReduction_6
happyReduction_6 (HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (Print happy_var_2
	)
happyReduction_6 _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  6 happyReduction_7
happyReduction_7 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (Resource happy_var_1
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_1  6 happyReduction_8
happyReduction_8 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn6
		 (Alias happy_var_1
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  7 happyReduction_9
happyReduction_9 (HappyTerminal (TokenString happy_var_1))
	 =  HappyAbsSyn7
		 ([happy_var_1]
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  7 happyReduction_10
happyReduction_10 (HappyAbsSyn7  happy_var_3)
	_
	(HappyTerminal (TokenString happy_var_1))
	 =  HappyAbsSyn7
		 ((happy_var_1:happy_var_3)
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  8 happyReduction_11
happyReduction_11 (HappyTerminal (TokenString happy_var_3))
	_
	(HappyTerminal (TokenString happy_var_1))
	 =  HappyAbsSyn8
		 ([(happy_var_3,happy_var_1)]
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happyReduce 5 8 happyReduction_12
happyReduction_12 ((HappyAbsSyn8  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (((happy_var_3,happy_var_1):happy_var_5)
	) `HappyStk` happyRest

happyReduce_13 = happySpecReduce_3  9 happyReduction_13
happyReduction_13 (HappyTerminal (TokenString happy_var_3))
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (WhereExp (happy_var_1,happy_var_3)
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_1  10 happyReduction_14
happyReduction_14 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (NormalWhereRequest happy_var_1
	)
happyReduction_14 _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  10 happyReduction_15
happyReduction_15 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (OrWhereRequest happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  10 happyReduction_16
happyReduction_16 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (AndWhereRequest happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  11 happyReduction_17
happyReduction_17 (HappyAbsSyn16  happy_var_3)
	_
	_
	 =  HappyAbsSyn11
		 (IsSubject happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  11 happyReduction_18
happyReduction_18 (HappyAbsSyn16  happy_var_3)
	_
	_
	 =  HappyAbsSyn11
		 (IsPredicate happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  11 happyReduction_19
happyReduction_19 (HappyAbsSyn14  happy_var_3)
	_
	_
	 =  HappyAbsSyn11
		 (IsObject happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happyReduce 5 11 happyReduction_20
happyReduction_20 ((HappyAbsSyn14  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (IsAliasLit (happy_var_1, Object) happy_var_5
	) `HappyStk` happyRest

happyReduce_21 = happyReduce 5 11 happyReduction_21
happyReduction_21 ((HappyAbsSyn16  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (IsAliasStr (happy_var_1, happy_var_3) happy_var_5
	) `HappyStk` happyRest

happyReduce_22 = happyReduce 7 11 happyReduction_22
happyReduction_22 ((HappyAbsSyn15  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString happy_var_5)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (IsAlias (happy_var_1, happy_var_3) (happy_var_5, happy_var_7)
	) `HappyStk` happyRest

happyReduce_23 = happyReduce 8 11 happyReduction_23
happyReduction_23 (_ `HappyStk`
	(HappyAbsSyn14  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (IsBetween (happy_var_5, happy_var_7)
	) `HappyStk` happyRest

happyReduce_24 = happyReduce 9 11 happyReduction_24
happyReduction_24 (_ `HappyStk`
	(HappyAbsSyn14  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (IsNotBetween (happy_var_6, happy_var_8)
	) `HappyStk` happyRest

happyReduce_25 = happyReduce 10 11 happyReduction_25
happyReduction_25 (_ `HappyStk`
	(HappyAbsSyn14  happy_var_9) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (IsBetweenAlias (happy_var_1, Object) (happy_var_7, happy_var_9)
	) `HappyStk` happyRest

happyReduce_26 = happyReduce 11 11 happyReduction_26
happyReduction_26 (_ `HappyStk`
	(HappyAbsSyn14  happy_var_10) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (IsNotBetweenAlias (happy_var_1, Object) (happy_var_8, happy_var_10)
	) `HappyStk` happyRest

happyReduce_27 = happySpecReduce_3  12 happyReduction_27
happyReduction_27 (HappyAbsSyn14  happy_var_3)
	_
	_
	 =  HappyAbsSyn12
		 (Updated happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happyReduce 5 12 happyReduction_28
happyReduction_28 ((HappyAbsSyn14  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (UpdatedAlias (happy_var_1, happy_var_5)
	) `HappyStk` happyRest

happyReduce_29 = happySpecReduce_2  13 happyReduction_29
happyReduction_29 _
	(HappyTerminal (TokenString happy_var_1))
	 =  HappyAbsSyn13
		 ([happy_var_1]
	)
happyReduction_29 _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  13 happyReduction_30
happyReduction_30 (HappyAbsSyn13  happy_var_3)
	_
	(HappyTerminal (TokenString happy_var_1))
	 =  HappyAbsSyn13
		 ((happy_var_1:happy_var_3)
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_1  14 happyReduction_31
happyReduction_31 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn14
		 (QInt happy_var_1
	)
happyReduction_31 _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_2  14 happyReduction_32
happyReduction_32 (HappyTerminal (TokenInt happy_var_2))
	_
	 =  HappyAbsSyn14
		 (QMinusInt happy_var_2
	)
happyReduction_32 _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_2  14 happyReduction_33
happyReduction_33 (HappyTerminal (TokenInt happy_var_2))
	_
	 =  HappyAbsSyn14
		 (QPlusInt happy_var_2
	)
happyReduction_33 _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  14 happyReduction_34
happyReduction_34 _
	(HappyTerminal (TokenString happy_var_2))
	_
	 =  HappyAbsSyn14
		 (QString happy_var_2
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_1  14 happyReduction_35
happyReduction_35 _
	 =  HappyAbsSyn14
		 (QBool True
	)

happyReduce_36 = happySpecReduce_1  14 happyReduction_36
happyReduction_36 _
	 =  HappyAbsSyn14
		 (QBool False
	)

happyReduce_37 = happySpecReduce_1  15 happyReduction_37
happyReduction_37 _
	 =  HappyAbsSyn15
		 (Subject
	)

happyReduce_38 = happySpecReduce_1  15 happyReduction_38
happyReduction_38 _
	 =  HappyAbsSyn15
		 (Predicate
	)

happyReduce_39 = happySpecReduce_1  15 happyReduction_39
happyReduction_39 _
	 =  HappyAbsSyn15
		 (Object
	)

happyReduce_40 = happySpecReduce_3  16 happyReduction_40
happyReduction_40 _
	(HappyTerminal (TokenString happy_var_2))
	_
	 =  HappyAbsSyn16
		 (happy_var_2
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 43 43 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenSelect -> cont 17;
	TokenWhere -> cont 18;
	TokenPrint -> cont 19;
	TokenIs -> cont 20;
	TokenAs -> cont 21;
	TokenAnd -> cont 22;
	TokenOr -> cont 23;
	TokenUpdate -> cont 24;
	TokenBetween -> cont 25;
	TokenNot -> cont 26;
	TokenTo -> cont 27;
	TokenSubject -> cont 28;
	TokenPredicate -> cont 29;
	TokenObject -> cont 30;
	TokenSemiColon -> cont 31;
	TokenComma -> cont 32;
	TokenDollar -> cont 33;
	TokenParen -> cont 34;
	TokenLBracket -> cont 35;
	TokenRBracket -> cont 36;
	TokenMinus -> cont 37;
	TokenPlus -> cont 38;
	TokenTrue -> cont 39;
	TokenFalse -> cont 40;
	TokenInt happy_dollar_dollar -> cont 41;
	TokenString happy_dollar_dollar -> cont 42;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 43 tk tks = happyError' (tks, explist)
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
