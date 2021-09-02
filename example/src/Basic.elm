module Basic exposing (..)

{-| -}

import Html
import Html.Attributes as HA
import Browser
import Element.Harmony as Element exposing (..)
import Element.Harmony.Background as Background
import Element.Harmony.Font as Font
import Element.Harmony.Border as Border
import Element.Harmony.Input as Input
import Element.Harmony.Lazy


main =
  Browser.sandbox
    { init = Model ""
    , update = update
    , view = view
    }


type alias Model =
  { subject : String }



type Msg
  = OnSubject String


update : Msg -> Model -> Model
update msg model =
  case msg of
    OnSubject str -> { model | subject = str }



-- VIEW


type alias Theme =
  { base : Int
  , fontSize : Int
  , scale : Float
  , light : Color
  , default : Color
  , hover : Color
  , disabled : Color
  , font : Color
  , border : Color
  , grayBackground : Color
  , grayFont : Color
  , rounding : Int
  }


theme : Theme
theme =
  { base = 4
  , fontSize = 14
  , scale = 1.3
  , light = rgb255 234 235 252
  , default = rgb255 87 69 227
  , hover = rgb255 64 52 158
  , disabled = rgb255 185 190 202
  , font = rgb255 100 86 196
  , border = rgb255 220 220 220
  , grayBackground = rgb255 250 250 250
  , grayFont = rgb255 180 180 180
  , rounding = 5
  }


view : Model -> Html.Html Msg
view model =
  layoutWith theme
    { options =
        [ focusStyle
            { borderColor = Just theme.border
            , backgroundColor = Nothing
            , shadow = Just
                { color = theme.light
                , offset = ( 0, 0 )
                , blur = 0
                , size = 5
                }
            }
        ]
    }
    [ Font.family
        [ Font.external
            { url = "https://fonts.googleapis.com/css?family=IBM+Plex+Sans"
            , name = "IBM Plex Sans"
            }
        , Font.sansSerif
        ]
    , width fill
    ]
    (content model)



content : Model -> Element Theme Msg
content model =
  column
    [ width (px 1000)
    , centerX
    ]
    [ row
        [ width fill
        ]
        [ column
            [ paddingXY 4 0
            , width fill
            , alignTop
            ]
            tasks
        , column
            [ paddingXY 4 4
            , width (fillPortion 2)
            , alignTop
            , spacing 2
            ]
            (form model)
        ]
    ]



-- TASKS


tasks : List (Element Theme Msg)
tasks =
  [ column
      [ paddingXY 0 4
      , spacing 2
      ]
      [ row [ Font.h4 ] [ text "Team Daily Task" ]
      , row [ spacing 1, Font.small ] [ tag "Design", tag "Running", tag "Development" ]
      ]
  , divider
  , column
      [ paddingXY 0 6
      , spacing 3
      , Font.normal
      , width fill
      ]
      [ row
          [ spacing 1, width fill ]
          [ el [ width fill ] (text "Material Design")
          , el [ width shrink ] (text "March 25")
          ]
      , row
          [ spacing 1, width fill ]
          [ el [ width fill ] (text "Prepare wireframes")
          , el [ width shrink ] (text "April 03")
          ]
      , row
          [ spacing 1, width fill ]
          [ el [ width fill ] (text "Send final proposal")
          , el [ width shrink ] (text "April 10")
          ]
      ]
  , divider
  , row
      [ paddingXY 0 4
      , spacing -3
      , width fill
      ]
      [ profile "A"
      , profile "B"
      , profile "C"
      ]
  ]



-- FORM


form : Model -> List (Element Theme Msg)
form model =
  [ row [ Font.h4 ] [ text "Write en e-mail" ]
  , divider
  , column
      [ paddingXY 0 2
      , width fill
      , spacing 4
      ]
      [ input "Subject" model.subject
      , textarea "Message" model.subject
      ]
  ]


-- COMPONENTS


input : String -> String -> Element Theme Msg
input name str =
  Input.text
    [ width fill
    , paddingXY 2 3
    , Border.color .border
    , Border.rounded .rounding
    , Font.normal
    ]
    { label =
        Input.labelAbove
          [ Font.small
          , Font.color .grayFont
          , paddingXY 0 1
          ]
          (text name)
    , onChange = OnSubject
    , placeholder = Just (Input.placeholder [ Font.normal, Font.color .grayFont ] (text name))
    , text = str
    }


textarea : String -> String -> Element Theme Msg
textarea name str =
  Input.multiline
    [ width fill
    , height (minimum (4 * 40) <| fill)
    , paddingXY 2 3
    , Border.color .border
    , Border.rounded .rounding
    , Font.normal
    ]
    { label =
        Input.labelAbove
          [ Font.small
          , Font.color .grayFont
          , paddingXY 0 1
          ]
          (text name)
    , onChange = OnSubject
    , placeholder = Just (Input.placeholder [ Font.normal, Font.color .grayFont ] (text name))
    , spellcheck = True
    , text = str
    }


divider : Element Theme Msg
divider =
  el
    [ Border.widthEach { top = 1, bottom = 0, left = 0, right = 0 }
    , Border.color .border
    , width fill
    ]
    none


tag : String -> Element Theme Msg
tag str =
  el
    [ Background.color .light
    , Font.color .font
    , Border.rounded .rounding
    , paddingXY 2 1
    ]
    (text str)


profile : String -> Element Theme Msg
profile str =
  el
    [ Background.color .grayBackground
    , Font.color .grayFont
    , Border.width 1
    , Border.color .border
    , Border.rounded (always 50)
    , Font.h4
    , paddingXY 2 1
    ]
    (text str)