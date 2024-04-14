module Main (main) where

import System.Exit (exitWith, ExitCode(..))

main :: IO ()
main = exitWith (ExitFailure 1)