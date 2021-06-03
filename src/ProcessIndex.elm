module ProcessIndex exposing (view)


import Element exposing (Element)

import Element.Background
import Element.Border
import Element.Font as Font
import Pages
import Pages.ImagePath as ImagePath
import Palette



view model = Element.row
        [ Element.width Element.fill
         , Element.spacing 10
        , Element.centerX

        ]
        [ todo
        , inProcess
        , done
        ]

header text=
    Element.el
                [ Element.width Element.fill
                , Element.centerX
                , Element.centerX
                , Font.extraBold
                , Font.size 28
                , Font.color (Element.rgba255 0 0 0 0.7)
                ]
                (Element.text text)

boardEl color=
    Element.column
    [ Element.width Element.fill
                  ,Element.height <| Element.px 600
    , Element.spacing 30
    , Element.padding 10
    , Element.Border.width 1
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
            , Element.Border.shadow
                                  { offset = ( 1, 2 )
                                  , blur = 1
                                  , size = 2
                                  , color =
                                          Element.rgb (238 / 255) (238 / 255) (238 / 255)
                                  }
            , Element.mouseOver
                [  Element.Border.shadow
                                                    { offset = ( 2, 4 )
                                                    , blur = 1
                                                    , size = 4
                                                    , color =
                                                            Element.rgb (238 / 255) (238 / 255) (238 / 255)
                                                    }]

            ]
            [a]

todo : Element msg
todo =
    boardEl (Element.rgba255 240 242 250 0.3)
            [ header "To Do"
            , todoCard1
            , todoCard2]


todoCard1 =
    cardEl (Element.rgb255 255 255 255)
        (Element.text ("To Do item"))

todoCard2 =
    cardEl (Element.rgb255 255 255 255)
        (Element.text ("To Do item"))

inProcess : Element msg
inProcess =
    boardEl (Element.rgb255 255 255 255)
        [ header "Doing"
        , cardEl (Element.rgba255 240 242 250 0.3)
                               (Element.text ("Done item"))
        , cardEl (Element.rgba255 240 242 250 0.3)
                                (Element.text ("Done item"))]

done : Element msg
done =
    boardEl (Element.rgba255 240 242 250 0.3)
            [ header "Done"
            , cardEl (Element.rgb255 255 255 255)
                     (Element.text ("Done item"))
            , cardEl (Element.rgb255 255 255 255)
                      (Element.text ("Done item"))
            ]