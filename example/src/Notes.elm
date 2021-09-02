

type alias Grid =
  { numberOfColumns : Int
  , columnWidth : Int
  , gutterWidth : Int
  , padding : Int
  }


mobile : List (Element msg) -> Layout msg
mobile =
  grid
    { numberOfColumns = 4
    , columnWidth = 64
    , gutterWidth = 30
    , padding = 15
    , baseline = 16
    }


tablet : List (Element msg) -> Layout msg
tablet =
  grid
    { numberOfColumns = 6
    , columnWidth = 60
    , gutterWidth = 30
    , padding = 15
    , baseline = 16
    }


screen : List (Element msg) -> Layout msg
screen =
  grid
    { numberOfColumns = 12
    , columnWidth = 65
    , gutterWidth = 30
    , padding = 15
    , baseline = 16
    }


main =
  layouts window
    [ mobile
    , tablet
    , screen
        [ row [] [ name, contact ]
        , row [] [ summary ]
        , row
            [ column [] []
            , column
                [ row [] [ education, education, education ]
                , row [] [ qualifiction, qualifiction, qualifiction ]
                , row [] [ experience, experience, experience ]
                ]
            ]
        ]
    ]


