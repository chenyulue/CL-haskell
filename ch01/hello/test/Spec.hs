import System.Process
import System.Exit
import Test.Hspec

stackCmd :: String -> IO (ExitCode, String, String)
stackCmd cmd = readCreateProcessWithExitCode (shell $ "stack exec " <> cmd) []

main :: IO ()
main = hspec $ do
    describe "Running commands" $ do
        it "of `hello`" $ do
            (exitCode, out, _) <- stackCmd "hello.exe"
            exitCode `shouldBe` ExitSuccess
            out `shouldBe` "Hello, World!\n"
        it "of `true`" $ do
            (exitCode, _, _) <- stackCmd "true.exe"
            exitCode `shouldBe` ExitSuccess
        it "of `false`" $ do
            (exitCode, _, _) <- stackCmd "false.exe"
            exitCode `shouldBe` ExitFailure 1

            
    
