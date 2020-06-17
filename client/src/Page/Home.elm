module Page.Home exposing (Model, view)

import Browser
import Html exposing (..)


type alias Model =
    ()


view : Model -> Browser.Document msg
view _ =
    { title = "home"
    , body = [ h1 [] [ text "Home!" ] ]
    }
