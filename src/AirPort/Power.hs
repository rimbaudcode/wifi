module AirPort.Power
  ( PowerState
  , getPowerState
  , setPowerState
  , togglePowerState
  ) where

import           Data.List      (isInfixOf)
import           Prelude
import           System.Process (readProcess)

data PowerState = On | Off deriving (Eq, Show)

network :: FilePath
network = "/usr/sbin/networksetup"

getPowerState :: IO PowerState
getPowerState = outStr2State <$> readProcess network args ""
  where
    args = ["-getairportpower", "en1"]
    outStr2State outStr
      | "On" `isInfixOf` outStr = On
      | otherwise               = Off

setPowerState :: PowerState -> IO String
setPowerState state = readProcess network args ""
  where
    args = ["-setairportpower", "en1", show state]

togglePowerState :: PowerState -> PowerState
togglePowerState state
  | state == On = Off
  | otherwise   = On
