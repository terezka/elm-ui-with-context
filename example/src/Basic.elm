module Basic exposing (..)

{-| -}

import Element.Harmony as Element exposing (..)
import Element.Harmony.Background as Background
import Element.Harmony.Font as Font
import Element.Harmony.Border as Border
import Element.Harmony.Input
import Element.Harmony.Lazy



type alias Theme =
  { base : Int
  , scale : Float
  , light : Color
  , default : Color
  , hover : Color
  , disabled : Color
  , font : Color
  , rounding : Int
  }


theme : Theme
theme =
  { base = 16
  , scale = 1.5
  , light = rgb255 234 235 252
  , default = rgb255 87 69 227
  , hover = rgb255 64 52 158
  , disabled = rgb255 185 190 202
  , font = rgb255 100 86 196
  , rounding = 5
  }


main =
    layout theme
        [ Font.family
            [ Font.external
                { url = "https://fonts.googleapis.com/css?family=IBM+Plex+Sans"
                , name = "IBM Plex Sans"
                }
            , Font.sansSerif
            ]
        , width fill
        ]
        content


content : Element Theme msg
content =
    column
      [ padding 0.25
      , spacing 0.5
      , width (px 328)
      , centerX
      ]
      [ column
          [ spacing 0.5 ]
          [ row [ Font.h3 ] [ text "Team Daily Task" ]
          , row [ spacing 0.25, Font.small ] [ tag "Design", tag "Running", tag "Development" ]
          ]
      --, divider []
      , column
          [ spacing 0.25, Font.normal, width fill ]
          [ row
              [ spacing 0.25, width fill ]
              [ el [ width fill ] (text "Material Design")
              , el [ width shrink ] (text "March 25")
              ]
          , row
              [ spacing 0.25 ]
              [ text "Prepare wireframes", text "April 03" ]
          ]
      ]


tag : String -> Element Theme msg
tag str =
  el [ Background.color .light, Font.color .font, Border.rounded .rounding, paddingXY 0.5 0.25 ] (text str)
