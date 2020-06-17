module Main exposing (..)

import Browser exposing (application)
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Page.About as About
import Page.Home as Home
import Route
import Url


main : Program () Model Msg
main =
    application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        }



-- MODEL


type alias Model =
    { key : Nav.Key
    , url : Url.Url
    , page : PageModel
    }


type PageModel
    = Home Home.Model
    | About About.Model


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init _ url key =
    case Route.router url of
        Route.Home ->
            ( { key = key
              , url = url
              , page = Home ()
              }
            , Cmd.none
            )

        Route.About ->
            ( { key = key
              , url = url
              , page = About ()
              }
            , Cmd.none
            )



-- UPDATE


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        UrlChanged url ->
            case Route.router url of
                Route.Home ->
                    ( { model | url = url, page = Home () }
                    , Cmd.none
                    )

                Route.About ->
                    ( { model | url = url, page = About () }
                    , Cmd.none
                    )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- VIEW


view : Model -> Browser.Document Msg
view model =
    case model.page of
        Home m ->
            Home.view m

        About m ->
            About.view m


footer : Html msg
footer =
    ul []
        [ viewLink "/home"
        , viewLink "/about"
        ]


viewLink : String -> Html msg
viewLink path =
    li [] [ a [ href path ] [ text path ] ]
