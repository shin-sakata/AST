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
import Html exposing (..)
import Html.Attributes exposing (..)
import Session exposing (Session)
import Bulma as B



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
    [ section [ B.section ]
        [ layout
        ]
    ]


layout : Html msg
layout =
    div [ B.columns ]
        [ div [ B.column, B.isHalf, B.isCentered, B.isOffsetOneFifth ]
            [ h1 [ B.title ] [ text "Login" ]
            , container
            ]
        ]


container : Html msg
container =
    div [ B.container ]
        [ div [ B.box ]
            [ field "Email" "email" "ex@mple.com"
            , field "Password" "password" "password"
            ]
        ]


field : String -> String -> String -> Html msg
field label__ type__ placeholder__ =
    div [ B.field ]
        [ label [ B.label ] [ text label__ ]
        , div [ B.control ] [ input [ B.input, type_ type__, placeholder placeholder__ ] [] ]
        ]



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
