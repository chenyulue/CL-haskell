module Main (main) where
import Options.Applicative

data Args = Args Bool [String]

args :: Parser Args
args = Args
    <$> switch
       (  short 'n'
       <> help "Do not print newline")
    <*> some ( strArgument (
        metavar "TEXT..."
        <> help "Input text"
    ))

opts :: ParserInfo Args
opts = info ( args <**> helper ) 
            ( fullDesc
            <> progDesc "write arguments to the standard output"
            <> header "echoh - Haskell echo")

echo :: Args -> IO ()
echo (Args True strs) = putStr $ unwords strs
echo (Args False strs) = putStrLn $ unwords strs

main :: IO ()
main = execParser opts >>= echo
