module Route exposing (Route(..), router)

import Url


type Route
    = Home
    | About


router : Url.Url -> Route
router url =
    case url.path of
        "/home" ->
            Home

        "/about" ->
            About

        _ ->
            Home
