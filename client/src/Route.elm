module Route exposing (Route(..), router)

import Url
import Url.Parser as Parser exposing (Parser, oneOf, parse, s, top)



-- ROUTING


type Route
    = Home
    | About
    | NotFound


parser : Parser (Route -> a) a
parser =
    oneOf
        [ Parser.map Home top
        , Parser.map Home <| s "home"
        , Parser.map About <| s "about"
        ]


router : Url.Url -> Route
router url =
    Maybe.withDefault NotFound (parse parser url)
