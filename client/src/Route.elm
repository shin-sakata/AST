module Route exposing (Route(..), router)

import Url
import Url.Parser as Parser exposing (Parser, oneOf, parse, s, top)


type Route
    = Home
    | About
    | NotFound


parser : Parser (Route -> a) a
parser =
    oneOf
        [ Parser.map Home <| top
        , Parser.map Home <| s "home"
        , Parser.map About <| s "about"
        ]


router : Url.Url -> Route
router =
    parse parser
        >> Maybe.withDefault NotFound
