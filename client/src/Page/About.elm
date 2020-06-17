module Page.About exposing (Model, view)

import Browser
import Html exposing (..)


type alias Model =
    ()


view : Model -> Browser.Document msg
view _ =
    { title = "about"
    , body = [ h1 [] [ text "About!" ] ]
    }
