module Route exposing (Route(..), router)

import Url
import Url.Parser as Parser exposing (Parser, oneOf, parse, s, top)


type Route
    = Home
    | About
    | Login
    | NotFound


parser : Parser (Route -> a) a
parser =
    oneOf
        [ Parser.map Home <| top
        , Parser.map Home <| s "home"
        , Parser.map About <| s "about"
        , Parser.map Login <| s "login"
        ]


router : Url.Url -> Route
router =
    parse parser
        >> Maybe.withDefault NotFound
