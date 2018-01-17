{-# LANGUAGE TemplateHaskell #-}

module Main where

import           Protolude

import           Control.Monad (unless)
import           System.Exit (exitFailure)

import           Hedgehog
import qualified Hedgehog.Gen as Gen
import qualified Hedgehog.Range as Range

import           Control.Monad.Service

tests :: IO Bool
tests = checkParallel $$(discover)

main :: IO ()
main = do
  results <- tests
  unless results $
    System.Exit.exitFailure

prop_dummy :: Property
prop_dummy =
  withTests 1 . property $ do
    dummy === True

  

