{-# LANGUAGE ApplicativeDo #-}

module Main (main) where

import AirPort.Power (getPowerState, setPowerState, togglePowerState)
import Control.Monad (void)
import Prelude       (IO, (.), (<$>), (=<<))

main :: IO ()
main = void . setPowerState <$> togglePowerState =<< getPowerState
