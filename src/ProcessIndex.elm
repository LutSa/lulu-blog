module ProcessIndex exposing (view)


import Element exposing (Element)

import Element.Background
import Element.Border
import Element.Font as Font
import Pages
import Pages.ImagePath as ImagePath
import Palette



view model =
    [ todo
    , inProcess
    , done
    ]
    |> Element.row
        [ Element.width Element.fill
        , Element.spacing 10
        , Element.centerX
        ]


header text=
    Element.text text
    |> Element.el
         [ Element.width Element.fill
         , Element.centerX
         , Element.centerX
         , Font.extraBold
         , Font.size 28
         , Font.color (Element.rgba255 0 0 0 0.7)
         ]

boardEl color=
    Element.column
    [ Element.width Element.fill
    , Element.spacing 30
    , Element.height Element.fill
    , Element.padding 10
    , Element.Border.width 1
    , Element.alignTop
    , Element.scrollbars
    , Element.Background.color color
    , Element.Border.color (Element.rgba255 0 0 0 0.1)
    , Element.mouseOver
    [ Element.Border.color (Element.rgba255 0 0 0 0.2)]
    ]

cardEl color a=
    Element.paragraph
            [ Element.width Element.fill
            , Element.height <| Element.px 200
            , Element.Background.color color
            , Element.padding 8
            , Font.extraLight
            , Font.color (Element.rgba255 0 0 0 0.7)
            , Element.Border.shadow
                                  { offset = ( 1, 2 )
                                  , blur = 1
                                  , size = 2
                                  , color = Element.rgb (238 / 255) (238 / 255) (238 / 255)
                                  }
            , Element.mouseOver
                [  Element.Border.shadow
                                                    { offset = ( 2, 4 )
                                                    , blur = 1
                                                    , size = 4
                                                    , color = Element.rgb (238 / 255) (238 / 255) (238 / 255)
                                                    }]

            ]
            [a]

todoCard text=
    cardEl (Element.rgb255 255 255 255) (Element.text text)

todo : Element msg
todo =
    boardEl (Element.rgba255 240 242 250 0.3)
            [ header "To Do"
            , todoCard "Complete functions of this GSoC blog"
            ]

inProcessCard text=
    cardEl (Element.rgba255 240 242 250 0.3) (Element.text text)

inProcess : Element msg
inProcess =
    boardEl (Element.rgb255 255 255 255)
        [ header "Doing"
        , inProcessCard "Clarify HTML fallback spec"
        , inProcessCard "Write blog posts and github discussions"
        ]

doneCard text=
    cardEl (Element.rgb255 255 255 255) (Element.text text)

done : Element msg
done =
    boardEl (Element.rgba255 240 242 250 0.3)
            [ header "Done"
            , doneCard "Set up this GSoC blog by elm-pages and elm-ui"
            , doneCard "Learn parsing technologies from elm-review and elm-syntax"
            , doneCard "Wrap around my previous elm games by elm-pages and create-elm-app"
            ]