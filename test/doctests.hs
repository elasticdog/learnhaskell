import Test.DocTest

main :: IO ()
main = do
  doctest ["-isrc", "src/CIS194.hs"]
