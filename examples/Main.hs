module Main (main) where

import Spec.Int
import Spec.IntArrow
import Spec.IntArrowConstraint
import Spec.IntConstraint
import Spec.IntPair
import Spec.IntPermutationGen
import Spec.Plutarch.CostModel
import Spec.Plutarch.MagicNumber
import Test.Tasty

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests =
  testGroup
    "all tests"
    [ testGroup
        "Int model Hand Written Parameterised Generator"
        [ intGenTests
        , intPureTests
        , intPlutarchTests
        ]
    , testGroup
        "Int model using Permutation Generator"
        [ intPermutationGenTests
        , intPermutationGenPureTests
        , intPermutationGenPlutarchTests
        , intPermutationGenSelfTests
        ]
    , testGroup
        "IntPair composite model"
        [ intPairGenSelfTests
        , intPairGenSelfTests
        , intPairGenPureTests
        , intPairGenPlutarchTests
        ]
    , testGroup
        "Script As Object"
        [ magicNumberPropGenTests
        , addCostPropGenTests
        , addCostModelPlutarchTests
        ]
    , testGroup
        "Arrow test"
        [ intArrowPlutarchTests
        ]
    , testGroup
        "Constraint Test"
        [ intConstraintPlutarchTests
        ]
    , testGroup
        "Arrow and Constraint composition Test"
        [ intArrowConstraintPlutarchTests
        ]
    ]
