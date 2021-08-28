module Basic exposing (..)

{-| -}

import Element.Harmony as Element exposing (..)
import Element.Harmony.Background as Background
import Element.Harmony.Font as Font
import Element.Harmony.Input
import Element.Harmony.Lazy


main =
    Element.layout { base = 16, scale = 1.5 }
        [ Background.color (rgba 0 0 0 1)
        , Font.color (rgba 1 1 1 1)
        , Font.italic
        , Font.size 32
        , Font.family
            [ Font.external
                { url = "https://fonts.googleapis.com/css?family=EB+Garamond"
                , name = "EB Garamond"
                }
            , Font.sansSerif
            ]
        ]
    <|
        el
            [ centerX, centerY ]
            (text "Hello stylish friend!")
