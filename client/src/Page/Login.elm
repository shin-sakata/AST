module Page.Login exposing
    ( Model
    , Msg(..)
    , init
    , subscriptions
    , toSession
    , update
    , view
    )

import Browser
import Bulma as B
import Html exposing (..)
import Html.Attributes exposing (..)
import Layout exposing (navigationBar)
import Session exposing (Session)



-- MODEL


type alias Model =
    Session


toSession : Model -> Session
toSession =
    identity


init : Session -> ( Model, Cmd Msg )
init sess =
    ( sess, Cmd.none )



-- UPDATE


type Msg
    = None


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        None ->
            ( model, Cmd.none )



-- VIEW


view : Model -> Browser.Document msg
view _ =
    { title = "Login"
    , body = body
    }


body : List (Html msg)
body =
    [ navigationBar
    , section [ B.section ]
        [ layout
        ]
    ]


layout : Html msg
layout =
    div [] [ container ]


container : Html msg
container =
    div [ B.container, style "max-width" "500px" ]
        [ h1 [ B.title ] [ text "Login" ]
        , loginBox
        ]


loginBox : Html msg
loginBox =
    div [ B.box ]
        [ emailField
        , passwordField
        ]


emailField : Html msg
emailField =
    div [ B.field ]
        [ label [ B.label ] [ text "Emal" ]
        , p [ class "control has-icons-left has-icons-right" ]
            [ input [ class "input", placeholder "Email", type_ "email" ] []
            , span [ class "icon is-small is-left" ]
                [ i [ class "fas fa-envelope" ] [] ]
            ]
        ]


passwordField : Html msg
passwordField =
    div [ B.field ]
        [ label [ B.label ] [ text "Password" ]
        , p [ class "control has-icons-left has-icons-right" ]
            [ input [ class "input", placeholder "Password", type_ "password" ] []
            , span [ class "icon is-small is-left" ]
                [ i [ class "fas fa-lock" ] [] ]
            ]
        ]



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
