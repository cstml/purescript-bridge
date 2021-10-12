module Main where

import Prelude

import Data.Argonaut.Core (stringify)
import Data.Argonaut.Decode (JsonDecodeError, decodeJson, parseJson, printJsonDecodeError)
import Data.Argonaut.Encode (encodeJson)
import Data.Either (Either(..))
import Effect (Effect)
import Node.Encoding (Encoding(..))
import Node.Process (exit, stdin, stdout)
import Node.Stream (cork, onDataString, writeString)
import RoundTrip.Types (TestData)

main :: Effect Unit
main = do
  onDataString stdin UTF8 \input ->
    let
      parsed :: Either JsonDecodeError TestData
      parsed = decodeJson =<< parseJson input
    in
      case parsed of
        Left err ->
          void $ writeString stdout UTF8 (show input <> "\n" <> printJsonDecodeError err) $ cork stdout *> exit 1
        Right testData ->
          void $ writeString stdout UTF8 (stringify $ encodeJson testData) $ cork stdout
