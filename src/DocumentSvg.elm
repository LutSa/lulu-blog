module DocumentSvg exposing (view)

import Color exposing (Color)
import Element exposing (Element)
import Svg exposing (..)
import Svg.Attributes exposing (..)


strokeColor : String
strokeColor =
    "black"


pageTextColor : String
pageTextColor =
    "black"


fillColor : String
fillColor =
    "url(#grad1)"


fillGradient : Svg msg
fillGradient =
    gradient
        (Color.rgb255 5 117 230)
        (Color.rgb255 0 242 96)


gradient : Color -> Color -> Svg msg
gradient color1 color2 =
    linearGradient
        [ id "grad1"
        , x1 "0%"
        , y1 "0%"
        , x2 "100%"
        , y2 "0%"
        ]
        [ stop
            [ offset "10%"
            , Svg.Attributes.style ("stop-color:" ++ Color.toCssString color1 ++ ";stop-opacity:1")
            ]
            []
        , stop
            [ offset "100%"
            , Svg.Attributes.style ("stop-color:" ++ Color.toCssString color2 ++ ";stop-opacity:1")
            ]
            []
        ]


view : Element msg
view =
    Element.el [] (Element.text "")
