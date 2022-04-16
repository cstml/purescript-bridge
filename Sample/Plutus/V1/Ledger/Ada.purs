-- File auto generated by purescript-bridge! --
module Plutus.V1.Ledger.Ada where

import Prelude

import ConstrIndices (class HasConstrIndices, constrIndices, fromConstr2Index)
import Data.BigInt (BigInt)
import Data.Generic.Rep (class Generic)
import Data.Lens (Iso', Lens', Prism', iso, prism')
import Data.Lens.Iso.Newtype (_Newtype)
import Data.Lens.Record (prop)
import Data.Maybe (Maybe(..))
import Data.Newtype (class Newtype)
import Data.Tuple (Tuple(..))
import Type.Proxy (Proxy(Proxy))

newtype Ada = Lovelace { getLovelace :: BigInt }

derive instance Generic Ada _

derive instance Newtype Ada _

instance HasConstrIndices Ada where
  constrIndices _ = fromConstr2Index [Tuple "Lovelace" 0]

--------------------------------------------------------------------------------

_Lovelace :: Iso' Ada {getLovelace :: BigInt}
_Lovelace = _Newtype